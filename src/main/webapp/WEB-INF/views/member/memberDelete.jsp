<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- form -->
<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="import/LoginForm/css/style.css" />
<script src="import/LoginForm/js/modernizr.custom.63321.js"></script>
<script src="import/LoginForm/js/jquery.validate.js"></script>
<img src = "image/header/menu0.png">
<div class="container">
	<section class="main">
		<br><br>
		<form class="form-4" name="form-4" id="form-4" action="memberDelete.htm" method="post">
			<h2>회원 삭제</h2>
	       <input id="id" name="id" type="text" value="${sessionScope.id}" readonly /><br>
	          님 정말 탈퇴 하시겠습니까? 
	       <button id="registerButton" type="submit">Delete</button>
       </form>
	</section>
</div>
