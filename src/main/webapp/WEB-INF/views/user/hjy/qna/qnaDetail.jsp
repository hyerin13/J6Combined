<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/user/jhr/header.jsp" flush="true"/>
	</div>
	<div class="board_header">
		<jsp:include page="/WEB-INF/views/user/hjy/board/board_header.jsp" flush="true"/>
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
					댓글<strong id="comment">(${cnt})</strong>
				</h4>
			</div>
			<hr>
		</div>
		<br>
			<div class="card mb-2">
				<div class="card-header bg-light">
				        <i class="fa fa-comment fa"></i> 
				</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
					    <li class="list-group-item">
						<div class="form-inline mb-2">
							${mid }
						</div>
						<textarea class="form-control" id="ccontentText"  placeholder="댓글을 남겨보세요." rows="3"></textarea>
						<br><button type="button" class="btn btn-outline-primary" id="btnAdd">등록</button> 
					    </li>
					</ul>
				</div>
			</div>
			
		<div>
		<br>
		<!-- 
		<c:choose>
			<c:when test="${prevVo eq null }">
				이전글 없음
			</c:when>
			<c:otherwise>
				이전글 <a href="${pageContext.request.contextPath }/hjy/detail?bid=${prevVo.bid }">${prevVo.btitle }</a>
				<br>
			</c:otherwise>
		</c:choose>
		<br>
		<c:choose>
			<c:when test="${nextVo eq null }">
			다음글 없음
		</c:when>
			<c:otherwise>
			다음글 <a
					href="${pageContext.request.contextPath }/hjy/detail?bid=${nextVo.bid }">${nextVo.btitle }</a>
			</c:otherwise>
		</c:choose>
		 -->
		</div>
		<br>
	</div>
	<div class="footer">
		<jsp:include page="/WEB-INF/views/user/jhr/footer.jsp" flush="true"/>
	</div>
</body>
</html>