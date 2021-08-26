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

<!-- 닉네임 눌러서 선객하틑 관련 -->
<link href="${pageContext.request.contextPath }/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

<style type="text/css">
.cmtHead ul li {
	list-style-type: none;
	float: left;
	margin-left: 5px;
}

a {
	color:black;
}

body {
	background: #fafafa;
}

</style>
</head>
<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/user/jhr/header.jsp" flush="true"/>
	</div>
	<div class="board_header">
		<jsp:include page="board_header.jsp" flush="true"/>
	</div>
	<div class="container">
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
	
		<div class="card" style="width: 1110px;">
		<div style='margin-left: 30px; margin-top: 30px;'>
			<div class="cmtHead">
				<h4>
					댓글<strong id="comment">(${commCnt})</strong>
				</h4>
				<ul>
					<li><a href="registration" name="boardOpinionList" onclick="">등록순</a></li>
					<li><span>|</span></li>
					<li><a href="latest" onclick="">최신순</a></li>
				</ul>
			</div>
			<br>
			<hr>
			<div id="cmt" style='margin-left: 30px;'></div>
			<hr>
			<div>
				<textarea placeholder="댓글을 입력하세요." id="ccontentText" cols="50" rows="3"></textarea>
				<input type="button" value="등록" id="btnAdd" class="btn btn-outline-primary" style="margin-left: 30px; margin-bottom: 45px;">
			</div>
		</div>
		</div>
		<div style='margin: 20px 0px 20px 0px;'>
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
		
		</div>
	</div>
	<div class="footer">
		<jsp:include page="/WEB-INF/views/user/jhr/footer.jsp" flush="true"/>
	</div>
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
							html +="<div>";
							if(data.list[i].clev>0){
								for (var j = 0; j < data.list[i].clev; j++) {
									html += "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp";
								}
								html +="<img src='https://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif' style='object-fit: none;'>";
							}
							let mid = data.list[i].mid;
							let crdate = dateFormat(data.list[i].crdate);
						html+=
						`
						<ul class="navbar-nav ml-auto">
				        	<!-- Nav Item - Alerts -->
				        	<li class="nav-item dropdown no-arrow mx-1">
			            		<a class="nav-link dropdown-toggle" href="#" onclick='dropdown("\${mid}","\${i}");' role="button"
				                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">\${mid}
					            </a>
					            <p style='color: gray;'>(\${crdate})</p>
				                <div id="reqlist\${i}" class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				                    aria-labelledby="alertsDropdown">
				                </div>
				        	</li>
				        </ul>
						`	
							html +="<div>";
							html +="<span>"+data.list[i].ccontent+"</span>";
							html +="</div>";
							html +="<div>";
							html +="<a href='javascript:commentPlus("+data.list[i].cid+","+i+")'>답글</a>";
							if(data.list[i].mid=='${mid}'){
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
			
			//아이디누르면 친구신청 띄우기
			function dropdown(mid,index){
				if(mid=="${mid }"){
					alert('본인입니다')
				}else{
					$("#reqlist"+index).empty();
					let myid="${mid }";
					let html=
						`
						<!-- Dropdown - Alerts -->
		                <a class="dropdown-item d-flex align-items-center" href="#">
		                    <%--
		                    <div class="mr-3">
		                        <div class="icon-circle bg-primary">
		                        	<img src="">
		                        </div>
		                    </div>
		                     --%>
		                    <div>
		                        <span class="font-weight-bold">
		                        	<div class="small text-gray-500" onclick='friendreq("\${mid}");'>친구요청</div>
		                        </span>
		                    </div>
		               	</a>
						`;
						<%--
		                    <div>
		                        <span class="font-weight-bold">
									<a href='javascript:friendreq("\${mid}");'>프로필보기</a></li>
		                        </span>
		                    </div>
		                    --%>
					$("#reqlist"+index).append(html)
				}
			}
			function friendreq(id){
				let checkdel = confirm(id+"님에게 친구요청을 보내시겠습니까?");
				if(checkdel == true){
					$.ajax({
			    		type : "GET",
			    		url :"${pageContext.request.contextPath }/hjy/friendreq",
			    		data : {"reqId":id,"myId":"${mid }"},
			    		dataType:"json",
				    	success:function(data){
				    		alert(data.result)
						}
					})
				}
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
							updateHtml +="<img src=''> <span>"+data.vo.mid+"</span><br> ";
							let crdate = dateFormat(data.vo.crdate);
							updateHtml +="<span style='color: gray;'>("+crdate+")</span>";
							updateHtml +="<div>";
							updateHtml +="<input type='text' value='"+data.vo.ccontent+"' id='ccontent"+num+"'>";
							updateHtml +="</div>";
							updateHtml +="<div >";
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
				cmtHtml +="<input type='text' placeholder='댓글을 입력하세요.' id='cmtcmttext"+num+"'>";
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