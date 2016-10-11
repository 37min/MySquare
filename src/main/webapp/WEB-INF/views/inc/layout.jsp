<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="kr" lang="kr">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>MySquare</title>
	
		<link href="css/frame.css"  type="text/css" rel="stylesheet" />
		<link href="<tiles:insertAttribute name="css"/>"  type="text/css" rel="stylesheet" />
	
		<!--  div높이 -->
		<script type="text/javascript">
		 
			window.onload = function()
			{
			 // div height 설정
			  //setDivHeight('side_L','center_L');//사이드에 맞춤
			  setDivHeight('center_L','side_L');//센터에 맞춤
			}
			 
			function setDivHeight(objSet, objTar)
			{ 
			  var objSet   = document.getElementById(objSet); 
			  var objTarHeight= document.getElementById(objTar).offsetHeight;
			  objSet.style.height  = objTarHeight + "px";
			} 
		
		</script>
	</head>
	
	<body>
		
		<tiles:insertAttribute name="header"/> <!-- <div id="header"> -->
		
		<div id="wrapper">
		
			<div id="center_L"> <!-- ok -->
				<tiles:insertAttribute name="content" /> <!-- 각각의 페이지 내용 -->
			</div>
				
			<div id="side_L">
				<!-- <div id="follower"> -->
				<tiles:insertAttribute name="follower" />
				<!-- <div id="favorite"> --> 
			 	<tiles:insertAttribute name="favorite" />
			</div>
			
			<%-- <tiles:insertAttribute name="footer"/> <!-- <div id="footer"> --> --%>
		</div>
		
		
	</body>
</html>
