<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
                 
      <!-- form -->
       <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="import/LoginForm/css/style.css" />
		<script src="import/LoginForm/js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>	
			@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
			body {
				background: #7f9b4e url(import/LoginForm/images/bg2.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.7);
			}
		</style>
<!-- dropdown -->


<div class="container">
<section class="main">
				<form class="form-4" name="formElem" action="memberJoin.htm" method="post">
				    <h2>Register</h2>
				    <p>
				        <label for="login">Username or email</label>
				        <input type="text" name="id" placeholder="Username or email" required>
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" name='pwd' placeholder="Password" required> 
				    </p>
				    <p>
				        <label for="password">Password confirm</label>
				        <input type="password"  placeholder="Password Confirm" required> 
				    </p>
				    <p>
				        <label for="email">email</label>
				        <input type="text" name='email' placeholder="email" required> 
				    </p>
				    <p>
				        <label for="sex">sex</label>
				        <input type="text" name='sex' placeholder="sex" required> 
				    </p>
				  
				    <p>
				        <label for="place">place</label>
				        <input type="text" name='place' placeholder="place" required> 
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
       <form id="formElem" name="formElem" action="memberJoin.htm" method="post">
       <input id="id" name="id" type="text" AUTOCOMPLETE=OFF />아이디 <br>
       <input id="pwd" name="pwd" type="text" AUTOCOMPLETE=OFF />암호 <br>
       <input id="name" name="name" type="text" AUTOCOMPLETE=OFF />이름<br>
       <input id="email" name="email" type="text" AUTOCOMPLETE=OFF />이메일<br>
       <input id="sex" name="sex" type="text" AUTOCOMPLETE=OFF />성별<br>
       <input id="place" name="place" type="text" AUTOCOMPLETE=OFF />장소<br>
       <button id="registerButton" type="submit">Register</button>
       </form>
             	</dt>
</dl>
</div>
                   -->
</body>


</html>