<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	try { document.execCommand('BackgroundImageCache', false, true); } catch (e) { }
</script>


<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=f2bc417ef3f82e7227cfaf75d9561006"></script>

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
		size : new nhn.api.map.Size(150, 120)
	//div영역 사이즈하고 맞출 것
	});

	oMarker.setPoint(oPoint); //마커의 좌표 설정
	oMap.addOverlay(oMarker); //맵 객체에 마커 추가
	
	});//end of document.ready

	/////////////////////////////////////////마커 끝///////////////////////////////////////////////////////
</script>

<!-- 명소 -->
<div class="container">
	<div id="top">
		<p></p>
	</div>
	<div id="middle">
		<ul class="column">

			<div class="block">
				<!-- 지역에 대한 후기 -->

				<div class="floatleft">

					<div class="divSize70">
						<div id="id_RE">
							<img src="https://ss0.4sqi.net/img/touch-icon-ipad-1d5a99e90171f6a0cc2f74920ec24021.png">
							<div>
								<img src="https://ss0.4sqi.net/img/touch-icon-ipad-1d5a99e90171f6a0cc2f74920ec24021.png">
							</div>
						</div>

						<div>
							<span id="loc_RE"> <a href="#">${location.locName }</a><br>
							</span> <span id="context_RE"> ${location.locContents }<br>
								${location.locAdd }<br> 경도: ${location.latitude } 위도:
								${location.longitude }<br> ABCABC<br> <a
								href="reviewWrite.htm?locName=${location.locName }">후기 작성</a> 
								<%-- <a href="reviewWrite.htm?locName=${location.locName }">글쓰기</a>
								<a href="reviewWrite.htm?locName=${location.locName }">글쓰기</a> --%>
							</span>
						</div>
					</div>

				</div>
				<div id="map"></div>
			</div>

		</ul>
	</div>
</div>



<hr>

<div id="middle">


	<!-- 리스트 -->
	<ul class="column">
		<div class="blockRE">
			REVIEW
			<hr>
			<c:forEach var="review" items="${reviewList}">
				<li><a href="reviewDetail.htm?revCode=${review.revCode}">
						<div id="revTextBox">
							<span id="revId"> ${review.id} writes ${review.revName} </span>
							${review.revDate} <br> 
							<span> ${review.revContents}<br></span>
						</div>

						<div id="revImgBox">
							<img src="/MS/WEB-INF/views/review/upload/${review.revImage}"><br>
							<!-- <img src="/MS/image/c.jpg"><br> -->
							
						</div>
				</a>
				<hr /></li>
			</c:forEach>
		</div>
	</ul>
</div>