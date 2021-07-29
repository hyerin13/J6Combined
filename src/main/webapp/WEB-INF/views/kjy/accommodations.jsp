<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
호텔 페이지
<table width="600" border="1">
	<tr>
		<th>글번호</th>
		<th>호텔이름</th>
		<th>이동</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.AID }</td>
			<td>${vo.ANAME }</td>
			<td><a href="${pageContext.request.contextPath }/user/kjy/room_info?AID=${vo.AID}">이동</a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>