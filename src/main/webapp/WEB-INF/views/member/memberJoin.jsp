<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.mysquare.dto.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                pwd2: {required: true, equalTo: "#pwd" },
                email: {required: true,  email: true, maxlength: 25 },
                sex: {required: true, },
                place: {required: true, maxlength: 50 },
            },
            messages: {
                id: {required:"필수입력 사항 입니다.",
                    minlength: jQuery.format("아이디는 {0}자 이상"),
                    maxlength: jQuery.format("아이디는 {0}자 이하")
                },
                pwd: { required:"필수입력 사항 입니다.",equalTo:"암호를 다시 확인 하세요", maxlength: jQuery.format("글자 수는 {0}자 이하") },
                pwd2: { required:"필수입력 사항 입니다." },
                email: { 
                	required:"필수입력 사항 입니다.",
                	email:"올바른 이메일주소를 입력하시오.",
                	maxlength: jQuery.format("글자 수는 {0}자 이하")
                                },
                                sex: { required:"필수입력 사항 입니다." },
                                place: { required:"필수입력 사항 입니다.", maxlength: jQuery.format("글자 수는 {0}자 이하") },
                                
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
<title>Insert title here</title>
</head>
<body>

<div class="container">
<section class="main">
				<form class="form-4" name="form-4" id="form-4" action="memberJoin.htm" method="post">
				    <h2>회원 가입</h2>
				        <label for="id">ID</label>
				        <input type="text" name="id" id="id" placeholder="ID" AUTOCOMPLETE=OFF required>

				        <label for="password">Password</label>
				        <input type="password" id="pwd" name='pwd' placeholder="Password" AUTOCOMPLETE=OFF required> 

				        <label for="password">Password</label>
				        <input id="pwd2" name='pwd2' type="password" placeholder="Password Confirm" AUTOCOMPLETE=OFF required/>

				        <label for="name">name</label>
				        <input type="text" id="name" name='name' placeholder="name" AUTOCOMPLETE=OFF required> 

				        <label for="email">email</label>
				        <input type="text" id="email" name='email' placeholder="email" AUTOCOMPLETE=OFF required> 

						<label for="place">place</label>
				        <input type="text" id="place" name='place' placeholder="place" AUTOCOMPLETE=OFF required> 

				        <label for="sex">sex</label>
				        <!-- <input type="text" id="sex" name='sex' placeholder="sex" AUTOCOMPLETE=OFF required>  -->
				           <br>Choose Your Sex :
				 		<input type="radio" id="sex" name="sex" value="man">Man
				 		<input type="radio" id="sex" name="sex" value="woman">Woman
				 		<br>
				 		<br>
				 		  
				        
				        <input type="submit" id="registerButton" name="submit" value="register">
				</form>​
</section>
</div>
             


<!-- 
       <form id="form-4" name="form-4" action="memberEdit.htm" method="post">
       <input id="id" name="id" type="text" value="${sessionScope.id}" readonly />아이디 <br>
       <input id="pwd" name="pwd" type="text" AUTOCOMPLETE=OFF />암호 <br>
       <input id="pwd2" type="hidden" value="${member.pwd}"/>
       <input id="name" name="name" type="text" value="${member.name}" AUTOCOMPLETE=OFF />이름 <br>
       <input id="email" name="email" type="text" value="${member.email}" AUTOCOMPLETE=OFF />이메일 <br>
       <input id="sex" name="sex" type="text" value="${member.sex}" AUTOCOMPLETE=OFF />성별 <br>
       <input id="place" name="place" type="text" value="${member.place}" AUTOCOMPLETE=OFF />장소 <br>
       <button id="registerButton" type="submit">Update</button>
       </form>
 -->
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="import/LoginForm/js/jquery.validate.js"></script>
<script type="text/javascript">
(function($){

    $(document).ready(function() {

    $('#form-4').validate({
            rules: {
                id: {  minlength: 3 },
                pwd: {},
                pwd2: { equalTo: "#pwd" },
                email: {  email: true },
            },
            messages: {
                id: {
                    minlength: jQuery.format("아이디는 {0}자 이상")
                },
                pwd: {  },
                pwd2: { equalTo:"암호를 다시 확인 하세요" },
                email: { 
                	email:"올바른 이메일주소를 입력하시오."
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      <!-- form -->
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
<!-- dropdown -->


<div class="container">
<section class="main">
				<form class="form-4" name="form-4" id="form-4" action="memberJoin.htm" method="post">
				    <h2>Register</h2>
				    <p>
				        <label for="id">ID</label>
				        <input type="text" name="id" id="id" placeholder="ID" AUTOCOMPLETE=OFF  required>
				    </p>
				    <p>
				        <label for="password">Password</label>
				        <input type="password" id="pwd" name='pwd' placeholder="Password" AUTOCOMPLETE=OFF required> 
				    </p>
				    <p>
				        <label for="pwd2">Password confirm</label>
				        <input type="password" id="pwd2" placeholder="Password Confirm" AUTOCOMPLETE=OFF required> 
				    </p>
				    <p>
				        <label for="name">name</label>
				        <input type="text" id="name" name='name' placeholder="name" AUTOCOMPLETE=OFF required> 
				    </p>
				    <p>
				        <label for="email">email</label>
				        <input type="email" id="email" name='email' placeholder="email" AUTOCOMPLETE=OFF required> 
				    </p>
				    <p>
				        <label for="sex">sex</label>
				        <input type="text" id="sex" name='sex' placeholder="sex" AUTOCOMPLETE=OFF required> 
				    </p>
				  
				    <p>
				        <label for="place">place</label>
				        <input type="text" id="place" name='place' placeholder="place" AUTOCOMPLETE=OFF required> 
				    </p>


				    <p>
				        <input type="submit" id="registerButton" name="submit" value="register">
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


</html> --%>