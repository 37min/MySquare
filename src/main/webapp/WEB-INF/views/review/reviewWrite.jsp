<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="description" content="Custom Login Form Styling with CSS3" />
<meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="import/LoginForm/css/style.css" />
<script src="import/LoginForm/js/modernizr.custom.63321.js"></script>
<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
<script src="import/LoginForm/js/jquery.validate.js"></script>

<style>
<script type="text/javascript">
(function($){

    $(document).ready(function() {

    $('#form-4').validate({
            rules: {
                revName: {required: true, maxlength: 10 },
                revContents: {required: true,  maxlength: 200 },
                 file: {required: true,  maxlength: 10 },
               
            },
            messages: {
                revName: { required:"필수입력 사항 입니다.", maxlength: jQuery.format("글자 수는 {0}자 이하") },
                revContents: { 
                	required:"필수입력 사항 입니다.",
                	maxlength: jQuery.format("글자 수는 {0}자 이하")
                                },
                   revContents: { 
                	maxlength: jQuery.format("파일명 길이는 {0}자 이하")
                                },             
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
@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);

.container>header h1,.container>header h2 {
	color: #fff;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.7);
}
</style>
	<form class="form-4" method="post" action="reviewWrite.htm"  enctype="multipart/form-data" >
		<br> <br>
		<h1>후기 작성</h1>
		명소이름<input name="locName" type="text" value="${locName}" readonly><br>
		작성자ID<input name="id" type="text" value="${sessionScope.id}" readonly><br>
		후기분류
		<select name="revGroupCode"  id="revGroupCode">
			<c:forEach var="revGroup" items="${revGroupList}">
				<option value="${revGroup.revGroupCode }">${revGroup.revGroupName }</option>
			</c:forEach>
		</select>
		<br>
		
		후기제목<input name="revName" type="text"><br>
		
		후기내용<textarea rows="7" cols="50" name="revContents"></textarea><br>
		
		후기 이미지  <input name="file" type="file" value="첨부"><br><br>
		
		<input type="submit" value="입력"  id="reviewWrite"><br>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	</form>