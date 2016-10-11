<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
	
	<link rel="stylesheet" type="text/css" href="css/style.css" />

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jmpress.min.js"></script>
	<script type="text/javascript" src="js/jquery.jmslideshow.js"></script>
				
	<noscript>
		<style>
			.step {
				width: 100%;
				position: relative;
			}
			.step:not(.active) {
				opacity: 1;
				filter: alpha(opacity=99);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(opacity=99)";
			}
			.step:not(.active) a.jms-link{
				opacity: 1;
				margin-top: 40px;
			}
		</style>
	</noscript>

 <img src = "image/header/menu0.png">


	<section id="jms-slideshow" class="jms-slideshow">
		<div class="step" data-color="color-1">
			<div class="jms-content">
				<br><h3>MySquare!</h3>
				<p>당신이 찾던 지도!</p>
			</div>
			<img src="image/main/slide_navermap.PNG" />
		</div>
		<div class="step" data-color="color-2" data-y="500" data-scale="0.4" data-rotate-x="30">
			<div class="jms-content">
				<br><h3>빠른 검색!</h3>
				<p>지역(행정구역)을 <br>입력하세요</p>
			</div>
			<img src="image/main/slide_map.PNG" />
		</div>
		<div class="step" data-color="color-3" data-x="2000" data-z="3000" data-rotate="170">
			<div class="jms-content">
				<h3>사용자 후기!</h3>
				<p>살아있는 지역정보</p>
			</div>
			<img src="image/main/slide_houggy.PNG" />
		</div>
			<div class="step" data-color="color-4" data-x="2000" data-z="3000" >
			<div class="jms-content">
				<h3>후기 댓글!</h3>
				<p>후기에 나의 의견을!</p>
			</div>
			<img src="image/main/slide_reply.PNG" />
		</div>
		
		<!-- 
		<div class="step" data-color="color-4" data-x="3000">
			     <center>
 <iframe src="http://prezi.com/embed/zfuhoh4pkrnc/?bgcolor=ffffff&amp;lock_to_path=1&amp;autoplay=0&amp;autohide_ctrls=0&amp;features=undefined&amp;disabled_features=undefined" width="950" height="520" frameBorder="0" webkitAllowFullScreen mozAllowFullscreen allowfullscreen></iframe>
 </center>
 
		</div>
		<div class="step" data-color="color-5" data-x="4500" data-z="1000" data-rotate-y="45">
			<div class="jms-content">
				<h3>그거알어?</h3>
				<p>몰라</p>
				<a class="jms-link" href="#">Read more</a>
			</div>
			<img src="image/main/5.png" />
		</div>
		
		-->
	</section>
 
 

    <!-- 
     <center>
 <iframe src="http://prezi.com/embed/zfuhoh4pkrnc/?bgcolor=ffffff&amp;lock_to_path=1&amp;autoplay=0&amp;autohide_ctrls=0&amp;features=undefined&amp;disabled_features=undefined" width="950" height="520" frameBorder="0" webkitAllowFullScreen mozAllowFullscreen allowfullscreen></iframe>
 </center>
 
     -->
      
	<script type="text/javascript">
		$(function() {
		
			$( '#jms-slideshow' ).jmslideshow();
			
		});
	</script>
	<style>
	td>img
	{
		box-shadow: 3px 3px 5px #aaa;
	}
	</style>

	<!---------------------------------------------------------------------------------------------------------------  -->
	
	<br><br><br><br>
	<div style="margin: 0 auto; width:1000px;">
		<table style="float:left; width:500px;">
			<thead>
				<tr>
					<th colspan="2" width="400px">가장 인기있는 지역</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="loc" items="${mostPopularLocList }" begin="0" end="2"> <!-- 순서대로 3개만 -->
					<tr onclick="location.href='locDetail.htm?locName=${loc.locName}';">	
						<td width="200px">
							<c:if test="${loc.locImage != null }">
								<img src="${pageContext.request.contextPath}/image/${loc.locImage}" width="200px;" height="150px;">
							</c:if>
							<c:if test="${loc.locImage == null }">
								<img src="${pageContext.request.contextPath}/image/noimage.jpg" width="200px;" height="150px;">
							</c:if>
						</td>
						<td>
							<h2>${loc.locName }</h2>
							<br>
							${loc.locAdd }
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<table style="float:left; width:500px;">
			<thead>
				<tr>
					<th colspan="2" width="400px">가장 인기있는 후기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rev" items="${mostPopularRevList}" begin="0" end="2"> <!-- 순서대로 3개만 -->
						<tr onclick="location.href='reviewDetail.htm?revCode=${rev.revCode}';">
							<td width="200px">
								<img src="${pageContext.request.contextPath}/image/${rev.revImage}" width="200px;" height="150px;">
							</td>
							<td>
								<h2>${rev.locName }</h2><br>
								${rev.revName }
							</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	