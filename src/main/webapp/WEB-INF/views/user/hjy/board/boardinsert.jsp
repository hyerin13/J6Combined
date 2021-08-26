<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
.underline {
　border-left:0;
　border-right:0;
　border-top:0;
}
</style>
</head>
<body>
<div class="board_header">
		<jsp:include page="board_header.jsp" flush="true"/>
</div>
<form method="post" action="${pageContext.request.contextPath }/phj/boardinsert">
카테고리<input type="text" id="bcate" name="bcate" value="${bcate }"><br>
아이디<input type="text" id="id" name="mid" value="${mid }"><br>
<table class=table style="margin:5px 5px 5px 5px;">
	<tr>
		<td class="underline">
			제목<input type="text" id="btitle" name="btitle"><br>
		</td>
	</tr>
	<tr>
		<th>
			내용 <textarea rows="8" cols="85" id="bcontent" name="bcontent" ></textarea><br>
		</th>
	</tr>
	<tr>
		<th>
			<input type="submit" value="작성" class="btn btn-default">	
		</th>
	</tr>
</table>
</form>
</body>
</html>