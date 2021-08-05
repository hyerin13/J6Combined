<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J6 게시판</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myTab a").click(function(e) {
			e.preventDefault();
			$("#myTab a").attr('class', 'nav-link');
			$(this).attr('class',"nav-link active");
			$("#tabContent div").attr('class', 'tab-pane fade');
			$($(this).attr('href')).attr('class','tab-pane fade show active');
		});
		$("#loginPlz").click(function() {
			alert('로그인 해주세요!')
			<%--로그인페이지 완성되면 거기로 넘겨주기--%>
		})
	});
</script>
<body>
<h1>게시판</h1>
<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="myTab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#full" role="tab" aria-controls="v-pills-home" aria-selected="true">전체보기</a>
      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#all" role="tab" aria-controls="v-pills-profile" aria-selected="false">자유게시판</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#review" role="tab" aria-controls="v-pills-messages" aria-selected="false">여행후기게시판</a>
      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#matching" role="tab" aria-controls="v-pills-settings" aria-selected="false">매칭게시판</a>
    </div>
  </div>
  <div class="col-9">
    <div class="tab-content" id="tabContent">
      <div class="tab-pane fade show active" id="full" role="tabpanel" aria-labelledby="v-pills-home-tab">전체보기</div>
      <div class="tab-pane fade" id="all" role="tabpanel" aria-labelledby="v-pills-profile-tab">사이트를 이용하는 사람들과 자유롭게 소통 할 수 있는 공간입니다.</div>
      <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="v-pills-messages-tab">여행후기를 남길 수 있는 게시판입니다.</div>
      <div class="tab-pane fade" id="matching" role="tabpanel" aria-labelledby="v-pills-settings-tab">여행자들과 동행할 수 있도록 매칭이 가능한 게시판입니다.</div>
    </div>
  </div>
</div>
<div>
<input type="button" value="새글 작성하기">
</div>
<div>
	<c:choose>
		<c:when test="${list.size()==0 }">
			글이 존재하지 않습니다.
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>아이디</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bid }</td>
						<c:choose>
							<c:when test="${id eq null }">
								<td><a href="#" id="loginPlz">${vo.btitle }</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="${pageContext.request.contextPath }/hjy/boardDetail?bid=${vo.bid }">${vo.btitle }</a></td>
							</c:otherwise>
						</c:choose>
						<td>${vo.mid }</td>
						<td>${vo.brdate }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<div>
	<c:if test="${pu.pageNum>pu.pageBlockCount }">
		<a href ='${pageContext.request.contextPath }/list?pageNum=${pu.startPageNum-1}&field=${field}&keyword=${keyword}'>[이전]</a>
	</c:if>
	<c:forEach var = "i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${pu.pageNum==i }">
				<a href="${pageContext.request.contextPath }/list?pageNum=${i }&field=${field}&keyword=${keyword}">
					<span style='color:blue;font-weight: bold'>[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/list?pageNum=${i }&field=${field}&keyword=${keyword}">
					<span style='color:gray'>[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.totalPageCount > pu.endPageNum }">
		<a href ='${pageContext.request.contextPath }/list?pageNum=${pu.endPageNum+1}&field=${field}&keyword=${keyword}'>[다음]</a>
	</c:if>
</div>
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
</div>
</body>
</html>