<%@page import="kr.co.mysquare.dto.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	try { document.execCommand('BackgroundImageCache', false, true); } catch (e) { }
</script>

  <!-- 
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=f2bc417ef3f82e7227cfaf75d9561006"></script> -->
	<!-- localhost -->
	
	  <!-- 
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=b5dfe4a1c78f4bb89191450747d58e6b"></script> -->
	<!-- 192.168.7.227 -->

<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=cd35cafc0e534805cbadaeec014e9f3a"></script>	
	
	<!-- 192.168.7.107  -->
 

	<!-- 버튼 -->
	<link rel="stylesheet" type="text/css" href="import/AnimatedButtons/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="import/AnimatedButtons/css/style3.css" />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
	<!-- ------------ -->
 <div id = "route">
 	<img src = "image/header/menu1.png">
 </div>
	<div id="container" style="width:100%; height:100%;" >
		<div id="leftSide" style="float:left; width:30%; height:100%; overflow-y:scroll;" >

			<table style="width:100%;">
				<tr>
					<th>"<span style="color:red;">${locationSearch}</span>"으로 검색한 지역정보</th>
				</tr>
				<tr>
					<th>
						<select id="locGroupSelect">
							<option value="0">그룹전체선택</option>
							<c:forEach var="locGroup" items="${locGroupList}" >
								<option value="${locGroup.locGroupCode}">${locGroup.locGroupName }</option>
							</c:forEach>
						</select>
					</th>
				</tr>
				<tr>
					<th>
						찾으시는 정보가 없을 경우 
					</th>
				</tr>
				<tr>
					<th>
						<a href="mailToAdmin.htm" style="color:red;">여기</a>를 눌러 관리자에게 메일을 보내세요!
					</th>
				</tr>
			</table>
			<div id="locListBtns">
				<c:forEach var="loc" items="${locList}">
							<div class="content" onclick="setCenter(${loc.latitude }, ${loc.longitude})" >
								<a class="a-btn" style="width:95%">
									<span class="a-btn-text"> ${loc.locName }</span> 
									<span class="a-btn-slide-text"> ${loc.locAdd }</span>
									<span class="a-btn-icon-right"><span></span></span>
								</a>
							</div>
				</c:forEach>
			</div>
		</div>

		<div id="mapWrapper">
			<!-- <div id="map" style="width: 700px; height: 650px; margin: 20px; float:left;box-shadow:5px 5px 5px #999; margin-left:70px;" ></div> -->
			<div id = "mapBox">
				<div id="map" style="float:left;"></div>
			</div>
		</div>
	</div>





<script type="text/javascript">
	/////////////////////////////////////////지도 생성 시작 ///////////////////////////////////////////////////////
	var oPoint = new nhn.api.map.LatLng('${requestScope.coordinate[1]}', '${requestScope.coordinate[0]}');
		
	if( oPoint.toString() == "," )
	{
		alert("해당하는 지역명이 없습니다!\n지역검색은 시/군/구/동 단위로 해주시기 바랍니다.\n서울시청으로 이동합니다.");
		oPoint = new nhn.api.map.LatLng(37.5673655, 126.9782072); //서울시청 default 값 
	}
	
	var container = $('#container').width();
	var leftSide = $('#leftSide').width();
	var mapWidth = container-leftSide;
	/* alert("container size : " + container);
	alert("leftSide size : " + leftSide);
	alert("뺸 값 : " + (container-leftSide) ); */
	
	nhn.api.map.setDefaultPoint('LatLng');
		//지도 객체 생성
	oMap = new nhn.api.map.Map('map', {
		point : oPoint,
		zoom : 12,
		enableWheelZoom : true,
		enableDragPan : true,
		enableDblClickZoom : false,
		mapMode : 0,
		activateTrafficMap : false,
		activateBicycleMap : false,
		minMaxLevel : [ 2, 14 ],
		size : new nhn.api.map.Size(mapWidth - 150, 650)
	//div영역 사이즈하고 맞출 것
	});
	/////////////////////////////////////////지도 생성끝 ///////////////////////////////////////////////////////

	/////////////////////////////////////////마커 설정정보///////////////////////////////////////////////////////
	//var markerCount = 0;
			//기본마커
		var dSize = new nhn.api.map.Size(28, 37);
		var dOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', dSize, dOffset);


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

		if (oTarget instanceof nhn.api.map.Marker) // 마커 클릭하면 
		{
			if (oCustomEvent.clickCoveredMarker) return;// 겹침 마커 클릭한거면 return

			oMap.setCenter(oPoint);
			
			var oMarkerId = oCustomEvent.target.getTitle();
			//alert(oMarkerId); 
			
			
			if( oMarkerId != "지역정보 추가" )
			{
				$.ajax({
					type:"get", //get방식으로
					url: "getLocById.htm", //해당 url로
					data : {locName : oMarkerId}, //data를 갖고
					dataType : "json", //반환받는 data type은 JSON 형태
					success:function(data){  //비동기 성공했을 때
						var locName = data.locName;
						var content = "";
					
						content = '<div class="infoWindow">';
						content	+= 	'<div class="infoLeft">';
						
						if( data.locImage != null )
						{
							content	+= 	'<img src="' + '${pageContext.request.contextPath}' + '/image/' + data.locImage + '" >';							
						}
						else if( data.locImage == null )
						{
							content	+= 	'<img src="' + '${pageContext.request.contextPath}' + '/image/noimage.jpg >';
						}
						
						
						content	+= '</div>';
						
						content += '<div class="infoRight">';
						content += 	'<span class="title">' + data.locName + '</span><br><br>';
						content += '<span class="contents">' + data.locContents + '</span><br>';
						content += '<span><a href=" locDetail.htm?locName=' + data.locName + '">상세보기</a></span>';
						
						if( '${sessionScope.id}' == 'admin')
						{
							content += '&nbsp;&nbsp;<span><a href="locEdit.htm?locName=' + data.locName + '">수정</a></span>';
							content += '&nbsp;&nbsp;<span><a href="javascript:;" onclick="deleteConfirm(' +"'" + locName + "'" + ')">삭제</a></span>';

						}
						content += '</div></div>';
						
						//infoWindow 객체에 컨텐트 설정
						mapInfoWindow.setContent(content);

						console.log("비동기 성공이야"); 
						} ,
					error:function(data){ console.log("비동기 실패야"); }
				});
			}
			
			else if( oMarkerId == "지역정보 추가" )
			{
				mapInfoWindow.setContent('<div class="infoWindow"><span class="insert"><br>' 
				+ '<a href=locInsert.htm?point=' + oPoint.toString() + '>이 위치에 마커를 입력합니다.</a>'
				+ '</span></div>');
			}

			mapInfoWindow.setPoint(oPoint); //infoWindow의 좌표를 클릭한 좌표로 설정
			mapInfoWindow.setPosition({ top : 30 }); //infoWindow의 위치를 30px위쪽으로
			mapInfoWindow.autoPosition(); //infoWindow의 content가 맵 크기보다 커질 시 자동위치조정
			
			mapInfoWindow.setVisible(true); //infoWindow 보이게


			return;
		}//마커클릭 끝

		//아직 미구현
		if ('${sessionScope.id}' == 'admin') //나중에 명소 추가하고 싶을 때 어드민만 클릭할 수 있게 할 것
		{
			var oMarker = new nhn.api.map.Marker(oIcon, { title : '지역정보 추가'} );
			
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);
		}//admin
	});//클릭이벤트 끝
	
	function setCenter(x, y)
	{
		var point = new nhn.api.map.LatLng(y, x);
		oMap.setCenter(point);
	}
	
	function deleteConfirm(locName)
	{
		if( confirm("해당 지역정보를 삭제하시겠습니까?") ) //삭제할 때
		{
			/* locDelete.htm?locName=' + data.locName */ 
			location.href="locDelete.htm?locName=" + locName;
		}
		else //삭제 안할 때
		{
			return;
		}
	}

	//페이지가 로드 되면
	$(document).ready(function() {
		
		//마커그림 정보
		
		//지역분류별 마커
		var oSize = new nhn.api.map.Size(45, 45);
		var oOffset = new nhn.api.map.Size(15, 15);
		
		var food_Icon = new nhn.api.map.Icon('image/map/marker_food.png', oSize, oOffset);
		var drink_Icon = new nhn.api.map.Icon('image/map/marker_drink.png', oSize, oOffset);
		var coffee_Icon = new nhn.api.map.Icon('image/map/marker_coffee.png', oSize, oOffset);
		var shopping_Icon = new nhn.api.map.Icon('image/map/marker_shopping.png', oSize, oOffset);
		var landmark_Icon = new nhn.api.map.Icon('image/map/marker_landmark.png', oSize, oOffset);
		var art_Icon = new nhn.api.map.Icon('image/map/marker_art.png', oSize, oOffset);
		
		//기존 아이콘 : http://static.naver.com/maps2/icons/pin_spot2.png
		
		//DB에 있는 location의 위도 경도를 사용해 마커로 변환
		<c:forEach var="loc" items="${locList}">
			var point = new nhn.api.map.LatLng('${loc.longitude}', '${loc.latitude}'); //좌표
			var oMarker = null;
			if( '${loc.locGroupCode}' == 100 ) //음식
			{
				oMarker = new nhn.api.map.Marker(food_Icon, { title : '${loc.locName}' }); 
			}
			else if ( '${loc.locGroupCode}' == 200 ) //밤문화
			{
				oMarker = new nhn.api.map.Marker(drink_Icon, { title : '${loc.locName}' }); 
			}
			else if ( '${loc.locGroupCode}' == 300 ) //커피
			{
				oMarker = new nhn.api.map.Marker(coffee_Icon, { title : '${loc.locName}' });
			}
			else if ( '${loc.locGroupCode}' == 400 ) //쇼핑
			{
				oMarker = new nhn.api.map.Marker(shopping_Icon, { title : '${loc.locName}' });
			}
			else if ( '${loc.locGroupCode}' == 500 ) //관광지
			{
				oMarker = new nhn.api.map.Marker( landmark_Icon, { title : '${loc.locName}' });
			}
			else if ( '${loc.locGroupCode}' == 600 ) //예술
			{
				oMarker = new nhn.api.map.Marker(art_Icon, { title : '${loc.locName}' });
			}
			
			
			oMarker.setPoint(point); //마커의 좌표 설정
			oMap.addOverlay(oMarker); //맵 객체에 마커 추가
		</c:forEach>
			
		oMap.addOverlay(mapInfoWindow); // - 지도에 추가.     
			
		$("#locGroupSelect").change(function(){
			var locGroupCode = $("#locGroupSelect").val();
/* 			alert("value : " + locGroupCode); //잘됨
			alert("locSearch : " + '${locationSearch}'); */
			
			if( locGroupCode == 0 )
			{
				$.ajax({
					type:"get", //get방식으로
					url: "getLocationsByLocGroupAndInputLocName.htm", //해당 url로
					data : {
						inputLocName : '${locationSearch}', locGroupCode : locGroupCode
						}, //data를 갖고
					dataType : "json", //반환받는 data type은 JSON 형태
					success:function(data){  //비동기 성공했을 때
							
							var inner = "";
							for(var i = 0 ; i < data.length; i++)
							{
								 inner += 	
									"<div class='content' onclick='setCenter(" + data[i].latitude + ", " + data[i].longitude + ")'>" +
										"<a class='a-btn' style='width:95%'>" +
											"<span class='a-btn-text'>" + data[i].locName + "</span>" + 
											"<span class='a-btn-slide-text'>" +  data[i].locAdd + "</span>" +
											"<span class='a-btn-icon-right'><span></span></span>" +
										"</a>" +
									"</div>";		
							}
							$("#locListBtns").html(inner);			
						} ,
					error:function(data){ console.log("비동기 실패야"); }
				});
			}
			
			else
			{
				$.ajax({
					type:"get", //get방식으로
					url: "getLocationsByLocGroupAndInputLocName.htm", //해당 url로
					data : {
						inputLocName : '${locationSearch}', locGroupCode : locGroupCode
						}, //data를 갖고
					dataType : "json", //반환받는 data type은 JSON 형태
					success:function(data){  //비동기 성공했을 때
							
							var inner = "";
							for(var i = 0 ; i < data.length; i++)
							{
								 inner += 	
									"<div class='content' onclick='setCenter(" + data[i].latitude + ", " + data[i].longitude + ")'>" +
										"<a class='a-btn' style='width:95%'>" +
											"<span class='a-btn-text'>" + data[i].locName + "</span>" + 
											"<span class='a-btn-slide-text'>" +  data[i].locAdd + "</span>" +
											"<span class='a-btn-icon-right'><span></span></span>" +
										"</a>" +
									"</div>";		
							}
							$("#locListBtns").html(inner);
		
						} ,
					error:function(data){ console.log("비동기 실패야"); }
				});
			}
			
			
		});

	});//end of document.ready

	/////////////////////////////////////////마커 끝///////////////////////////////////////////////////////
</script>
