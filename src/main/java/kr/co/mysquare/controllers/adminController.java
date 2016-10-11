package kr.co.mysquare.controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.co.mysquare.dao.AdminDao;
import kr.co.mysquare.dto.*;
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
	
	@RequestMapping("idSearch.htm")
	public String idSearch()
	{
		return "admin.idSearch";
	}
	
	@RequestMapping("locEdit.htm")
	public String locEdit(Model model) throws ClassNotFoundException, SQLException //대분류
	{
		System.out.println("여기는 컨트롤러 edit1");
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<HLDistrict> hlDistrict = adminDao.getHLDistrict();
		for(HLDistrict h : hlDistrict){
			System.out.println(h.getHLLocCode());
		}
		model.addAttribute("hlDistrict", hlDistrict);
		
		return "admin.locEdit";
	}
	
	@RequestMapping("locEdit2.htm")
	@ResponseBody
	public String locEdit2(int hlLocNameParam, HttpServletResponse response) throws ClassNotFoundException, SQLException
	{
		System.out.println("여기는 컨트롤러 edit2");
		System.out.println(hlLocNameParam);
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<MLDistrict> mlDistrict = adminDao.getMLDistrict(hlLocNameParam);
		
		JSONObject obj = new JSONObject();
		
		JSONArray hlArray = new JSONArray();
		
		for(int i = 0 ; i < mlDistrict.size(); i++)
		{
			MLDistrict mld = mlDistrict.get(i);
		
			//obj.put("mlCode" + i, mld.getMLLocCode());
			//obj.put("mlName" + i, mld.getMLLocName());
			obj.put("mlCode" , mld.getMLLocCode());
			obj.put("mlName" , mld.getMLLocName());
			hlArray.add(obj);
		}
		//cell.add(obj);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("hlArray", hlArray);
		System.out.println(jsonObject.toString());
		//System.out.println("obj.toString() :"+obj.toString());
		
		return jsonObject.toString();
	}
	
	@RequestMapping("locEdit3.htm")
	@ResponseBody
	public String locEdit3(int mlLocNameParam, HttpServletResponse response) throws ClassNotFoundException, SQLException
	{
		System.out.println("여기는 컨트롤러 edit3");
		System.out.println(mlLocNameParam);
		
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
		System.out.println(jsonObject.toString());
		//System.out.println("obj.toString() :"+obj.toString());
		
		return jsonObject.toString();
	}
	
	@RequestMapping("locEdit4.htm")
	public String locEdit4(int llLocNameParam) throws ClassNotFoundException, SQLException //대분류
	{
		System.out.println("여기는 컨트롤러 edit4");
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		List<Location> location = adminDao.getLocation(llLocNameParam);
		
		JSONObject obj = new JSONObject();
		
		JSONArray locArray = new JSONArray();
		
		for(int i = 0 ; i < location.size(); i++)
		{
			Location loc = location.get(i);
			/*<tr>
				<td>LocName</td>
				<td>LocGroupCode</td>
				<td>LocContents</td>
				<td>LocAdd</td>
				<td>latitude</td>
				<td>longitude</td>
				<td>LocDate</td>
			</tr>  */
			obj.put("locName" , loc.getLocName());
			obj.put("locGroupCode" , loc.getLocGroupCode());
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
	
	
	@RequestMapping("locInsert.htm")
	public String locInsert()
	{
		return "admin.locInsert";
	}
	
	

}//end of adminController class