<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findid.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
	#qnalist{
		width:1000px;
		border:none;
	}
	#qnapage{
		margin-left:500px;
		margin-top:20px;
	}
	#category{
		margin:20px 0;
	}
	th {
		text-align:center !important;
		padding:5px !important;
	}
	td {
		padding:5px !important;
	}
	.cate {
		text-align:center !important;
	}
</style>
<h3>나의 문의 내역</h3>
<div id="category">
	<select id="field">
		<option value="상품" <c:if test="${field=='cate1' }">selected</c:if>>상품</option>
		<option value="교환/환불" <c:if test="${field=='cate2' }">selected</c:if>>교환/환불</option>
		<option value="사이트이용" <c:if test="${field=='cate3' }">selected</c:if>>사이트이용</option>
		<option value="기타" <c:if test="${field=='cate4' }">selected</c:if>>기타</option>
		<option value="all" <c:if test="${field=='all' }">selected</c:if>>전체</option>
	</select>
</div>
<div id="qnalist">
</div>
<div id="qnapage">
</div>
<script type="text/javascript">
	var category;
	$("#field").on('change',function(){
		category=$(this).val();
		list();
	});
	
	function list(pageNum) {
		$("#qnalist").empty();
		$.ajax({
			type:'get',
			url:"${pageContext.request.contextPath }/user/jhr/list",
			data:{'pageNum':pageNum,'category':category},
			dataType:"json",
			success:function(data){
				var list=data.list;
				var html1="<table width='1000' border='1' id='test'>"+
				"<tr><th>문의글 아이디</th><th>카테고리</th><th>제목</th><th>내용</th>"+
				"<th>작성일</th><th>처리여부</th><th>삭제</th><th>수정</th></tr></table>";
				$("#qnalist").append(html1);
				$(list).each(function(i,d){
					if(d.qlev=='N'){
						var html2="<tr>"+
						"<td id='qid' class='cate'>"+d.qid+"</td>"+
						"<td id='qcate'>"+d.qcate+"</td>"+
						"<td id='qtitle'>"+d.qtitle+"</td>"+
						"<td id='qcontent'>"+d.qcontent+"</td>"+
						"<td id='qrdate' class='cate'>"+d.qrdate+"</td>"+
						"<td id='qlev' class='cate'>"+d.qlev+"</td>"+
						"<td class='cate'><a href='/project/jhr/myqnaDelete?mid="+d.mid+"&qid="+d.qid+"'>삭제</a></td>"+
						"<td class='cate'><a href='/project/jhr/myqnaUpdate?mid="+d.mid+"&qid="+d.qid+"'>수정</a></td>"+
						"</tr>";
					}else{
						var html2="<tr>"+
						"<td id='qid' class='cate'>"+d.qid+"</td>"+
						"<td id='qcate'>"+d.qcate+"</td>"+
						"<td id='qtitle'>"+d.qtitle+"</td>"+
						"<td id='qcontent'>"+d.qcontent+"</td>"+
						"<td id='qrdate' class='cate'>"+d.qrdate+"</td>"+
						"<td id='qlev' class='cate'>"+d.qlev+"</td>"+
						"<td class='cate'><a href='/project/jhr/myqnaDelete?mid="+d.mid+"&qid="+d.qid+"'>삭제</a></td>"+
						"<td class='cate'>수정불가</td>"+
						"</tr>";
					}
					$("#test").append(html2);
				});
				//페이징 처리
				let startPage=data.startPageNum;
				let endPage=data.endPageNum;
				let pageCount=data.totalPageCount;
				let pageHtml="";
				
				if(startPage>5){
					pageHtml += "<a href='javascript:list("+ (startPage-1) + ")'>이전</a>";
				}
				if(pageNum==null){
					pageHtml += "<a href='javascript:list("+ 1 + ")'><span style='color:blue'>"+ 1 + "</span></a> ";
					startPage++;
				}
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:blue'>"+ i + "</span></a> ";
					}else if(pageNum==null){
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
					}else{
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
					}	
				}
				if(endPage<pageCount){
					pageHtml += "<a href='javascript:list("+ (endPage+1) + ")'>다음</a>";
				}
				$("#qnapage").html(pageHtml);
			}
		});
	}
	list();
</script>