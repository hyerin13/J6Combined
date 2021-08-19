<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="board_header">
		<jsp:include page="board_header.jsp" flush="true"/>
</div>
<form method="post">
카테고리<input type="text" id="bcate" name="bcate" value="${bcate }"><br>
아이디<input type="text" id="id" name="mid" value="${id }"><br>
	제목<input type="text" id="btitle" name="btitle"><br>
	내용 <textarea rows="8" cols="85" id="bcontent" name="bcontent"></textarea><br>
	<input type="submit" value="작성">
</form>
</body>
</html>