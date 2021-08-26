<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>qnaWriteForm.jsp</title>
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/hjy/qna";
	});
	
	
</script>

<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>QnA 글쓰기</h2>
			<form name="form" id="form" role="form" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/hjy/newQna">
				<div class="mb-3">
				<label for="reg_id">카테고리</label><br>
					<select name="qcate" class="form-control">
					    <option value="상품">상품</option>
					    <option value="교환/환불">교환/환불</option>
					    <option value="사이트이용">사이트이용</option>
					    <option value="기타">기타</option>
					</select>
				</div>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="qtitle" id="qtitle" placeholder="제목을 입력해 주세요">
				</div>
				<!-- 
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요">
				</div>
				 -->
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="qcontent" id="qcontent" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="mb-3">
					<label for="file">첨부파일</label>
					<input type="file" class="form-control" name="qfile" id="fileupload" placeholder="태그를 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">비밀번호</label>
					<input type="password" class="form-control" name="qpw" id="reg_id" placeholder="비밀번호를 입력해 주세요">
				</div>
			</form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>


</body>
</html>