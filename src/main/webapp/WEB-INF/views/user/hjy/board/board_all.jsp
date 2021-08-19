<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<div class="board_header">
		<jsp:include page="board_header.jsp" flush="true"/>
	</div>
<input type="text" name="bcate" id="bcate" value="${bcate }">	
	<input type="button" onclick="clickForm()">

<table width="600" border="1">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>글제목</th>
		<th>작성일</th>
	</tr>
<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.bid }</td>
			<td>${vo.mid }</td>
			<td><a href="/project/hjy/detail?bid=${vo.bid }">${vo.btitle }</a></td>
			<fmt:formatDate value="${vo.brdate }" pattern="YY/MM/dd" var="brdate"/>
			<td>${brdate }</td>
		</tr>
	</c:forEach>
</table>
<div>
	<form method="post" action="${pageContext.request.contextPath }/list">
		<select name = "field">
			<option value="btitle" <c:if test="${field=='btitle' }">selected</c:if>>제목</option>
			<option value="mid" <c:if test="${field=='mid' }">selected</c:if>>글쓴이</option>
			<option value="bcontent" <c:if test="${field=='bcontent' }">selected</c:if>>내용</option>
		</select>
		<input type="text" name ="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
</body>
<script type="text/javascript">
function clickForm(){
	var bcate=$("#bcate").val();
	location.href='${pageContext.request.contextPath }/hjy/newPost';
}
</script>
</html>