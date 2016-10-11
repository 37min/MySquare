<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div id="favorite" style="height: 350px; OVERFLOW-y: scroll; overflow-x:hidden; ">
	
	<table style="width:100%">
		<tr>
			<th colspan="2" style="text-align:center;">즐겨찾기</th>
		</tr>
		<c:choose>
			<c:when test="${myFavoriteLocation.size() != 0 && myFavoriteLocation != null }">
				<c:forEach var="loc" items="${myFavoriteLocation }">
					<tr>
						<td style="width:40%;">
							<c:if test="${loc.locImage != null }">
								<img src="${pageContext.request.contextPath}/image/${loc.locImage}" style="width:100%; height:50px;" >
							</c:if>
							<c:if test="${loc.locImage == null }">
								<img src="${pageContext.request.contextPath}/image/noimage.jpg" style="width:100%; height:50px;" >
							</c:if>
						</td>
						<td>
							<a href="locDetail.htm?locName=${loc.locName }" style="text-decoration:none; color:black; font-weight:bold;">${loc.locName }</a>
						</td>
					</tr>
				</c:forEach>
		 	</c:when>
	
			<c:otherwise>
				
			</c:otherwise>
	 	</c:choose>
	</table>
		
</div>
