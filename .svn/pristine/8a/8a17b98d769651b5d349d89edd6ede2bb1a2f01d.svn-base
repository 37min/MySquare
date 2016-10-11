package kr.co.mysquare.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.mysquare.dao.ReviewDao;
import kr.co.mysquare.dto.Comm;
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
	
	@RequestMapping("reviewDetail.htm")
	public String reviewDetail(Model model,int revCode) throws ClassNotFoundException, SQLException
	{	
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		Review review = reviewDao.getReviewByRevCode(revCode);
		List<Comm> commList = reviewDao.getAllCommByRevCode(revCode);

		model.addAttribute("review", review);
		model.addAttribute("commList", commList);
		
		return "review.reviewDetail";
	}//end of reviewDetail.htm

	@RequestMapping("reviewEdit.htm")
	public String reviewEdit()
	{
		return "review.reviewEdit";
	}//end of reviewEdit.htm
	
	@RequestMapping(value={"reviewWrite.htm"},method=RequestMethod.GET)
	public String reviewWriteForm(String locName, Model model) throws ClassNotFoundException, SQLException
	{
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		
		List<RevGroup> revGroupList = reviewDao.getRevGroup();
		
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
			String path = request.getServletContext().getRealPath("/WEB-INF/views/review/upload");
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
	public String commDelete(int commCode, int revCode) throws ClassNotFoundException, SQLException, IOException
	{
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		reviewDao.deleteComm(commCode);
		
		return "redirect:reviewDetail.htm?revCode=" + revCode;
	}
	
	
}//end of reviewController class