<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<img src = "image/header/menu0.png">
<div align="center">
	<br><br><br></br>
	<h1>회 원 검 색</h1>
	<br><br><br>	
	<form action="idSearchList" method="post">
		<h3>${member.size()}명의 회원이 검색 되었습니다.</h3>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>성별</th>
				<th>사는 지역</th>
				<th>가입일</th>
			</tr>

			<c:forEach var="member" items="${member}">
				<tr style="text-align:center;">
					<td><a href="memberDetail.htm?id=${member.id}">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.email}</td>
					<td>${member.sex}</td>
					<td>${member.place}</td>
					<td>${member.gDate}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</div>