<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>멤버 리스트 페이지입니다</h1>
	<form action="memberDelete">
	<table>
		<tr>
			<th>유저 번호</th>
			<th>유저 이름</th>
			<th>유저 아이디</th>
			<th>유저 비밀 번호</th>
			<th>유저 타입</th>
			<th>가맹점 번호</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="bean" items="${alist}">
			<tr>
				<td>${bean.unum}</td>
				<td>${bean.uname }</td>
				<td><a href="meberInfo">${bean.fid }</a></td>
				<td>${bean.upw }</td>
				<td>${bean.utype }</td>
				<td>${bean.fnum }</td>
				<td><input type="checkbox" id="unum" name="unum" value="${bean.unum}"></td>
			</tr>
		</c:forEach>
		<button type="submit">수정</button>
		<button type="submit">삭제</button>
	</table>
	</form>
	<button><a href="memberAddform">추가 하기</a></button>
</body>

</html>
