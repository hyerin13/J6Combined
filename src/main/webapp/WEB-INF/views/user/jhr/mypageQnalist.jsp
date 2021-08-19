<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findid.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<h3>나의 문의 내역</h3>
<!--  
<form method="post" action="${pageContext.request.contextPath }/user/kjy/mypage">
	<select name="field">
		<option value="cate1" <c:if test="${field=='cate1' }">selected</c:if>>상품</option>
		<option value="cate2" <c:if test="${field=='cate2' }">selected</c:if>>교환/환불</option>
		<option value="cate3" <c:if test="${field=='cate3' }">selected</c:if>>사이트이용</option>
		<option value="cate4" <c:if test="${field=='cate4' }">selected</c:if>>기타</option>
	</select>
</form>
<form method="post" action="${pageContext.request.contextPath }/jhr/mypageQnalist" class="update_form" id="update_form" enctype="multipart/form-data">
	<input type="hidden" name="mid" value="${mid }"><br>
	<table width="1000" border="1">
		<tr>
			<th>문의글 아이디</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
			<th>처리여부</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td id="qid">${vo.qid }</td>
				<td id="qcate">${vo.qcate }</td>
				<td id="qtitle">${vo.qtitle }</td>
				<td id="qcontent">${vo.qcontent }</td>
				<fmt:formatDate value="${vo.qrdate }" pattern="yyyy/MM/dd" var="regdate"/>
				<td id="qrdate">${regdate }</td>
				<c:set var="qlev" value="${vo.qlev }"/>
				<td id="qlev">${vo.qlev }</td>
				<td><a href="/project/jhr/myqnaDelete?mid=${vo.mid }&qid=${vo.qid}">삭제</a></td>
				<td>
					<c:choose>
						<c:when test="${qlev == 'N'}">
							<a href="/project/jhr/myqnaUpdate?mid=${vo.mid }&qid=${vo.qid}">수정</a>
						</c:when>
						<c:otherwise>
							수정불가
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum==i }">
					<a href="${pageContext.request.contextPath }/kjy/mypage?pageNum=${i }">
						<span style='color:blue; font-weight:bold;'>[${i }]</span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/kjy/mypage?pageNum=${i }">
						<span style='color:gray;'>[${i }]</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</form>

<div>
	<form method="post" action="${pageContext.request.contextPath }/user/kjy/mypage">
		<select name="field">
			<option value="title" <c:if test="${field=='title' }">selected</c:if>>제목</option>
			<option value="content" <c:if test="${field=='content' }">selected</c:if>>내용</option>
			<option value="??" <c:if test="${field=='??' }">selected</c:if>>제목+내용</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>-->

<script type="text/javascript">
	function list() {
		$.ajax({
			type:'get',
			url:"${pageContext.request.contextPath }/user/jhr/list",
			dataType:"json",
			success:function(d){
				var title="<h3>나의 문의 내역</h3>";
				$(d.list).each(function(i,d){
					/*let html="<table width='1000' border='1'>"+
							"<tr><th>문의글 아이디</th><th>카테고리</th><th>제목</th><th>내용</th>"+
								"<th>작성일</th><th>처리여부</th><th>삭제</th><th>수정</th></tr>"+
							"<tr>"
							+
								"<td id='qid'>"+d.qid+"</td>"+
								"<td id='qcate'>"+d.qcate+"</td>"+
								"<td id='qtitle'>"+d.qtitle+"</td>"+
								"<td id='qcontent'>"+d.qcontent+"</td>"+
								"<fmt:formatDate value='"+d.qid+"' pattern='yyyy/MM/dd' var='regdate'/>"+
								"<td id='qrdate'>"+d.regdate+"</td>"+
								"<c:set var='qlev' value='"+d.qlev+"'/>"+
								"<td id='qlev'>"+d.qlev+"</td>"+
								"<td><a href='/project/jhr/myqnaDelete?mid="+d.mid+"&qid="+d.qid+"'>삭제</a></td>"+
								"<td>"+
									"<c:choose>"+
										"<c:when test='"+d.qlev='N'+"'>"+
											"<a href='/project/jhr/myqnaUpdate?mid="+d.mid+"&qid="+d.qid+"'>수정</a>"+
										"</c:when>"+
										"<c:otherwise>"+
											"수정불가"+
										"</c:otherwise>"+
									"</c:choose>"+
								"</td>"+
							"</tr>"+
						"</table>"+
					";*/
				}
			}
		});
	}
	list();
</script>