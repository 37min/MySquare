<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="css/component.css" />
<link rel="stylesheet" href="css/headerCSS/header.css" type="text/css" /> 

<div id="header_L">

	<div id="nav" >
	
		<div id="navLeft" >
			<a href="${pageContext.request.contextPath}/main.htm" >
				<img src="image/header/logo.png" style="width : 150px; margin-left : 50px;">
			</a>
			<!-- <img src="image/header/logo.png" style="width : 150px; height:60px; margin-left:50px;"> -->
		</div>
		
		<div id="navCenter">
			<form action="locSearch.htm" method="post">
				<input type="text" name="locationSearch" placeholder="   지역을 검색하세요!" required/>
				<button type="submit">검색</button>
			</form>
				
			<form action="idSearchProcess.htm" method="post" style="margin-left:50px">
				<input type="text" name="id" placeholder="   회원을 검색하세요!" required/>
				<button type="submit">검색</button>
			</form>
		</div>
		
		<div id="navRight">
			
			<c:choose>
				<c:when test="${sessionScope.id != null}">
					<a href="memberDetail.htm?id=${sessionScope.id}" class="blue"  style="margin-left : 15px">${sessionScope.id}님 정보</a>
					<button name="button" onclick="location.href='memberLoginOut.htm'" style="margin-left : 15px">로그아웃</button>
				</c:when>

				<c:otherwise>
					<a href="memberJoin.htm" class="blue" style="margin-left : 15px" >회원가입</a>
					<button name="button" onclick="location.href='memberLogin.htm'" style="margin-left : 15px">로그인</button>
				</c:otherwise>
			</c:choose>
			
		</div> <!-- end of navRight -->
</div> <!-- end of nav  -->

<!-- 

	<script type="text/javascript" src="FixedFadeOutMenu/jquery-1.3.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
				$("#center_L").scroll(function(){
					var scrollTop = $("#center_L").scrollTop();
					if(scrollTop != 0) $('#nav').stop().animate({'opacity':'0.2'},400);
					else $('#nav').stop().animate({'opacity':'1'},400);
				});
				
				$('#nav').hover(
					function (e) {
						var scrollTop = $("#center_L").scrollTop();
						if(scrollTop != 0){
							$('#nav').stop().animate({'opacity':'1'},400);
						}
					},
					function (e) {
						var scrollTop = $("#center_L").scrollTop();
						if(scrollTop != 0)
						{
							$('#nav').stop().animate({'opacity':'0.2'},400);
						}
					}
				);
				
			});
            
        </script>
        	 -->
</div>