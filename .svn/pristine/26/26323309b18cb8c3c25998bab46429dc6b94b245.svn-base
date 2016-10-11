package kr.co.mysquare.controllers;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.co.mysquare.dao.LocationDao;
import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.Review;
import kr.co.mysquare.util.FindLocation;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
public class locationController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("locDetail.htm")
	public String locDetail(String locName, Model model) throws ClassNotFoundException, SQLException
	{
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		Location location = dao.getLocById(locName);
		
		List<Review> reviewList = dao.getReviewsByLocName(locName);
		//System.out.println("reviewList revImage0 : " + reviewList.get(0).getRevImage());
		//System.out.println("reviewList revImage1 : " + reviewList.get(1).getRevImage());
		model.addAttribute("location", location);
		model.addAttribute("reviewList", reviewList);
		
		return "location.locDetail";
	}
	
	@RequestMapping(value={"locSearch.htm"}, method=RequestMethod.POST)
	public String locSearch(String locationSearch, Model model) throws ClassNotFoundException, SQLException
	{
		FindLocation fl = new FindLocation();
		String[] coordinate = fl.toCoordinate(locationSearch); //입력받은 위치 좌표로 변환 후 문자 배열에 저장
		
		model.addAttribute("coordinate", coordinate); // view단에서 좌표 사용하기 위해 addAttribute
		
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		List<Location> locList = dao.getLocations(); //모든 location 정보를 받아온다
		
		model.addAttribute("locList", locList); 
		
		return "location.locSearch"; //location/locSearch.jsp
	}
	
	@RequestMapping(value={"getLocById.htm"})
	@ResponseBody
/*	메소드에 @ResponseBody 로 어노테이션이 되어 있다면 메소드에서 리턴되는 값은 View 를 통해서
	출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됩니다.
	이때 쓰여지기 전에 리턴되는 데이터 타입에 따라 MessageConverter 에서 변환이 이뤄진 후 쓰여지게 됩니다.*/
	public String getLocById(String locName, HttpServletResponse response) throws ClassNotFoundException, SQLException
	{
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		Location location = dao.getLocById(locName);
		
		JSONObject obj = new JSONObject();
		
		//얻어 온 정보를 JSON 데이터로 만들어준다
    	obj.put("locName", location.getLocName());
    	obj.put("locContents", location.getLocContents());
    	
    	return obj.toString();
		
	}
	
}//end of locationController class