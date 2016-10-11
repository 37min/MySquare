<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="description" content="Custom Login Form Styling with CSS3" />
<meta name="keywords"
	content="css3, login, form, custom, input, submit, button, html5, placeholder" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="import/LoginForm/css/style.css" />
<script src="import/LoginForm/js/modernizr.custom.63321.js"></script>
<script src="import/LoginForm/js/jquery.validate.js"></script>
<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
<style>
@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);

.container>header h1,.container>header h2 {
	color: #fff;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.7);
}
</style>

<script type="text/javascript">
$(document).ready(function(){

	$('select[id="hlDistrictSelect"]').change(
			function() {
				var hlLocName = $('#hlDistrictSelect').val();
				$.ajax({

					type : "get",
					url : "locSearchListHtoM.htm",
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
				url : "locSearchListMtoL.htm",
				data : {mlLocNameParam : mlLocName},
				dataType : "json",
				success : function(data) {
					var inner="";
					var inner2="";
					$.each(data.mlArray,function(index,mlArray){
							inner += "<option value = ";
							inner += this.llCode;
							inner += ">";
							inner += this.llName;
							inner += "</option>";
					});
					
					inner2 += "<input type='text' name='LLLocCode' value=" +this.llLocCode + ">";
					$('#llDistrictSelect').append(inner);
					$('#llLocCode').append(inner);
				},
				error : function(data) {
					alert('Error 발생');
				}
			});
		});
		
		//소->코드
		$('select[id="llDistrictSelect"]').change(
		function() {
			var llLocName = $('#llDistrictSelect').val();
			 $.ajax({
				type : "get",
				url : "locSearchListLtoC.htm",
				data : {llLocNameParam : llLocName},
				dataType : "json",
				success : function(data) {
					/* var inner = "";
					inner += "<input type='text' value="+ data.llCode +" >";
					$('#llLocCode').append(inner);  */
					$("#llLocCode").val(data.llCode);
					
					
				},
				error : function(data) {
					alert('Error 발생');
				}
			}); 
		});

});
</script>

<!-- 유효성 시작&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->
<script type="text/javascript">
(function($){

    $(document).ready(function() {

    $('#locInsertForm').validate({
            rules: {
            	locName : { required: true, maxlength: 40},
            	locGroupCode: {required: true, number: true },
            	LLLocCode: {required: true, number: true },
            	locAdd: {required: true, maxlength: 200 },
            	locContents: {required: true, maxlength: 1000 }            	
            },
            messages: {
            	locName: {required:"필수입력 사항 입니다.",maxlength: jQuery.format("글자 수는 {0}자 이하")},
                locGroupCode: { required:"필수입력 사항 입니다."},
                LLLocCode: { required:"필수입력 사항 입니다."},
                locAdd: { required:"필수입력 사항 입니다.",maxlength: jQuery.format("글자 수는 {0}자 이하")},
                locContents: { required:"필수입력 사항 입니다.",maxlength: jQuery.format("글자 수는 {0}자 이하")}
            },
            submitHandler: function (frm) {
                frm.submit();
            },
            success: function (e) { 
            //
            }
        });
    });
})(jQuery);
</script> 
<!-- 유효성 끝&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&-->

<c:choose>
	<c:when test="${sessionScope.id == 'admin' }">
	<img src = "image/header/menu0.png">
		<div>
			<form class="form-4" action="locInsertProcess.htm" method="post" enctype="multipart/form-data"  id="locInsertForm">
				<br><br>
				
					<h1>지역 정보 입력</h1>
					Loc Name
					<input type="text" name="locName">
					<br>
					
					Loc Group Code
					<select name="locGroupCode"> 
						<option>명소분류코드</option>
						<c:forEach var="loc" items="${locList}">
							<option value="${loc.locGroupCode }">${loc.locGroupName }</option>
						</c:forEach>
					</select>
					<br>
					
					High Loc Distict Name 
					<select id="hlDistrictSelect">
						<option selected="selected">도/특별시/광역시</option>
						<c:forEach items="${hlDistrict}" var="hlDistrict">
							<option value=${hlDistrict.HLLocCode }>${hlDistrict.HLLocName}</option>
						</c:forEach>
					</select> 
					<br>
					
					Mid Loc Distict Name
					<select id="mlDistrictSelect">
						<option selected="selected">시/군/구</option>
						
					</select>
					<br>
					
					Low Loc Distict Name 
					<select id="llDistrictSelect" >
						<option selected="selected">구/읍/면/동</option>
					</select>
					<br>
					
					Low Loc Code 
					<input type="text" id="llLocCode" name="LLLocCode">
					<br>
					
					Loc Address
					<input type="text" name="locAdd">
					<br>
					 
					Loc Contents 
					<textarea name="locContents"  rows=5></textarea>
					<br>
					
					Latitude 
					<input type="text"  name="longitude" value="${coordinate[0]}" readonly>
					<br>
					
					Longitude 
					<input type="text"  name="longitude" value="${coordinate[1]}"  readonly>
					<br>
					
					Loc Image
					<input type="file" name="file">
					<br><br>
					
					<input type="submit" value="Insert">
				<br><br><br><br><br><br><br><br><br><br><br><br>
			</form>
		</div>
	</c:when>
		<c:otherwise>
		<script>
			javascript_:history.go(-1);
		</script>
	</c:otherwise>
</c:choose>