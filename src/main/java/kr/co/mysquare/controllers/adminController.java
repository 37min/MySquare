package kr.co.mysquare.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mysquare.dao.AdminDao;
import kr.co.mysquare.dao.LocationDao;
import kr.co.mysquare.dao.MemberDao;
import kr.co.mysquare.dao.ReviewDao;
import kr.co.mysquare.dto.*;
import kr.co.mysquare.util.SendMail;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class adminController 
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
	
	@RequestMapping("idSearch.htm")
	public String idSearch(HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		System.out.println("여기는 컨트롤러 idSearch");
		updateSideMenu(session,model);
		
		return "admin.idSearch";
	}
	
	@RequestMapping("idSearchProcess.htm")
	public String idSearchById(Member mb, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		System.out.println("여기는 컨트롤러 idSearchProcess");
		System.out.println("id : " + mb.getId());
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<Member> member = adminDao.getMemberById(mb);
		model.addAttribute("member", member);
/*
		System.out.println(member.get(0).getId());
		System.out.println(member.get(0).getPwd());
		System.out.println(member.get(0).getName());
		System.out.println(member.get(0).getEmail());
		System.out.println(member.get(0).getSex());
		System.out.println(member.get(0).getPlace());
		System.out.println(member.get(0).getgDate());
		*/
		updateSideMenu(session,model);
		
		return "admin.idSearchList";
	}
	
	
	@RequestMapping("locSearchList.htm")
	public String locSearchList1(Model model,HttpSession session) throws ClassNotFoundException, SQLException //대분류
	{
		System.out.println("여기는 컨트롤러 locSearchList");
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<HLDistrict> hlDistrict = adminDao.getHLDistrict();
		model.addAttribute("hlDistrict", hlDistrict);
		
		updateSideMenu(session,model);
		
		return "admin.locSearchList";
	}
	
	@RequestMapping("locSearchListHtoM.htm")
	@ResponseBody
	public String locSearchList2(int hlLocNameParam, HttpServletResponse response) 
			throws ClassNotFoundException, SQLException
	{
		System.out.println("여기는 컨트롤러 locSearchListHtoM");
		System.out.println(hlLocNameParam);
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<MLDistrict> mlDistrict = adminDao.getMLDistrict(hlLocNameParam);
		
		JSONObject obj = new JSONObject();
		
		JSONArray hlArray = new JSONArray();
		
		for(int i = 0 ; i < mlDistrict.size(); i++)
		{
			MLDistrict mld = mlDistrict.get(i);
		
			obj.put("mlCode" , mld.getMLLocCode());
			obj.put("mlName" , mld.getMLLocName());
			hlArray.add(obj);
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("hlArray", hlArray);
		/*System.out.println(jsonObject.toString());*/
		
		return jsonObject.toString();
	}
	
	@RequestMapping("locSearchListMtoL.htm")
	@ResponseBody
	public String locSearchList3(int mlLocNameParam, HttpServletResponse response) throws ClassNotFoundException, SQLException
	{
		/*System.out.println("여기는 컨트롤러 locSearchListMtoL");
		System.out.println(mlLocNameParam);*/
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<LLDistrict> llDistrict = adminDao.getLLDistrict(mlLocNameParam);
		
		JSONObject obj = new JSONObject();
		
		JSONArray mlArray = new JSONArray();
		
		for(int i = 0 ; i < llDistrict.size(); i++)
		{
			LLDistrict lld = llDistrict.get(i);
		
			obj.put("llCode" , lld.getLLLocCode());
			obj.put("llName" , lld.getLLLocName());
			mlArray.add(obj);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("mlArray", mlArray);
		
		return jsonObject.toString();
	}
	
	@RequestMapping("locSearchListLtoR.htm")
	@ResponseBody
	public String locSearchList4(int llLocNameParam, HttpServletResponse response) throws ClassNotFoundException, SQLException //대분류
	{
		/*System.out.println("여기는 컨트롤러 locSearchListLtoR");
		System.out.println(llLocNameParam);
		*/
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<Location> location = adminDao.getLocations(llLocNameParam);
		
		JSONObject obj = new JSONObject();
		
		JSONArray locArray = new JSONArray();
		
		for(int i = 0 ; i < location.size(); i++)
		{
			Location loc = location.get(i);
			
			obj.put("locName" , loc.getLocName());
			obj.put("locGroupCode" , loc.getLocGroupCode());
			obj.put("llLocCode" , loc.getLLLocCode());
			obj.put("locContents" , loc.getLocContents());
			obj.put("locAdd" , loc.getLocAdd());
			obj.put("latitude" , loc.getLatitude());
			obj.put("longitude" , loc.getLongitude());
			obj.put("locDate" , loc.getLocDate());
			
			
			locArray.add(obj);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("locArray", locArray);
		System.out.println(jsonObject.toString());
		
		return jsonObject.toString();
	}
	
	@RequestMapping("locSearchListLtoC.htm")
	@ResponseBody
	public String locSearchList5(int llLocNameParam, HttpServletResponse response) throws ClassNotFoundException, SQLException //대분류
	{
		/*System.out.println("여기는 컨트롤러 locSearchListLtoC");
		System.out.println("1 : " + llLocNameParam);
		*/
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		LLDistrict LLDistrict = adminDao.getLLLocCode(llLocNameParam);
		JSONObject obj = new JSONObject();
		
		System.out.println("2 : " + LLDistrict.getLLLocCode());
		System.out.println(LLDistrict.toString());
		
		obj.put("llCode" , LLDistrict.getLLLocCode());
		
		System.out.println(obj.toString());
		return obj.toString();
	}
	
	@RequestMapping("locEdit.htm")
	public String locEdit (String locName, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		/*System.out.println("여기는 컨트롤러 locEdit");
		System.out.println(locName);
		*/
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		LocationDao locationDao = sqlSession.getMapper(LocationDao.class);
		
		List<HLDistrict> hlDistrict = adminDao.getHLDistrict();
		Location location = adminDao.getLocation(locName);
		LocGroup locGroup = adminDao.getLocGroup(locName);
		List<LocGroup> locList = locationDao.getLocGroup();
		
		System.out.println(location.getLocGroupCode());
		
		model.addAttribute("hlDistrict", hlDistrict);
		model.addAttribute("location", location);
		model.addAttribute("locList", locList);
		model.addAttribute("locGroup", locGroup);
		
		updateSideMenu(session,model);

		return "admin.locEdit";
	}
	
	@RequestMapping(value={"locEditProcess.htm"}, method=RequestMethod.POST)
	public String locEditProcess (Location location, Model model, HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException, IOException
	{
		System.out.println("여기는 컨트롤러 locEditProcess");
		System.out.println(location.getLocGroupCode());
		if( !location.getFile().isEmpty() ) //파일을 첨부했을 때 
		{
			String fname = location.getFile().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/image");
			String fpath = path + "\\" + fname;
			
			//파일 쓰기 작업
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(location.getFile().getBytes());
			fs.close();
			location.setLocImage(fname);
		}
		else
		{
			location.setLocImage("");
		}
		
		/*
		System.out.println("여기는 컨트롤러 locEditProcess");
		System.out.println(location);
		
		System.out.println("명소이름 : " + location.getLocName());
		System.out.println("그룹코드 : " + location.getLocGroupCode());
		System.out.println("하급지역코드 : " + location.getLLLocCode());
		System.out.println("이미지이름 : " + location.getLocImage());
		System.out.println("명소상세설명 : " + location.getLocContents());
		System.out.println("명소 주소 : " + location.getLocAdd());
		System.out.println("위도 : " + location.getLatitude());
		System.out.println("경도 : " + location.getLongitude());
		*/
		
		
		location.setLocContents( location.getLocContents().replace("\r\n", "<br>") );
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		adminDao.getLocationUpdate(location);
		model.addAttribute("locName", location.getLocName());

		//return "redirect:reviewDetail.htm?revCode=" + comm.getRevCode();
		return "redirect:locDetail.htm";
	}
	
	
	@RequestMapping(value={"locDelete.htm"}, method=RequestMethod.GET)
	public String locDelete(String locName) throws ClassNotFoundException, SQLException
	{
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ReviewDao rdao = sqlSession.getMapper(ReviewDao.class);
		adminDao.delete1bookmark(locName);
		List<Review> Review = adminDao.Review(locName);

		for(Review rv : Review)
			{
			adminDao.delete3REVRECOMM(rv.getRevCode());
			rdao.deleteComm2(rv.getRevCode());
			}
		for(Review rv : Review)
		{
		dao.delete4Review(rv.getRevCode());
		}
		adminDao.getLocationDelete(locName);
		
		return "redirect:main.htm";
	}

	
	@RequestMapping(value={"locInsert.htm"}, method=RequestMethod.GET)
	public String locInsert(String point, Model model, HttpSession session) throws ClassNotFoundException, SQLException
	{
		StringTokenizer str = new StringTokenizer(point, ",");
		String[] coordinate = new String[2];
		int i = 0;
		
		while( str.hasMoreTokens() )
		{
			coordinate[i] = str.nextToken();
			i++;
		}
		//0번째 latitude(위도), 1번째 longitude(경도)
		
		model.addAttribute("coordinate", coordinate);
		//////////////////////////////////////////////////////여기까진 좌표
		
		
		LocationDao locationDao = sqlSession.getMapper(LocationDao.class);
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		
		List<HLDistrict> hlDistrict = adminDao.getHLDistrict();
		List<LocGroup> locList = locationDao.getLocGroup();
		
		
		model.addAttribute("hlDistrict", hlDistrict);
		model.addAttribute("locList", locList);
		
		updateSideMenu(session,model);
		
		return "admin.locInsert";
	}//end of locInsert()
	
	
	@RequestMapping(value={"locInsertProcess.htm"}, method=RequestMethod.POST)
	public String locInsertProcess (Location location, Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException
	{
		System.out.println("여기는 컨트롤러 locInsertProcess");
		System.out.println(location.getLocGroupCode());
		if( !location.getFile().isEmpty() ) //파일을 첨부했을 때 
		{
			String fname = location.getFile().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/image");
			String fpath = path + "\\" + fname;
			
			//파일 쓰기 작업
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(location.getFile().getBytes());
			fs.close();
			location.setLocImage(fname);
		}
		else
		{
			location.setLocImage("");
		}
		
		StringTokenizer str = new StringTokenizer(location.getLongitude(), ",");
		String[] coordinate = new String[2];
		int i = 0;
		
		while( str.hasMoreTokens() )
		{
			coordinate[i] = str.nextToken();
			i++;
		}
		location.setLatitude(coordinate[0]);
		location.setLongitude(coordinate[1]);
		
		location.setLocContents( location.getLocContents().replace("\r\n", "<br>") );
		
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		adminDao.getLocationInsert(location);

		model.addAttribute("locName", location.getLocName());
		
		return "redirect:locDetail.htm";
	}
	
	@RequestMapping(value={"mailToAdmin.htm"}, method=RequestMethod.GET)
	public String mailToAdmin (HttpSession session, Model model) throws ClassNotFoundException, SQLException
	{
		updateSideMenu(session,model);
		
		return "admin.mailToAdmin";
	}
	
	@RequestMapping("mailToAdminProcess.htm")
	@ResponseBody
	public String mailToAdminProcess (String mailContents, HttpSession session) throws ClassNotFoundException, SQLException
	{
		String id = (String) session.getAttribute("id");
		int result = SendMail.sendMail(id, mailContents);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		return obj.toString();
	}

	
	

}//end of adminController class