<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J6 게시판</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.cmtHead ul li {
	list-style-type: none;
	float: left;
	margin-left: 5px;
}

body {
	background: #fafafa;
}

.widget-area.blank {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	-ms-box-shadow: none;
	-o-box-shadow: none;
	box-shadow: none;
}

body .no-padding {
	padding: 0;
}

.widget-area {
	background-color: #fff;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	-moz-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	-ms-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	-o-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	float: left;
	margin-top: 30px;
	padding: 25px 30px;
	position: relative;
	width: 100%;
}

.status-upload {
	background: none repeat scroll 0 0 #f5f5f5;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	float: left;
	width: 100%;
}

.status-upload form {
	float: left;
	width: 100%;
}

.status-upload form textarea {
	background: none repeat scroll 0 0 #fff;
	border: medium none;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	-ms-border-radius: 4px 4px 0 0;
	-o-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
	color: #777777;
	float: left;
	font-family: Lato;
	font-size: 14px;
	height: 142px;
	letter-spacing: 0.3px;
	padding: 20px;
	width: 100%;
	resize: vertical;
	outline: none;
	border: 1px solid #F2F2F2;
}

.status-upload ul {
	float: left;
	list-style: none outside none;
	margin: 0;
	padding: 0 0 0 15px;
	width: auto;
}

.status-upload ul>li {
	float: left;
}

.status-upload ul>li>a {
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	color: #777777;
	float: left;
	font-size: 14px;
	height: 30px;
	line-height: 30px;
	margin: 10px 0 10px 10px;
	text-align: center;
	-webkit-transition: all 0.4s ease 0s;
	-moz-transition: all 0.4s ease 0s;
	-ms-transition: all 0.4s ease 0s;
	-o-transition: all 0.4s ease 0s;
	transition: all 0.4s ease 0s;
	width: 30px;
	cursor: pointer;
}

.status-upload ul>li>a:hover {
	background: none repeat scroll 0 0 #606060;
	color: #fff;
}

.status-upload form button {
	border: medium none;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	color: #fff;
	float: right;
	font-family: Lato;
	font-size: 14px;
	letter-spacing: 0.3px;
	margin-right: 9px;
	margin-top: 9px;
	padding: 6px 15px;
}

.dropdown>a>span.green:before {
	border-left-color: #2dcb73;
}

.status-upload form button>i {
	margin-right: 7px;
}
</style>
</head>
<body>
	<div class="board_header">
		<jsp:include page="board_header.jsp" flush="true"/>
	</div>
	<table class="table">
		<tr>
			<th>글번호</th>
			<td>${vo.bid }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.btitle }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${vo.mid }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.brdate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.bcontent }</td>
		</tr>
	</table>
	<br>

	<div class="cmtWrap" style="width: 500px">
		<div class="cmtHead">
			<h4>
				댓글<strong id="comment">(댓글개수)</strong>
			</h4>
			<ul>
				<li><a href="registration" name="boardOpinionList" onclick="">등록순</a></li>
				<li><span>|</span></li>
				<li><a href="latest" onclick="">최신순</a></li>
				<li><div id="refresh" onclick="">새로고침</div></li>
			</ul>
		</div>
		<br>
		<hr>
		<div id="cmt"></div>
		<!-- 
		<div class="writeForm">
			<textarea id="cmtComment" rows="3" cols="50"></textarea>
			<button id="submitBtn" tabindex="100" value="등록">등록</button>
		</div>
		 -->
		<div class="col-md-6">
			<div class="widget-area no-padding blank">
				<div class="status-upload">
					<textarea placeholder="댓글을 입력하세요." id="ccontentText"></textarea>
					<input type="button" class="btn btn-success green" value="등록"
						id="btnAdd">
				</div>
				<!-- Status Upload  -->
			</div>
			<!-- Widget Area -->
		</div>
	</div>
	<c:choose>
		<c:when test="${prevVo eq null }">
			이전글 없음
		</c:when>
		<c:otherwise>
			이전글 <a href="${pageContext.request.contextPath }/hjy/boardDetail?bid=${prevVo.bid }">${prevVo.btitle }</a>
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
				href="${pageContext.request.contextPath }/hjy/boardDetail?bid=${nextVo.bid }">${nextVo.btitle }</a>
		</c:otherwise>
	</c:choose>
</body>
		<script type="text/javascript">
			$(document).ready(function() {
				list();
				$("#btnAdd").click(function(){
					$.ajax({
						url:"${pageContext.request.contextPath }/hjy/commentInsert",
						data:{"ccontent":$("#ccontentText").val(),"bid":${vo.bid}},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.code=='success'){
								list();
							}else{
								alert(data.code)
							}
						}
					});
					$("#ccontentText").val("")
				});
			});
			function list(){
				$.ajax({
					url:"${pageContext.request.contextPath }/hjy/commentList",
					data:{"bid":${vo.bid}},
					type:"get",
					dataType:"json",
					success:function(data){
						$("#cmt").empty();
						let html ="<ul>";
						for (var i = 0; i < data.list.length; i++) {
							html +="<li class='row' id='cmt"+i+"'>";
							if(data.list[i].clev>0){
								for (var j = 0; j < data.list[i].clev; j++) {
									html += "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp";
								}
								html +="<img src='https://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif' style='object-fit: none;'>";
							}
							html +="<div>";
							html +="<strong> <img src=''> <span>"+data.list[i].mid+"</span> ";
							let crdate = dateFormat(data.list[i].crdate);
							html +="<span style='color: gray;'>("+crdate+")</span> </strong>";
							html +="<div>";
							html +="<span>"+data.list[i].ccontent+"</span>";
							html +="</div>";
							html +="<div>";
							html +="<a href='javascript:commentPlus("+data.list[i].cid+","+i+")'>답글</a>";
							if(data.list[i].mid=='${id}'){
								html +="<span>|</span><a href='javascript:updateForm("+data.list[i].cid+","+i+")'>수정</a>";
								html +="<span>|</span><a href='javascript:deleteForm("+data.list[i].cid+")'>삭제</a>";
							}
							html +="</div>";
							html +="<div id='cmtcmt"+i+"'>";
							html +="</div>";
							html +="</div>";
							html +="</li>";
						}
						html +="</ul>";
						$("#cmt").append(html)
					}
				})
			}
			function deleteForm(cid){
				$.ajax({
					url:"${pageContext.request.contextPath }/hjy/deleteForm",
					data:{"cid":cid},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.code=='success'){
							list();
						}else{
							alert(data.code)
						}
					}
				});
			}
			function updateForm(cid, num){
					$.ajax({
						url:"${pageContext.request.contextPath }/hjy/findComment",
						data:{"cid":cid},
						type:"post",
						dataType:"json",
						success:function(data){
							let updateHtml = "";
							if(data.clev>0){
								for (var j = 0; j < data.vo.clev; j++) {
									updateHtml += "&nbsp;&nbsp";
								}
								updateHtml +="[re]";
							}
							updateHtml +="<div>";
							updateHtml +="<strong> <img src=''> <span>"+data.vo.mid+"</span> ";
							let crdate = dateFormat(data.vo.crdate);
							updateHtml +="<span style='color: gray;'>("+crdate+")</span> </strong>";
							updateHtml +="<div>";
							updateHtml +="<input type='text' value='"+data.vo.ccontent+"' id='ccontent"+num+"'>";
							updateHtml +="</div>";
							updateHtml +="<div>";
							updateHtml +="<a href='javascript:list()'>취소</a>";
							updateHtml +="<span>|</span><a href='javascript:updatedb("+cid+","+num+")'>확인</a>";
							updateHtml +="</div>";
							updateHtml +="</div>";
							$("#cmt"+num).html(updateHtml);
						}
					});
			}
			function updatedb(cid,num){
				$.ajax({
					url:"${pageContext.request.contextPath }/hjy/updateComment",
					data:{"cid":cid,"ccontent":$("#ccontent"+num).val()},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.code=='success'){
							list();
						}else{
							alert(data.code)
						}
					}
				});
			}
			
			function commentPlusDb(cid,num){
				$.ajax({
					url:"${pageContext.request.contextPath }/hjy/updateCommentPlus",
					data:{"cid":cid,"ccontent":$("#cmtcmttext"+num).val()},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.code=='success'){
							list();
						}else{
							alert(data.code)
						}
					}
				});
			}

			function commentPlus(cid,num){	
				var cmtHtml = "";
				cmtHtml +="<div>";
				cmtHtml +="<input type='text' id='cmtcmttext"+num+"'>";
				cmtHtml +="<a href='javascript:list()'>취소</a>";
				cmtHtml +="<span>|</span><a href='javascript:commentPlusDb("+cid+","+num+")'>확인</a>";
				cmtHtml +="</div>";
				$("#cmtcmt"+num).append(cmtHtml);
			
			}
			
			function dateFormat(date) {
				var dt = new Date(date);
		        let month = dt.getMonth() + 1;
		        let day = dt.getDate();
		        let hour = dt.getHours();
		        let minute = dt.getMinutes();
		        let second = dt.getSeconds();

		        month = month >= 10 ? month : '0' + month;
		        day = day >= 10 ? day : '0' + day;
		        hour = hour >= 10 ? hour : '0' + hour;
		        minute = minute >= 10 ? minute : '0' + minute;
		        second = second >= 10 ? second : '0' + second;

		        return dt.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
			}
		</script>
</html>