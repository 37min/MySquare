<%@page import="kr.co.mysquare.dto.Comm"%>
<%@page import="kr.co.mysquare.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="import/LoginForm/js/jquery.validate.js"></script>
<script type="text/javascript">
(function($){

    $(document).ready(function() {

    $('#form-4').validate({
            rules: {
            	blockRE_ins_textarea: { required: true, maxlength: 50 }
               
            },
            messages: {
            	blockRE_ins_textarea: {required:"필수입력 사항 입니다.",
                    maxlength: jQuery.format("아이디는 {0}자 이하")
                },
                
            submitHandler: function (frm) {
                frm.submit();
            },
            success: function (e) { 
            //
            }
        }
    });
})(jQuery);

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
});
</script>
<!-- -------------제이쿼리 무버블 ------------------------>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<style>
/* .draggable { width: 90px; height: 90px; padding: 0.5em; float: left; margin: 0 10px 10px 0; }
  #draggable, #draggable2 { margin-bottom:20px; }
  #draggable { cursor: n-resize; }
  #draggable2 { cursor: e-resize; }
  #containment-wrapper { width: 95%; height:150px; border:2px solid #ccc; padding: 10px; }
 */
.draggable3 {
	/*top:100px;
 position:absolute;*/
	float: left;
	width: 430px;
	font-size: 11px;
	padding: 15px;
	/*background: #e3e1d5;*/
	background-color: #EFEDFF;
	-moz-border-radius: 10px;
	-khtml-border-radius: 10px;
	-webkit-border-radius: 10px;
	box-shadow: 1px 1px 1px #ccc;
	margin-bottom: 5px;
} /*떠있는댓글*/
#commBoxDate{
	float : right;
}
</style>
<script>
	$(function() {
		//  $( "#draggable" ).draggable({ axis: "y" });
		//  $( "#draggable2" ).draggable({ axis: "x" });

		$(".draggable3").draggable({
			containment : ".container",
			scroll : false
		});
		//  $( "#draggable5" ).draggable({ containment: "parent" });
	});
</script>
<!-- ---------------------------------------------------------- -->


<img src = "image/header/menu3.png">

<div class="container">

	<div id="top">
		<p></p>
	</div>

	<div class="block">
		<div class="divSize70">
			<!-- test님의 test 후기 -->
			<div id="loc_RE">
				<span id="revname">[${revGroupName }] ${review.revName}</span> <br>
				<div id="revSubTitle">
					<span id="revlocation">${review.id}님의 "후기장소" 후기</span> <span
						id="revdate">${review.revDate}</span>
				</div>

				<br>
				<hr>


				<div id="context_RE">
					<c:if test="${isLikedReview == 0 }">
						<div class="button-wrapper" id="like">
							<div id="infoLeft">
								<a href="likeReview.htm?revCode=${review.revCode}" class="a-btn">
									<span class="a-btn-text">
									<img src="${pageContext.request.contextPath}/image/like.png">
								</span>
								</a>
							</div>
						</div>
						
						<div id="likeTextLeft">
							좋아요 ${likeNum}명
							</div>
					</c:if>
					
					<c:if test="${isLikedReview == 1 }">
						<div class="button-wrapper" id="like">
							<div id="infoLeft">
								<a href="canclelikeReview.htm?revCode=${review.revCode}" class="a-btn"> 
									<span class="a-btn-text"> 
										<img src="${pageContext.request.contextPath}/image/hate.png">
									</span>
								</a>
							</div>
						</div>
						
						<div id="likeTextLeft">
							좋아요 ${likeNum}명
						</div>
						
					</c:if>
					
					<div id="likeTextRight">
						<c:if test="${sessionScope.id == admin || sessionScope.id == review.id }">
							<a href="reviewEdit.htm?revCode=${review.revCode }">수정</a>
							<a href="reviewDelete.htm?locName=${review.locName}&revCode=${review.revCode}&id=${review.id}">삭제</a>
						</c:if>
					</div> 
				</div>
				
				<br>
				<div>
				${review.revContents}
				</div>
				<br>
				
				<!--  후기에 달린 댓글 -->
				<c:forEach var="comm" items="${requestScope.commList}">
					<div class="draggable3" class="draggable ui-widget-content">
						<!-- 코멘트 -->
						<div id="commBox">
							[${comm.commId}]
							<c:if
								test="${sessionScope.id == comm.commId || sessionScope.id == 'admin'}">
								<a
									href="commDelete.htm?commCode=${comm.commCode}&revCode=${review.revCode}">삭제하기</a>
							</c:if>
							<div id="commBoxDate">${comm.commDate }</div>
							<hr> ${comm.commContents}
						</div>
					</div>
					<br>
				</c:forEach>
				<br>				
				<c:if test="${sessionScope.id != null }">
					<div class="blockRE_ins">
						<!-- 후기에 대한 댓글을 적어보자 -->
						<h6>코멘트 쓰기</h6>
						<form action="commWrite.htm" method="post">
							<input type="hidden" name="revCode" value="${review.revCode}">
							<input type="hidden" name="commId" value="${sessionScope.id}">
							<textarea id="blockRE_ins_textarea" rows="2px" cols="50px"name="commContents"></textarea>
							<!-- <input id="blockRE_ins_btn" type="submit" value="입력" /> -->
							<button class="blockRE_ins_btn" type="submit">코멘트 입력</button>
						</form>
					</div>
					<!-- 후기에 대한 댓글을 적어보자 -->
				</c:if>

			</div>






		</div>
		<div id="id_RE">
			<c:if test="${review.revImage != null }">
				<img src="${pageContext.request.contextPath}/image/${review.revImage}">
			</c:if>
			<c:if test="${review.revImage == null }">
				<img src="${pageContext.request.contextPath}/image/noimage.jpg">
			</c:if>
		</div>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>