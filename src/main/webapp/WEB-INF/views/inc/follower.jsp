<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<img src = "image/header/menu0.png">
<div id="follower"  style="height: 350px; OVERFLOW-y: scroll; overflow-x:hidden; ">
	
	<table style="width:100%">
		<tr>
			<th colspan="2" style="text-align:center;">친구들</th>
		</tr>
	 	<c:choose>
		 	<c:when test="${followingList.size() != 0 && followingList != null }">
		 		<c:forEach var="following" items="${followingList }">
					<tr>
						<td colspan="2" style="text-align:center;">
							<a href="memberDetail.htm?id=${following.followingId }" style="text-decoration:none; color:black; font-weight:bold;">
								${following.followingId }
							</a>
						</td>
					</tr>	
				</c:forEach>
		 	</c:when>
		
			<c:otherwise>
				<!-- 값 없을 때 처리 -->
			</c:otherwise>
	 	</c:choose>
	 </table>
</div>