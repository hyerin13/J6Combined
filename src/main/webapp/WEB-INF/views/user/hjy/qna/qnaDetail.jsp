<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<!-- boardheader-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board_header.css">
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
a {
	color:black;
}
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/user/jhr/header.jsp" flush="true"/>
	</div>
	<div class="board_header">
		<ul class="ulcss">
	      <li class="licss"><a href="${pageContext.request.contextPath }/hjy/qna" class="active">전체</a></li>
	      <li class="licss"><a href="${pageContext.request.contextPath }/hjy/qna?qcate=상품">상품</a></li>
	      <li class="licss"><a href="${pageContext.request.contextPath }/hjy/qna?qcate=교환/환불">교환/환불</a></li>
	      <li class="licss"><a href="${pageContext.request.contextPath }/hjy/qna?qcate=사이트이용">사이트 이용</a></li>
	      <li class="licss"><a href="${pageContext.request.contextPath }/hjy/qna?qcate=기타">기타</a></li>
	    </ul>
	</div>
	<div class="container">
		<div class="card">
			<table class="table">
				<tr>
					<th>글번호</th>
					<td>${vo.qid }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><strong>${vo.qtitle }</strong></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${vo.mid }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${vo.qrdate }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${vo.qcontent }</td>
				</tr>
			</table>
		</div>
		<br>
		<div class="card">
			<div class="cmtHead"style="margin-top: 20px; margin-left: 40px;">
				<h4>
					답변
				</h4>
			</div>
			<hr>
			<c:if test="${ans eq null}">
				<div style="margin: 50px 50px 50px 50px; text-align: center;">
					댓글이 없습니다.
				</div>
			</c:if>
			<c:if test="${ans != null}">
				<div style="margin: 50px 50px 50px 50px;">
				${ans }
				</div>
			</c:if>
		</div>
		<br>
		<c:choose>
			<c:when test="${prevVo eq null }">
				이전글 없음
			</c:when>
			<c:otherwise>
				이전글 <a href="${pageContext.request.contextPath }/hjy/qna/qnaDetail?qid=${prevVo.qid }">${prevVo.qtitle }</a>
				<br>
			</c:otherwise>
		</c:choose>
		<br>
		<c:choose>
			<c:when test="${nextVo eq null }">
			다음글 없음
		</c:when>
			<c:otherwise>
			다음글 <a href="${pageContext.request.contextPath }/hjy/qna/qnaDetail?qid=${nextVo.qid }">${nextVo.qtitle }</a>
			</c:otherwise>
		</c:choose>
	</div>
		<br>
	<div class="footer">
		<jsp:include page="/WEB-INF/views/user/jhr/footer.jsp" flush="true"/>
	</div>
</body>
</html>