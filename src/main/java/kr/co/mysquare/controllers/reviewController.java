package kr.co.mysquare.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.mysquare.dao.LocationDao;
import kr.co.mysquare.dao.MemberDao;
import kr.co.mysquare.dao.ReviewDao;
import kr.co.mysquare.dto.Bookmark;
import kr.co.mysquare.dto.Comm;
import kr.co.mysquare.dto.Following;
import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.RevGroup;
import kr.co.mysquare.dto.Review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class reviewController 
{
	@Autowired
	private SqlSession sqlSession;
	
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
	
	@RequestMapping("reviewDetail.htm")
	public String reviewDetail(Model model,int revCode, HttpSession session) throws ClassNotFoundException, SQLException
	{	
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		String id = (String) session.getAttribute("id");
		
		if( id != null )
		{
			int isLikedReview = memberDao.isLikedReivew(id, revCode);
			
			model.addAttribute("isLikedReview", isLikedReview);
		}
		int likeNum = reviewDao.getLikeNum(revCode); 
		Review review = reviewDao.getReviewByRevCode(revCode);
		List<Comm> commList = reviewDao.getAllCommByRevCode(revCode);
		RevGroup revGroup = reviewDao.getRevGroupName(review.getRevGroupCode());
		
		String revGroupName = revGroup.getRevGroupName();
		
		updateSideMenu(session,model);
		
		model.addAttribute("revGroupName", revGroupName);
		model.addAttribute("likeNum", likeNum);
		model.addAttribute("review", review);
		model.addAttribute("commList", commList);
		
		return "review.reviewDetail";
	}//end of reviewDetail.htm

	@RequestMapping(value={"reviewEdit.htm"}, method=RequestMethod.GET)
	public String reviewEdit(Model model, HttpSession session, int revCode) throws ClassNotFoundException, SQLException
	{
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		Review review = reviewDao.getReviewByRevCode(revCode);
		
		List<RevGroup> revGroupList = reviewDao.getRevGroup();
		
		model.addAttribute("review", review);
		model.addAttribute("revGroupList", revGroupList);
		
		updateSideMenu(session,model);
		
		return "review.reviewEdit";
	}//end of reviewEdit  -- get
	
	@RequestMapping(value={"reviewEdit.htm"}, method=RequestMethod.POST)
	public String reviewEditProcess(Review review, Model model, HttpSession session, HttpServletRequest request) throws ClassNotFoundException, SQLException,  IOException
	{
		if( !review.getFile().isEmpty() ) //파일을 첨부했을 때 
		{
			String fname = review.getFile().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/image");
			String fpath = path + "\\" + fname;
			
			//System.out.println("review.getFile : " + review.getFile());
			//System.out.println("fname : " + fname);
			//System.out.println("path : " + path);
			//System.out.println("fpath : " + fpath);
			
			//파일 쓰기 작업
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(review.getFile().getBytes());
			fs.close();
			review.setRevImage(fname); //DB파일명 기록
			
		}
		else
		{
			review.setRevImage("");
		}
		
		review.setRevContents( review.getRevContents().replace("\r\n", "<br>") );
		/*
		System.out.println("revImage : " + review.getRevImage());
		System.out.println("revCode : " + review.getRevCode());
		System.out.println("locName : " + review.getLocName() );
		System.out.println( "id : " + review.getId() );
		System.out.println("revGroupCode : " + review.getRevGroupCode() );
		System.out.println("revName : " + review.getRevName());
		System.out.println("revContents : " + review.getRevContents());*/
		
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		reviewDao.reviewEdit(review);
		
		model.addAttribute("revCode", review.getRevCode() );
		
		return "redirect:reviewDetail.htm";
	}//end of reviewEditProcess -- post
	
	@RequestMapping(value={"reviewWrite.htm"},method=RequestMethod.GET)
	public String reviewWriteForm(String locName, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		List<RevGroup> revGroupList = reviewDao.getRevGroup();
		
		updateSideMenu(session,model);
		
		model.addAttribute("revGroupList", revGroupList);
		model.addAttribute("locName", locName);

		return "review.reviewWrite";
	}//end of reviewWriteForm() -- get
	
	@RequestMapping(value={"reviewWrite.htm"},method=RequestMethod.POST)
	public String reviewWrite(Review review, HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException, IOException
	{
		
		if( !review.getFile().isEmpty() ) //파일을 첨부했을 때 
		{
			String fname = review.getFile().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/image");
			String fpath = path + "\\" + fname;
			
			//System.out.println("review.getFile : " + review.getFile());
			//System.out.println("fname : " + fname);
			//System.out.println("path : " + path);
			//System.out.println("fpath : " + fpath);
			
			//파일 쓰기 작업
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(review.getFile().getBytes());
			fs.close();
			review.setRevImage(fname); //DB파일명 기록
			//System.out.println("revImage : " + review.getRevImage());
		}
		else
		{
			review.setRevImage("");
		}
		
		review.setRevContents( review.getRevContents().replace("\r\n", "<br>") );
		/*
		System.out.println("바꾸기 전 : " + review.getRevContents() );
		System.out.println("바꾼 후 : " + change);
		*/
		
		
		
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		reviewDao.insertReview(review);
		
		model.addAttribute("locName", review.getLocName());
		
		return "redirect:locDetail.htm";
	}//end of reviewWriteForm() -- post
	
	@RequestMapping("commWrite.htm")
	public String commWrite(Comm comm, Model model) throws ClassNotFoundException, SQLException, IOException
	{
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		reviewDao.insertComm(comm);
		return "redirect:reviewDetail.htm?revCode=" + comm.getRevCode();
	}
	
	@RequestMapping("commDelete.htm")
	public String commDelete(int commCode, int revCode, Model model) throws ClassNotFoundException, SQLException, IOException
	{
		System.out.println("여기는 오냐 comm");
		System.out.println(commCode);
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		reviewDao.deleteComm(commCode);
		
		return "redirect:reviewDetail.htm?revCode=" + revCode;
	}
	@RequestMapping("reviewDelete.htm")
	public String reviewDelete(String locName, int revCode, String id, HttpSession session, Model model) 
			throws ClassNotFoundException, SQLException, IOException
	{
		System.out.println("여기까지 온다");
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ReviewDao rdao = sqlSession.getMapper(ReviewDao.class);
		dao.delete3REVRECOMM(id);
		rdao.deleteComm(revCode);
		dao.delete4Review(revCode);
		System.out.println("여기까지 오면 경로 문제");
		System.out.println(locName);
		System.out.println(revCode);
		System.out.println(id);
		
		model.addAttribute("locName", locName);
		return "redirect:locDetail.htm";
	}
	
}//end of reviewController class