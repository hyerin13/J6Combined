<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
	<div class="board_header">
		<jsp:include page="board_header.jsp" flush="true"/>
	</div>
	<input type="hidden" name="bcate" id="bcate" value="${bcate }">	
	<input type="button" onclick="clickForm()" value="글쓰기" class="btn btn-default">
<table class="table" style="width: 800px; margin:20px;">
	<tr>
		<th>작성일</th>
		<th>글제목</th>
		<th>작성자</th>
	</tr>
<c:forEach var="vo" items="${list }">
		<tr>
			<fmt:formatDate value="${vo.brdate }" pattern="YY/MM/dd" var="brdate"/>
			<td>${brdate }</td>
			<td><a href="/project/hjy/detail?bid=${vo.bid }">${vo.btitle }</a></td>
			<td>${vo.mid }</td>
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
		<input type="text" name ="keyword" value="${keyword }" class="form-control" style="width:300px">
		<input type="submit" value="검색" class="btn btn-default">
	</form>
</div>
</body>
<script type="text/javascript">
function clickForm(){
	console.log("글쓰기");
	var bcate=$("#bcate").val();
	location.href='${pageContext.request.contextPath }/hjy/newPost?bcate='+bcate;
}
</script>
</html>