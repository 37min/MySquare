<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	
	<form method="post" action="reviewWrite.htm"  enctype="multipart/form-data" >
		<br>
		명소이름:<input name="locName" type="text" value="${locName}" readonly><br>
		작성자ID:<input name="id" type="text" value="${sessionScope.id}" readonly><br>
		후기분류코드:
		<select name="revGroupCode"  id="revGroupCode">
			<c:forEach var="revGroup" items="${revGroupList}">
				<option value="${revGroup.revGroupCode }">${revGroup.revGroupName }</option>
			</c:forEach>
		</select>
		<br>
		
		후기제목:<input name="revName" type="text"><br>
		후기 이미지 : <input name="file" type="file" value="첨부"><br>
		후기내용:<input name="revContents"  type="text"><br>
		
		<input type="submit" value="입력"  id="reviewWrite"><br>
	</form>