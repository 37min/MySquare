<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" title="My style" media="screen"
	href="styles.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('a[href^="http://"]').attr({
			target : "_blank"
		});

		function smartColumns() {
			$("ul.column").css({
				'width' : "100%"
			});

			var colWrap = $("ul.column").width();
			var colNum = Math.floor(colWrap / 200);
			var colFixed = Math.floor(colWrap / colNum);

			$("ul.column").css({
				'width' : colWrap
			});
			$("ul.column li").css({
				'width' : colFixed
			});
		}

		smartColumns();

		$(window).resize(function() {
			smartColumns();
		});
	});
</script>



<div class="container">
	<div id="top">
		<p>
			Welcome to <a href="#">John Doe's</a> website.<br />Since I am very
			<a href="#">sociable</a> person, I've made it easy for you to get in
			contact with me, via the fancy boxes below.
		</p>
	</div>
	<div id="middle">
		<ul class="column">

			
				<div class="block">

					<div class="floatleft">
						<div>
						 <span id="id_RE"> <a href="#">PeaceB</a>
						</span>
						 <span id="loc_RE"> <a href="#">KOSTA</a>
						</span>
						</div>
	
						<div id="context_RE">
						<span> 여기 수당을 제때 안줌 ㅠㅠ
						</span>
						</div>
					</div>
					
					<div>
						<a href="#"><img src="images/twitter.png" alt="" /></a> 
					</div>

					<div class="blockRE_ins">
						<h6>개인아이디</h6>
						<form action="">
							<!-- 
							 <input id="blockRE_ins_textbox" type="textarea" />
							 -->
							<textarea id="blockRE_ins_textarea" rows="50px" cols="10px"></textarea>
							<input id="blockRE_ins_btn" type="submit" value="입력" /> 
							
						
						</form>
						
					</div>
				</div>

		</ul>
	</div>
	<!--end middle -->
	<ul class="column">
		<li>
			<div class="blockRE">
			
				<div>id</div>
				<div>context</div>
			
			</div>
		</li>
		<li>
			<div class="blockRE">
			
				<div>id</div>
				<div>context</div>
			
			</div>
		</li>
			<li>
			<div class="blockRE">
			
				<div>id</div>
				<div>context</div>
			
			</div>
		</li>
			<li>
			<div class="blockRE">
			
				<div>id</div>
				<div>context</div>
			
			</div>
		</li>
	</ul>
	

</div>



<!-- This is the compressed version of the html file. If you buy the template, the html will look nice and easy to edit. Thanks! www.csstemplatesweb.com -->