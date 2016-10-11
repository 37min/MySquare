package kr.co.mysquare.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("main.htm")
	public String main()
	{
		return "main.main";
	}
}//end of mainController class