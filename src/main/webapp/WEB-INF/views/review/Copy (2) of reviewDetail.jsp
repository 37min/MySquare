<%@page import="kr.co.mysquare.dto.Comm"%>
<%@page import="kr.co.mysquare.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<p></p>
	</div>
	<div id="middle">

			<div class="block">
				<!-- 지역에 대한 후기 -->

				<div class="floatleft">
					<!-- 왼쪽텍스트부분모아놓은div -->
					<div>
						<span id="id_RE"> <a href="#">${review.id}</a>
						</span>
						 <span id="loc_RE"> <a href="#">님의 ${review.locName} 후기</a>
						</span>
					</div>
				<h2>
					${review.revName}<br> 
				</h2>
					<div id="context_RE">
						<span> ${review.revContents}</span>
					</div>
						<br> 
						locName : ${review.locName} <br>
						revName(제목) : ${review.revName}<br> 
						revDate : ${review.revDate}<br>
				</div>
				<!-- 왼쪽텍스트부분모아놓은/div -->

				<div>
					<!-- 이미지 -->
					<img src="${pageContext.request.contextPath}/image/${review.revImage}"><br>
				</div>
				<!-- 이미지 -->


				<div class="blockRE_ins">
					<!-- 후기에 대한 댓글을 적어보자 -->
					<h6>코멘트 쓰기</h6>
					<form action="commWrite.htm" method="post">
						<input type="hidden"  name="revCode" value="${review.revCode}">
						<input type="hidden"  name="commId" value="${sessionScope.id}">
						<textarea id="blockRE_ins_textarea" rows="2px" cols="30px" name="commContents"></textarea>
						<input id="blockRE_ins_btn" type="submit" value="입력" />
					</form>

				</div>
				<!-- 후기에 대한 댓글을 적어보자 -->
			</div>
			<!-- 지역에 대한 후기 -->

	</div>
	<!--end middle -->


	<!-- 후기에 달린 댓글. -->
	<ul class="column">
		<c:forEach var="comm" items="${requestScope.commList}" >
			<li>
				<div class="blockRE">
					<div class="floatleft">ID:${comm.commId}</div>
					<!--관리자및본인용 삭제버튼 -->
					<c:if test="${sessionScope.id == comm.commId || sessionScope.id == 'admin'}">
						<div class="floatright">
							<a href="commDelete.htm?commCode=${comm.commCode}&revCode=${review.revCode}">삭제</a>
						</div>
					</c:if>
					
					<div>시간:${comm.commDate}</div>
					<div>코멘트:${comm.commContents}</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>