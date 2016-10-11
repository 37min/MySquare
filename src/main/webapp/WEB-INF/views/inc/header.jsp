<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- dddd 
      <link rel="stylesheet" type="text/css" href="import/Dropdown/css/style.css" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="import/Dropdown/js/modernizr.custom.79639.js"></script> 
		<noscript><link rel="stylesheet" type="text/css" href="import/Dropdown/css/noJS.css" /></noscript>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">

			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-5').removeClass('active');
				});

			});

		</script>
-->

<div id="header_L"> <!-- ok 
		
			header.jsp
			
			
			///
			
-->
			

      	<meta name="description" content="Fixed Fade Out Menu: A CSS and jQuery Tutorial" />
        
        <link rel="stylesheet" href="FixedFadeOutMenu/css/style.css" type="text/css" charset="utf-8"/>


        <!--  로그인 로그 아웃 버튼 생성 -->     
        <div id="nav">

            <ul id="navLeft"><!-- 
                <li><a class="top" href="#top"><span></span></a></li>
                <li><a class="bottom" href="#bottom"><span></span></a></li>
                <li><a>Link 1</a></li>
             -->
             <li><a href="http://localhost:8080/MySquare/main.htm">홈</a></li>
				
             
				  <li class="search">
                	<form action="locSearch.htm" method="post">
						<input type="text" name="locationSearch"/>
						<input class="searchbutton" type="submit" value=""/>
					</form>
				</li>
				<li class="search">
                	<form action="locSearch.htm" method="post">
						<input type="text" name="locationSearch"/>
						<input class="searchbutton" type="submit" value=""/>
					</form>
				</li>

</ul>

				


<ul id="navRight">
				
						 <c:choose>
				       <c:when test="${sessionScope.id != null}">
				       
							
						<li>
							<a href = memberLoginOut.htm>로그아웃</a>
				       </li>
				       
				       
				       <a href="memberEdit.htm">
				           ${sessionScope.id}님 환영합니다. &nbsp; &nbsp;
				       </a>
				        
				       
				       <!-- 
					<div id="dd" class="wrapper-dropdown-5" tabindex="1">John Doe
						<ul class="dropdown">
							<li><a href="#"><i class="icon-user"></i>Profile</a></li>
							<li><a href="#"><i class="icon-cog"></i>Settings</a></li>
							<li><a href="#"><i class="icon-remove"></i>Log out</a></li>
						</ul>
					</div>
						-->
						
				       </c:when>
				       <c:otherwise>
				       <li>
				           <a href = memberLogin.htm>로그인</a>
				       </li>
				       </c:otherwise>
				         </c:choose>
				
			


            </ul>
        </div>        
		<div id="top"></div>


        <script type="text/javascript" src="FixedFadeOutMenu/jquery-1.3.2.js"></script>
        <script type="text/javascript">
            $(function() {
                $(window).scroll(function(){
					var scrollTop = $(window).scrollTop();
					if(scrollTop != 0)
						$('#nav').stop().animate({'opacity':'0.2'},400);
					else	
						$('#nav').stop().animate({'opacity':'1'},400);
				});
				
				$('#nav').hover(
					function (e) {
						var scrollTop = $(window).scrollTop();
						if(scrollTop != 0){
							$('#nav').stop().animate({'opacity':'1'},400);
						}
					},
					function (e) {
						var scrollTop = $(window).scrollTop();
						if(scrollTop != 0){
							$('#nav').stop().animate({'opacity':'0.2'},400);
						}
					}
				);
            });
            
        </script>

			
			
		<!-- 
		 	///
		 -->
			
			
</div>