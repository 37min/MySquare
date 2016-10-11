<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.mysquare.dto.Member"%>
<%@ page import="java.util.Enumeration" %>
<script src="import/LoginForm/js/jquery.validate.js"></script>

  <!-- form -->
       <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="import/LoginForm/css/style.css" />
		<script src="import/LoginForm/js/modernizr.custom.63321.js"></script>
	<!--  -->

<script type="text/javascript">
(function($){

    $(document).ready(function() {

    $('#form-4').validate({
            rules: {
                id: { required: true, minlength: 3, maxlength: 10 },
                pwd: {required: true, maxlength: 10 },
               
            },
            messages: {
                id: {required:"필수입력 사항 입니다.",
                    minlength: jQuery.format("아이디는 {0}자 이상"),
                    maxlength: jQuery.format("아이디는 {0}자 이하")
                },
                pwd: { required:"필수입력 사항 입니다." },
                maxlength: jQuery.format("글자수는 {0}자 이하")
                
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

<% String favor = request.getParameter("alert"); %>
<%  if ( favor == null)
 {

 }else if (favor.equals("1")){
%>
	<script>
	alert("없는 ID입니다 ");
	</script>
<%
 }else if (favor.equals("2")){
	 %>
		<script>
		alert("암호가 틀렸습니다.");
		</script>
	<% 
 }else{
	 
 }
%>   
 <img src = "image/header/menu0.png">
<div class="container">
<section class="main">
				<form class="form-4" name="form-4" id="form-4" action="memberLogin.htm" method="post">
				    <h2>Member Login</h2>
				    <p>
				        <label for="id">ID</label>
				        <input type="text" name="id" id="id" placeholder="ID" AUTOCOMPLETE=OFF  required>
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" id="pwd" name='pwd' placeholder="Password" AUTOCOMPLETE=OFF required> 
				    </p>
				    <p>
				        <input type="submit" id="registerButton" name="submit" value="Login">
				    </p>       
				</form>​
</section>
</div>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


       <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, email, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="import/LoginForm/css/style.css" />
		<script src="import/LoginForm/js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>	
			@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
		
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.7);
			}
		</style>



<div class="container">
<section class="main">
				<form class="form-4" name="formElem" action="memberLogin.htm" method="post">
				    <h1>Login or Register</h1>
				    <p>
				        <label for="login">Username or email</label>
				        <input type="text" name="id" placeholder="ID" required autofocus>
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" name='pwd' placeholder="Password" required> 
				    </p>

				    <p>
				        <input type="submit" id="registerButton" name="submit" value="Continue">
				    </p>       
				</form>​
</section>
</div>



<!-- 

              <div id="" class="" >						
							<dl class="">
								<dt class="">
       <form id="formElem" name="formElem" action="memberLogin.htm" method="post">
       <input id="id" name="id" type="text" AUTOCOMPLETE=OFF />아이디<br>
       <input id="pwd" name="pwd" type="password" AUTOCOMPLETE=OFF />암호 <br>
       <button id="registerButton" type="submit">Login</button>
       </form>
       <a href="memberJoin.htm">Join</a>
       								</dt>
</dl>
</div>

 --> --%>