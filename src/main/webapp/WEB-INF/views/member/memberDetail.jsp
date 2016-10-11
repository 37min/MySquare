<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.co.mysquare.dto.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="" class="" >						
							<dl class="">
								<dt class="">
									
									아이디${member.id }<br>
                                    이메일${member.email}<br>
                                    성별${member.sex }
                              지역${member.place } 
                              <a href="main.htm">메인 메뉴</a><br>
                              <a href="memberEdit.htm">정보 수정</a>   
								</dt>
								
								
								
								
</dl>
</div>
</body>
</html>