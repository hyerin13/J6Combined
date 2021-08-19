<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findid.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
	#qnalist{
		position:absolute;
		top:50px;
		left:0px;
		width:1000px;
		height:250px;
		border: 1px solid gray;
	}
	#page{
		position:absolute;
		top:500px;
		left:500px;
		width:100px;
		height:50px;
	}
	#category{
		position:absolute;
		top:500px;
		left:0px;
		width:100px;
		height:50px;
	}
</style>
<h3>나의 문의 내역</h3>
<div id="qnalist">
</div>
<div id="page">
</div>
<div id="category">
<select id="field">
		<option value="상품" <c:if test="${field=='cate1' }">selected</c:if>>상품</option>
		<option value="교환/환불" <c:if test="${field=='cate2' }">selected</c:if>>교환/환불</option>
		<option value="사이트이용" <c:if test="${field=='cate3' }">selected</c:if>>사이트이용</option>
		<option value="기타" <c:if test="${field=='cate4' }">selected</c:if>>기타</option>
</select>
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
						"<td id='qid'>"+d.qid+"</td>"+
						"<td id='qcate'>"+d.qcate+"</td>"+
						"<td id='qtitle'>"+d.qtitle+"</td>"+
						"<td id='qcontent'>"+d.qcontent+"</td>"+
						"<td id='qrdate'>"+d.qrdate+"</td>"+
						"<td id='qlev'>"+d.qlev+"</td>"+
						"<td><a href='/project/jhr/myqnaDelete?mid="+d.mid+"&qid="+d.qid+"'>삭제</a></td>"+
						"<td><a href='/project/jhr/myqnaUpdate?mid="+d.mid+"&qid="+d.qid+"'>수정</a></td>"+
						"</tr>";
					}else{
						var html2="<tr>"+
						"<td id='qid'>"+d.qid+"</td>"+
						"<td id='qcate'>"+d.qcate+"</td>"+
						"<td id='qtitle'>"+d.qtitle+"</td>"+
						"<td id='qcontent'>"+d.qcontent+"</td>"+
						"<td id='qrdate'>"+d.qrdate+"</td>"+
						"<td id='qlev'>"+d.qlev+"</td>"+
						"<td><a href='/project/jhr/myqnaDelete?mid="+d.mid+"&qid="+d.qid+"'>삭제</a></td>"+
						"<td>수정불가</td>"+
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
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:blue'>"+ i + "</span></a> ";
					}else{
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
					}	
				}
				if(endPage<pageCount){
					pageHtml += "<a href='javascript:list("+ (endPage+1) + ")'>다음</a>";
				}
				$("#page").html(pageHtml);
			}
		});
	}
	list();
</script>