package kr.co.mysquare.controllers;

import java.sql.SQLException;
import java.util.List;




import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.mysquare.dao.MemberDao;
import kr.co.mysquare.dto.Member;

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
	@RequestMapping(value={"memberDetail.htm"})
	public String memberDetail(String id, Model model ) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : " + id);
		MemberDao MemberDao = sqlSession.getMapper(MemberDao.class);
		Member member = MemberDao.select(id);
		model.addAttribute("member", member);
		return "member.memberDetail";
	}
	// 수정 페이지 에서 데이터를 받아서 수정 쿼리 처리
	@RequestMapping(value={"memberEdit.htm"}, method=RequestMethod.POST)
	public String memberEdit(Member member, Model model) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : " + member.getId());
		MemberDao MemberDao = sqlSession.getMapper(MemberDao.class);
		MemberDao.update(member);
		Member Member = MemberDao.select(member.getId());
		//model.addAttribute("member", Member);
		//return "member.memberDetail";
		return "redirect:memberDetail.htm?id=" + member.getId();
	}
	// 메인에서 페이지 이동시 get 방식일 경우 페이지 이동 처리
	@RequestMapping(value={"memberEdit.htm"}, method=RequestMethod.GET)
	public String memberEdit() throws ClassNotFoundException, SQLException
	{
		return "member.memberEdit";
	}
	// POST 방식으로 받아온 데이터를 DB에 저장
	@RequestMapping(value={"memberJoin.htm"}, method=RequestMethod.POST)
	public String memberJoin(Member member) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : " + member.getId());
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.insert(member);
		return "member.memberLogin";
	}
	// 로그인 화면에서 Join 버튼을 누르면 GET 방식으로 페이지 이동
	@RequestMapping(value={"memberJoin.htm"}, method=RequestMethod.GET)
	public String memberJoin() throws ClassNotFoundException, SQLException
	{
		
		return "member.memberJoin";
	}
	// 로그인 화면 페이지 이동
	@RequestMapping(value={"memberLogin.htm"}, method=RequestMethod.GET)
	public String memberLogin() throws ClassNotFoundException, SQLException
	{
		return "member.memberLogin";
	}
	// 아이디와 페스워드를 통한 로그인 로직 실행
	@RequestMapping(value={"memberLogin.htm"}, method=RequestMethod.POST)
	public String memberLogin(String id, String pwd, HttpSession session ) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : "+ id + pwd );
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.select(id);
		if(member == null ) {
			System.out.println("실패 null값임");
			return "redirect:memberLogin.htm";
		}
		else if(member.getPwd().equals(pwd)){
			System.out.println("성공");
			session.setAttribute("id",id);
		}
		else{
			System.out.println("실패");
			return "redirect:memberLogin.htm";
		}
		return "main.main";
	}
	// 삭제 페이지로 이동
	@RequestMapping(value={"memberDelete.htm"}, method=RequestMethod.GET)
	public String memberDelete() throws ClassNotFoundException, SQLException
	{
		return "member.memberDelete";
	}
	// 세션에 입력된 아이디 값을 통하여 삭제 실행
	@RequestMapping(value={"memberDelete.htm"}, method=RequestMethod.POST)
	public String memberDelete(String id, HttpSession session) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberController : " + id);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.delete(id);
		
		return "redirect:memberLoginOut.htm";
	}
	//세션에 있는 데이터를 지우고 로그아웃을 실행
	@RequestMapping(value={"memberLoginOut.htm"}, method=RequestMethod.GET)
	public String memberLoginOut(HttpSession session) throws ClassNotFoundException, SQLException
	{
		System.out.println("memberloginout.htm");
		session.invalidate();
		return "main.main";
	}

}//end of memberController class