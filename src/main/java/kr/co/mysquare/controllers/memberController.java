package kr.co.mysquare.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;







import kr.co.mysquare.dao.LocationDao;
import kr.co.mysquare.dao.MemberDao;
import kr.co.mysquare.dao.ReviewDao;
import kr.co.mysquare.dto.Bookmark;
import kr.co.mysquare.dto.Following;
import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.Member;
import kr.co.mysquare.dto.Review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberController 
{
	// 메인 매뉴에서 GET방식으로 데이터를 받을때 매뉴를 이동
	@Autowired
	private SqlSession sqlSession;
	// 세션에 담겨져 있는 ID 값을 전달 받아 DB의 데이터를 뿌려줌
	
	public void updateSideMenu(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		String id = (String) session.getAttribute("id");
		if( id == null ) return;
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		LocationDao locationDao = sqlSession.getMapper(LocationDao.class);
		
		List<Following> followingList = memberDao.following(id);
		List<Bookmark> myBookmark = memberDao.getMyBookmark(id);
		
		List<Location> myFavoriteLocation = new ArrayList<Location>();
		
		for( Bookmark bk : myBookmark )
		{
			Location location = new Location();
			location = locationDao.getLocById( bk.getLocName() );
			myFavoriteLocation.add(location);
		}
		
		model.addAttribute("followingList", followingList);
		model.addAttribute("myFavoriteLocation", myFavoriteLocation);
	}
	
	@RequestMapping(value={"memberDetail.htm"})
	public String memberDetail(String id, Model model, HttpSession session ) throws ClassNotFoundException, SQLException
	{ //id는 detail의 아이디, followerId는 로그인한 아이디
		MemberDao MemberDao = sqlSession.getMapper(MemberDao.class);
		
		String followerId = (String) session.getAttribute("id"); //내아이디
		
		if( followerId != null )
		{
			int isFollowerId = MemberDao.isFollowedId(followerId, id);
			
			model.addAttribute("isFollowerId", isFollowerId);
		}
		Member detailMember = MemberDao.select(id);
		List<Bookmark> detailBookmarkList = MemberDao.getMyBookmark(id);
		List<Following> detailFollowingList = MemberDao.following(id);
	    List<Review> detailRevList = MemberDao.Review(id);
	    
	    updateSideMenu(session,model);
	    
	    model.addAttribute("detailMember", detailMember); //detail 본인 정보
	    model.addAttribute("detailBookmarkList", detailBookmarkList); //detail 본인 북마크리스트
	    model.addAttribute("detailFollowingList", detailFollowingList); //detail 본인 팔로잉리스트
		model.addAttribute("detailRevList", detailRevList); //detail 본인 리뷰 리스트
		
		return "member.memberDetail";
	}
	// 수정 페이지 에서 데이터를 받아서 수정 쿼리 처리
	@RequestMapping(value={"memberEdit.htm"}, method=RequestMethod.POST)
	public String memberEdit(Member member) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : " + member.getId());
		MemberDao MemberDao = sqlSession.getMapper(MemberDao.class);
		MemberDao.update(member);

		return "redirect:memberDetail.htm?id=" + member.getId();
	}
	// 메인에서 페이지 이동시 get 방식일 경우 페이지 이동 처리
	@RequestMapping(value={"memberEdit.htm"}, method=RequestMethod.GET)
	public String memberEdit(String id, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController  get edit : " + id);
		MemberDao MemberDao = sqlSession.getMapper(MemberDao.class);
		Member member = MemberDao.select(id);
		
		updateSideMenu(session,model);
		
		model.addAttribute("member", member);
		return "member.memberEdit";
	}
	// POST 방식으로 받아온 데이터를 DB에 저장
	@RequestMapping(value={"memberJoin.htm"}, method=RequestMethod.POST)
	public String memberJoin(Member member,HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : " + member.getId());
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.insert(member);
		
		updateSideMenu(session,model);
		
		return "member.memberLogin";
	}
	// 로그인 화면에서 Join 버튼을 누르면 GET 방식으로 페이지 이동
	@RequestMapping(value={"memberJoin.htm"}, method=RequestMethod.GET)
	public String memberJoin(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		updateSideMenu(session,model);
		
		return "member.memberJoin";
	}
	// 로그인 화면 페이지 이동
	@RequestMapping(value={"memberLogin.htm"}, method=RequestMethod.GET)
	public String memberLogin(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		updateSideMenu(session,model);
		return "member.memberLogin";
	}
	// 아이디와 페스워드를 통한 로그인 로직 실행
	@RequestMapping(value={"memberLogin.htm"}, method=RequestMethod.POST)
	public String memberLogin(String id, String pwd, HttpSession session, Model model ) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController Login : "+ id+" "+ pwd );
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.select(id);
		if(member == null ) {
			System.out.println("실패 null값임");
			return "redirect:memberLogin.htm?alert=1";
		}
		else if(member.getPwd().equals(pwd)){
			System.out.println("성공");
			session.setAttribute("id",id);
			updateSideMenu(session,model);
		}
		else{
			System.out.println("실패");
			return "redirect:memberLogin.htm?alert=2";
		}
		return "redirect:main.htm";
	}
	// 삭제 페이지로 이동
	@RequestMapping(value={"memberDelete.htm"}, method=RequestMethod.GET)
	public String memberDelete(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		updateSideMenu(session,model);
		
		return "member.memberDelete";
	}
	// 세션에 입력된 아이디 값을 통하여 삭제 실행
	@RequestMapping(value={"memberDelete.htm"}, method=RequestMethod.POST)
	public String memberDelete(String id) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController Delete : " + id);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ReviewDao rdao = sqlSession.getMapper(ReviewDao.class);
		dao.delete1bookmark(id);
		dao.delete2FOLLOWING(id);
		dao.delete3REVRECOMM(id);
	/*	
		for(Review rv : Review)
			{
			rdao.deleteComm(rv.getRevCode());
			}*/
		rdao.deleteComm1(id);
		List<Review> Review = dao.Review(id);
		for(Review rv : Review)
		{
		dao.delete4Review(rv.getRevCode());
		}
		/*dao.delete4Review(id);*/
		dao.delete5MEMBER(id);
		System.out.println("memberController Delete : ff" + id);
		return "redirect:memberLoginOut.htm";
	}
	//세션에 있는 데이터를 지우고 로그아웃을 실행
	@RequestMapping(value={"memberLoginOut.htm"})
	public String memberLoginOut(HttpSession session) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberloginout.htm");
		session.invalidate();
		return "redirect:main.htm";
	}
	
	@RequestMapping("addBookmark.htm")
	public String addBookmark(HttpSession session, String locName, Model model) throws ClassNotFoundException, SQLException
	{
		String id = (String) session.getAttribute("id");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		dao.addBookmark(locName, id);
		
		model.addAttribute("locName", locName);
		
		return "redirect:locDetail.htm";
	}
	
	@RequestMapping("deleteBookmark.htm")
	public String deleteBookmark(HttpSession session, String locName, Model model) throws ClassNotFoundException, SQLException
	{
		String id = (String) session.getAttribute("id");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		dao.deleteBookmark(locName, id);
		
		model.addAttribute("locName", locName);
		
		
		return "redirect:locDetail.htm";
	}
	
	@RequestMapping("likeReview.htm")
	public String likeReview(int revCode, HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		String id = (String) session.getAttribute("id");
		
		memberDao.likeReview(id, revCode);
		
		model.addAttribute("revCode", revCode);
		
		return "redirect:reviewDetail.htm";
	}
	
	/*canclelikeReview.htm?revCode=${review.revCode}*/
	@RequestMapping("canclelikeReview.htm")
	public String canclelikeReview(int revCode, HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		String id = (String) session.getAttribute("id");
		
		memberDao.canclelikeReview(id, revCode);
		
		model.addAttribute("revCode", revCode);
		
		return "redirect:reviewDetail.htm";
	}
	
	@RequestMapping("follow.htm")
	public String follow(String followingId, HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		String followerId = (String) session.getAttribute("id"); //내아이디
		
		int isFollowedId = memberDao.isFollowedId(followerId, followingId);
		
		if( isFollowedId == 0 ) memberDao.addFollowing(followerId, followingId);
		
		model.addAttribute("id", followingId); //따라가는 사람 아이디
		return "redirect:memberDetail.htm";
	}
	
	/*unfollow.htm?followingId=${member.id*/
	@RequestMapping("unfollow.htm")
	public String unfollow(String followingId, HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		String followerId = (String) session.getAttribute("id"); //내아이디
		memberDao.unFollowing(followerId, followingId);
		
		model.addAttribute("id", followingId); //따라가는 사람 아이디
		return "redirect:memberDetail.htm";
	}

}//end of memberController class