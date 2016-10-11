<%@page import="kr.co.mysquare.dto.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	try { document.execCommand('BackgroundImageCache', false, true); } catch (e) { }
</script>

<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=f2bc417ef3f82e7227cfaf75d9561006"></script>

<div id="map" style="width: 500px; height: 400px; margin: 20px;"></div>

<script type="text/javascript">
	/////////////////////////////////////////지도 생성 시작 ///////////////////////////////////////////////////////
	var oPoint = 
		new nhn.api.map.LatLng('${requestScope.coordinate[1]}', '${requestScope.coordinate[0]}'); //el 표기 getAttribute
	nhn.api.map.setDefaultPoint('LatLng');
		//지도 객체 생성
	oMap = new nhn.api.map.Map('map', {
		point : oPoint,
		zoom : 10,
		enableWheelZoom : true,
		enableDragPan : true,
		enableDblClickZoom : false,
		mapMode : 0,
		activateTrafficMap : false,
		activateBicycleMap : false,
		minMaxLevel : [ 2, 14 ],
		size : new nhn.api.map.Size(500, 400)
	//div영역 사이즈하고 맞출 것
	});
	/////////////////////////////////////////지도 생성끝 ///////////////////////////////////////////////////////

	/////////////////////////////////////////마커 설정정보///////////////////////////////////////////////////////
	//var markerCount = 0;

	//마커그림 정보
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
	var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 

	var mapInfoWindow = new nhn.api.map.InfoWindow(); // - info window 객체 생성

	var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
	
	oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
	
	//infoWindow객체에 이벤트 추가
	mapInfoWindow.attach('changeVisible', function(oCustomEvent) {
		if (oCustomEvent.visible) 
		{
			oLabel.setVisible(false);
		}
	});

	//map객체에 이벤트 추가
	oMap.attach('mouseenter', function(oCustomEvent) {
		var oTarget = oCustomEvent.target;
		// 마커위에 마우스 올라간거면
		if (oTarget instanceof nhn.api.map.Marker) 
		{
			var oMarker = oTarget;
			oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
		}
	});

	//map 객체에 이벤트 추가
	oMap.attach('mouseleave', function(oCustomEvent) {
		var oTarget = oCustomEvent.target;
		// 마커위에서 마우스 나간거면
		if (oTarget instanceof nhn.api.map.Marker) {
			oLabel.setVisible(false); //안보이게
		}
	});

	//map 객체에 click 이벤트 추가
	oMap.attach('click', function(oCustomEvent) {
		var oPoint = oCustomEvent.point; //클릭한 좌표
		
		var oTarget = oCustomEvent.target; //클릭한 타겟(여기서는 마커)
		
		mapInfoWindow.setVisible(false); //infoWindow 안보이게
		 
		var oMarkerId = oCustomEvent.target.getTitle();
		//alert(oMarkerId); 

		if (oTarget instanceof nhn.api.map.Marker) // 마커 클릭하면 
		{
			if (oCustomEvent.clickCoveredMarker) return;// 겹침 마커 클릭한거면 return

			//아니면 비동기
			$.ajax({
				type:"get", //get방식으로
				url: "getLocById.htm", //해당 url로
				data : {locName : oMarkerId}, //data를 갖고
				dataType : "json", //반환받는 data type은 JSON 형태
				success:function(data){  //비동기 성공했을 때

					//infoWindow 객체에 컨텐트 설정
					mapInfoWindow
					.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'
							+ '<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 2px 2px 2px !important">'
							+ "<h4>" + data.locName + "</h4>"
							+ data.locContents
							+ '<br />'
							+ '<a href=' + "'locDetail.htm?locName=" + data.locName + "'>locDetail</a>"
							+ '<span></div>');
					console.log("비동기 성공이야"); 
					} ,
				error:function(data){ console.log("비동기 실패야"); }
			});

			mapInfoWindow.setPoint(oPoint); //infoWindow의 좌표를 클릭한 좌표로 설정
			mapInfoWindow.setPosition({ top : 30 }); //infoWindow의 위치를 30px위쪽으로
			mapInfoWindow.autoPosition(); //infoWindow의 content가 맵 크기보다 커질 시 자동위치조정
			
			mapInfoWindow.setVisible(true); //infoWindow 보이게

			return;
		}//마커클릭 끝

		//아직 미구현
		if (false) //나중에 명소 추가하고 싶을 때 어드민만 클릭할 수 있게 할 것
		{
			var oMarker = new nhn.api.map.Marker(oIcon, {
				title : '타이틀 -> 마커ddd: ' + oPoint.toString()
			
			});
			
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);
		}//admin
	});//클릭이벤트 끝

	//페이지가 로드 되면
	$(document).ready(function() {
		
		//DB에 있는 location의 위도 경도를 사용해 마커로 변환
		<c:forEach var="loc" items="${locList}">
			var point = new nhn.api.map.LatLng('${loc.longitude}', '${loc.latitude}'); //좌표
			var oMarker = new nhn.api.map.Marker(oIcon, { title : '${loc.locName}' }); //마커 아이콘과 title 설정
			
			oMap.addOverlay(mapInfoWindow); // - 지도에 추가.     
			oMarker.setPoint(point); //마커의 좌표 설정
			oMap.addOverlay(oMarker); //맵 객체에 마커 추가
		</c:forEach> //반복

	});//end of document.ready

	/////////////////////////////////////////마커 끝///////////////////////////////////////////////////////
</script>
