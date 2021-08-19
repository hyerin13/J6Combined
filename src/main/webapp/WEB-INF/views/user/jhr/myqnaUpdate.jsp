<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_나의 문의 내역 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findid.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/jhr/myqnaUpdate">
	<input type="hidden" name="qid" value="${vo.qid }"><br>
	<h3>나의 문의 내역 수정하기</h3>
	카테고리<br>
	<input type="text" name="qcate" value="${vo.qcate }" readonly="readonly"><br>
	제목<br>
	<input type="text" name="qtitle" value="${vo.qtitle }"><br>
	작성자<br>
	<input type="text" name="mid" value="${vo.mid }" readonly="readonly"><br>
	제목<br>
	<input type="text" name="qtitle" value="${vo.qtitle }"><br>
	내용<br>
	<textarea rows="5" cols="50" name="qcontent">${vo.qcontent }</textarea>
	<input type="submit" value="수정">
</form>

<script type="text/javascript">
	let msg='${errMsg}';
	if(msg!='') {
		alert(msg);
	}
</script>
</body>
</html>
