package kr.co.mysquare.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mysquare.dao.LocationDao;
import kr.co.mysquare.dao.MemberDao;
import kr.co.mysquare.dto.Bookmark;
import kr.co.mysquare.dto.Following;
import kr.co.mysquare.dto.LocGroup;
import kr.co.mysquare.dto.Location;
import kr.co.mysquare.dto.Review;
import kr.co.mysquare.util.FindLocation;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class locationController 
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
	
	@RequestMapping("locDetail.htm")
	public String locDetail(String locName, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		LocationDao locationDao = sqlSession.getMapper(LocationDao.class);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		String id = (String) session.getAttribute("id");
		
		if( id != null )
		{
			int isMyBookmark =  memberDao.isMyBookmark(locName, id);
			model.addAttribute("isMyBookmark", isMyBookmark);
		}
		
		
		int favoriteNum = locationDao.getFavoriteNum(locName);
		Location location = locationDao.getLocById(locName);
		List<Review> reviewList = locationDao.getReviewsByLocName(locName);
		LocGroup locGroup = locationDao.getLocGroupName(location.getLocGroupCode());
		String locGroupName = locGroup.getLocGroupName();
	
		updateSideMenu(session, model);
		
		model.addAttribute("locGroupName", locGroupName);
		model.addAttribute("favoriteNum", favoriteNum);
		model.addAttribute("location", location);
		model.addAttribute("reviewList", reviewList);
		
		return "location.locDetail";
	}
	
	@RequestMapping(value={"locSearch.htm"})
	public String locSearch(String locationSearch, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		FindLocation fl = new FindLocation();
		String[] coordinate = fl.toCoordinate(locationSearch); //입력받은 위치 좌표로 변환 후 문자 배열에 저장
			
		model.addAttribute("coordinate", coordinate); // view단에서 좌표 사용하기 위해 addAttribute
		
		model.addAttribute("locationSearch", locationSearch);
		
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		/*List<Location> locList = dao.getLocations(); //모든 location 정보를 받아온다*/
		
		List<LocGroup> locGroupList = dao.getLocGroup();
		
		model.addAttribute("locGroupList", locGroupList);
		
		Location location = new Location();
		location.setLocName(locationSearch);

		List<Location> locList = dao.getLocationsByInputLocName(location);

		updateSideMenu(session, model);
		
		model.addAttribute("locList", locList); 
		
		return "location.locSearch"; //location/locSearch.jsp
	}
	
	@RequestMapping(value={"getLocById.htm"})
	@ResponseBody
/*	메소드에 @ResponseBody 로 어노테이션이 되어 있다면 메소드에서 리턴되는 값은 View 를 통해서
	출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됩니다.
	이때 쓰여지기 전에 리턴되는 데이터 타입에 따라 MessageConverter 에서 변환이 이뤄진 후 쓰여지게 됩니다.*/
	public String getLocById(String locName) throws ClassNotFoundException, SQLException
	{
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		Location location = dao.getLocById(locName);
		
		JSONObject obj = new JSONObject();
		
		//얻어 온 정보를 JSON 데이터로 만들어준다
		
    	obj.put("locName", location.getLocName());
    	obj.put("locContents", location.getLocContents());
    	obj.put("locImage", location.getLocImage());
    	
    	return obj.toString();
	}
	
	@RequestMapping(value={"getLocationsByLocGroupAndInputLocName.htm"})
	@ResponseBody
	public String getLocationsByLocGroupAndInputLocName(int locGroupCode, String inputLocName) throws ClassNotFoundException, SQLException
	{
		Location location = new Location();
		/*
		System.out.println("코드 : " + locGroupCode);
		System.out.println("이름 : " + inputLocName);
		*/
		location.setLocGroupCode(locGroupCode);
		location.setLocName(inputLocName);
		
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		List<Location> locationByGroupCodeAndInputLocName = dao.getLocationsByLocGroupAndInputLocName(location);
		//필요한거 locName, locADD, latitude, longitude
		
		JSONArray cell = new JSONArray();
		JSONObject locObj = new JSONObject();
		
		for(Location loc : locationByGroupCodeAndInputLocName)
		{
			locObj.put("locName", loc.getLocName());
			locObj.put("locAdd", loc.getLocAdd());
			locObj.put("latitude", loc.getLatitude());
			locObj.put("longitude", loc.getLongitude());
			cell.add(locObj);
		}
		
		/*System.out.println(cell.toString() );*/
		
		return cell.toString();

	}
	
}//end of locationController class