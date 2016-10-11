<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
 $(document).ready(
		function() {
			//대->중
			$('select[id="hlDistrictSelect"]').change(
					function() {
						var hlLocName = $('#hlDistrictSelect').val();
						$.ajax({

							type : "get",
							url : "locEdit2.htm",
							data : {hlLocNameParam : hlLocName},
							dataType : "json",
							success : function(data) {
								
								var inner="";
								$.each(data.hlArray,function(index,hlArray){
										inner += "<option value = ";
										inner += this.mlCode;
										inner += ">";
										inner += this.mlName;
										inner += "</option>";
								});
								$('#mlDistrictSelect').append(inner);
							},
							error : function(data) {
								alert('Error 발생');
							}
						});
					});
			
			//중->소
			$('select[id="mlDistrictSelect"]').change(
			function() {
				var mlLocName = $('#mlDistrictSelect').val();
				$.ajax({
					type : "get",
					url : "locEdit3.htm",
					data : {mlLocNameParam : mlLocName},
					dataType : "json",
					success : function(data) {
						var inner="";
						$.each(data.mlArray,function(index,mlArray){
								inner += "<option value = ";
								inner += this.llCode;
								inner += ">";
								inner += this.llName;
								inner += "</option>";
						});
						$('#llDistrictSelect').append(inner);
					},
					error : function(data) {
						alert('Error 발생');
					}
				});
			});
			
			
			$('#locSearchBtn').click(
			function() {
				alert("버튼클릭");
				var llLocName = $('#llDistrictSelect').val();
				$.ajax({
					type : "get",
					url : "locEdit4.htm",
					data : {llLocNameParam : llLocName},
					dataType : "json",
					success : function(data) {
						
						/*<tr>
						obj.put("locName" , loc.getLocName());
			obj.put("locGroupCode" , loc.getLocGroupCode());
			obj.put("locContents" , loc.getLocContents());
			obj.put("locAdd" , loc.getLocAdd());
			obj.put("latitude" , loc.getLatitude());
			obj.put("longitude" , loc.getLongitude());
			obj.put("locDate" , loc.getDate());
						</tr>  */
						var inner="";
						inner += "<tr>";
						inner += "<td>LocName</td>";
						inner += "<td>LocGroupCode</td>";
						inner += "<td>LocContents</td>";
						inner += "<td>LocAdd</td>";
						inner += "<td>latitude</td>";
						inner += "<td>longitude</td>";
						inner += "<td>LocDate</td>";
						inner += "</tr>";
						$.each(data.location,function(index,location){
								inner += "<tr>";
									inner += "<td>" + this.locName +"</td>";
									inner += "<td>" + this.locGroupCode +"</td>";
									inner += "<td>" + this.locContents +"</td>";
									inner += "<td>" + this.locAdd +"</td>";
									inner += "<td>" + this.latitude +"</td>";
									inner += "<td>" + this.longitude +"</td>";
									inner += "<td>" + this.locDate +"</td>";
								inner += "</tr>";
						});
						$('#locSearchTable').append(inner);
					},
					
					
					error : function(data) {
						alert('Error 발생');
					}
				});
			});
		}); 
</script>

</head>
<body>
	<h3>마커 검색 페이지</h3>
	
	<select id="hlDistrictSelect">
		<option selected="selected">도/특별시/광역시</option>
		<c:forEach items="${hlDistrict}" var="hlDistrict">
			<option value=${hlDistrict.HLLocCode }>${hlDistrict.HLLocName}</option>
		</c:forEach>
	</select>

	<select id="mlDistrictSelect">
		<option selected="selected">시/군/구</option>
		
	</select>

	<select id="llDistrictSelect" >
		<option selected="selected">구/읍/면/동</option>
		
	</select>
	
	<input type="button" id="locSearchBtn" value="검색"/>
	
	
	<table id="locSearchTable" border="1">

	</table>
	
	

</body>
</html>