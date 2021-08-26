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

.row{
	border: 1px solid #DCDCDC; 
	border-radius:20px;
	margin-bottom:20px;
	padding-left: 10px;
}
.container{
	margin-top: 50px;
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
		<div class="card">
			<table class="table">
				<tr>
					<th>글번호</th>
					<td>${vo.bid }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><strong>${vo.btitle }</strong></td>
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
		</div>
	
		<br>
		<div class="card">
			<div class="cmtHead"style="margin-top: 20px; margin-left: 40px;">
				<h4>
					댓글<strong id="comment">(${commCnt})</strong>
				</h4>
				<ul>
					<li><a href="registration" name="boardOpinionList" onclick="">등록순</a></li>
					<li><span>|</span></li>
					<li><a href="latest" onclick="">최신순</a></li>
				</ul>
			</div>
			<hr>
			<div id="cmt" style="margin-left: 50px;margin-right:50px;"></div>
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
		<br>
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
						$("#comment").html("("+data.commCnt+")");
						$("#cmt").empty();
						let myid="${mid }";
						let html ="<ul>";
						for (var i = 0; i < data.list.length; i++) {
							html +="<li class='row' id='cmt"+i+"'>";
						if(data.list[i].clev>0){
							for (var j = 0; j < data.list[i].clev; j++) {
								html += "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp";
							}
							html +="<img src='https://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif' style='object-fit: none; margin-bottom:55px;'>";
						}
						let mid = data.list[i].mid;
						let crdate = dateFormat(data.list[i].crdate);
						//삭제된 댓글이 아닐때 실행될곳
						if(data.list[i].cisdel==null){
							html +="<div>";
							html+=
								`
								<ul class="navbar-nav ml-auto">
					        	<!-- Nav Item - Alerts -->
					        	<li class="nav-item dropdown no-arrow mx-1">`
					        	//아이디가 본인꺼일때 실행
							if(mid=="${mid}"){
								html+=
									`
										<div style='margin-top:5px;'>
					            		\${mid}
							            <p style='color: gray;'>(\${crdate})</p>
							            </div>
							        	</li>
							        </ul>
									`	
							}else{
								//아이디가 본인이 아닐때 실행
					        	html+=`
				            		<a class="nav-link dropdown-toggle" href="#" role="button"
					                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">\${mid}
						            </a>
						            <p style='color: gray;'>(\${crdate})</p>
					                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
					                    aria-labelledby="alertsDropdown">
						                <div id="reqlist\${i}">
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
											<%--
							                    <div>
							                        <span class="font-weight-bold">
														<a href='javascript:friendreq("\${mid}");'>프로필보기</a></li>
							                        </span>
							                    </div>
							                    --%>
						                </div>
					                </div>
					        	</li>
					        </ul>
							`	
								}
							html +="<div>";
							html +="<span>"+data.list[i].ccontent+"</span>";
							html +="</div>";
							html +="<div id='cmtcmt"+i+"' style='margin-bottom:10px;'>";
							html +="</div>";
							html +="</div>";
							html +="<div style='position:absolute; left:85%; margin-top:60px;'>"
							html +="<a href='javascript:commentPlus("+data.list[i].cid+","+i+")'>답글</a>";
							if(data.list[i].mid=='${mid}'){
								html +="<span>|</span><a href='javascript:updateForm("+data.list[i].cid+","+i+")'>수정</a>";
								html +="<span>|</span><a href='javascript:deleteForm("+data.list[i].cid+")'>삭제</a>";
							}
							html +="</div>";
						}else{//삭제된 댓글일때 실행
							html+=
								`
								<div>
								<ul class="navbar-nav ml-auto">
					        	<!-- Nav Item - Alerts -->
					        	<li class="nav-item dropdown no-arrow mx-1">
					        		<div style='margin-top:5px;'>
							        	\${mid}
							            <p style='color: gray;'>(\${crdate})</p>
						        		삭제된 댓글입니다.
					        		</div>
					        	</li>
						        </ul>
						        </div><br>
							`
						}
							html +="</li>";
						}
						html +="</ul>";
						$("#cmt").append(html)
					}
				})
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
							if(data.vo.clev>0){
								for (var j = 0; j < data.vo.clev; j++) {
									updateHtml += "&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp";
								}
								updateHtml +="<img src='https://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif' style='object-fit: none; margin-bottom:65px;'>";
							}
							updateHtml +="<div>";
							updateHtml +="<img src=''><span>"+data.vo.mid+"</span>";
							let crdate = dateFormat(data.vo.crdate);
							updateHtml +="<br><span style='color: gray;'>("+crdate+")</span><br>";
							updateHtml +="<br><input type='text' value='"+data.vo.ccontent+"' id='ccontent"+num+"'><br>";
							updateHtml +="<a href='javascript:list()'>취소</a>";
							updateHtml +="<span>|</span><a href='javascript:updatedb("+cid+","+num+")'>확인</a>";
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
				cmtHtml +="&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp";
				cmtHtml +="<img src='https://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif' style='object-fit: none; margin-right: 5px;'>";
				cmtHtml +="${mid}: <input type='text' placeholder='댓글을 입력하세요.' id='cmtcmttext"+num+"' style='margin-right: 5px;'>";
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