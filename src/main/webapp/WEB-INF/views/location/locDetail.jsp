<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	try { document.execCommand('BackgroundImageCache', false, true); } catch (e) { }
</script>
<!-- 버튼----------------- -->
		<link rel="stylesheet" type="text/css" href="import/AnimatedButtons/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="import/AnimatedButtons/css/style7.css" />
        <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
  <!-- ------------------------ -->
<!-- 
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=f2bc417ef3f82e7227cfaf75d9561006"></script> -->
	<!-- localhost -->

	<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=cd35cafc0e534805cbadaeec014e9f3a"></script>	
	<!-- 192.16.8.7.107 -->
	

<script type="text/javascript">

	$(document).ready(function() {
		
		//마커그림 정보
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
	var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
		
	var oPoint = new nhn.api.map.LatLng('${location.longitude}', '${location.latitude}'); //좌표
	var oMarker = new nhn.api.map.Marker(oIcon, { title : '${location.locName}' }); //마커 아이콘과 title 설정
	
	
	nhn.api.map.setDefaultPoint('LatLng');
		//지도 객체 생성
	oMap = new nhn.api.map.Map('map', {
		point : oPoint,
		zoom : 10,
		enableWheelZoom : false,
		enableDragPan : false,
		enableDblClickZoom : false,
		mapMode : 0,
		activateTrafficMap : false,
		activateBicycleMap : false,
		minMaxLevel : [ 2, 14 ],
		size : new nhn.api.map.Size(300, 220)
	//div영역 사이즈하고 맞출 것
	});

	oMarker.setPoint(oPoint); //마커의 좌표 설정
	oMap.addOverlay(oMarker); //맵 객체에 마커 추가
	
	});//end of document.ready

	/////////////////////////////////////////마커 끝///////////////////////////////////////////////////////
</script>

<!-- 명소 -->
<img src = "image/header/menu2.png">
<div class="container">
	<div id="middle">

			<div class="block">
				<!-- 지역에 대한 후기 -->

				<div class="floatleft_">
					
					<div class="floatbox">
					
						<div id="id_RE">
							<c:if test="${location.locImage != null }">
								<img src="${pageContext.request.contextPath}/image/${location.locImage}">
							</c:if>
							<c:if test="${location.locImage == null }">
								<img src="${pageContext.request.contextPath}/image/noimage.jpg">
							</c:if>
						</div>
	
						<div class="content">
										<!-- 즐겨찾기 추가 제거 -->
										<c:if test="${isMyBookmark == 0}">
											<div class="button-wrapper">
												<a href="addBookmark.htm?locName=${location.locName}" class="a-btn">
													<span class="a-btn-symbol">.</span>
													<span class="a-btn-text">즐겨찾기</span> 
												</a>
											</div>
										</c:if>
										<c:if test="${isMyBookmark == 1}">
											<div class="button-wrapper">
												<a href="deleteBookmark.htm?locName=${location.locName}" class="a-btn">
													<span class="a-btn-symbol">.</span>
													<span class="a-btn-text">즐겨찾기 제거</span> 
												</a>
											</div>
										</c:if>
										<!-- 즐겨찾기 추가 제거 끝 -->
										
										<c:if test="${sessionScope.id != null }">
											<div class="button-wrapper">
												<a href="reviewWrite.htm?locName=${location.locName }" class="a-btn">
													<span class="a-btn-symbol">e</span>
													<span class="a-btn-text">후기작성</span> 
												</a>
											</div>
										</c:if>
					 	</div>
				 	
				 	</div>

					<div class="divSize70">
						<div id="loc_RE">
							<a href="locSearch.htm?locationSearch=${location.locName }" style="text-decoration:none;">${location.locName }</a><br><hr>
						</div>
						 <div id="context_RE"> 
						 ${location.locContents }<br>
						 
							주소 : ${location.locAdd }<br>
							명소구분 : [${locGroupName }]<br>
							즐겨찾기 ${favoriteNum}명<br>
						</div>
					</div>
				
					  
				</div>	 
			
										<div id="map"></div>
			</div><!-- 블록 --> 

	</div>





	
	<br><br><br>
	<div id="low">
		<table>
			<tr>
				<th id="reviewBigBox">REVIEW</th>
			</tr>
		</table>
		
		<c:forEach var="review" items="${reviewList}">
			<a href="reviewDetail.htm?revCode=${review.revCode}">
				<div id="review" >
				<%-- onclick="location.href='reviewDetail.htm?revCode=${review.revCode}'" --%>
				
					<div id="reviewImage">
						<c:if test="${review.revImage != null }">
							<img src="${pageContext.request.contextPath}/image/${review.revImage}">
						</c:if>
						<c:if test="${review.revImage == null }">
							<img src="${pageContext.request.contextPath}/image/noimage.jpg">
						</c:if>
					</div>
					
					<div id="reviewBox">
						<div id="reviewTitleBox">
							<div id="reviewTitle" >
								${review.revName} - ${review.id}님이 쓴 후기
							</div>
				<%-- 			<div id="reviewDate" align="right">
								${review.revDate}
							</div> --%>
						</div>
						<br>
						<hr>	
						
						<div id="reviewContentsBox">
							<div id="reviewContents">${review.revContents}</div>
						</div>
						
					</div><!--id=review Box  -->
					
				</div><!-- id=review -->
			</a>
		</c:forEach>
					
	</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
</div>  