<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<title>채팅창</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/js/jquery-ui.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500;600;700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
	* {
		font-family: 'Stylish', sans-serif;
	}
	#tabs{
	 	width:400px;
	 	height:500px;
	 	overflow:scroll;
	 	overflow-x:hidden;
	}
	.member{
		position:relative;
		left:10px;
		width:320px;
		height:100px;
		border: 1px solid gray;
	}
	.memtitle{
		position:relative;
		left:10px;
		font-size:20px;
	}
	.memimg{
		position: absolute;
		top:10px;
		left:10px;
		width:80px;
		height:80px;
	}
	.cmname{
		position: absolute;
		top:20px;
		left:120px;
		font-size:20px; 
	}
	.cmscname{
		position: absolute;
		top:60px;
		left:120px;
		font-size:15px;
	}
	
	.buddytitle{
		margin-top:50px;
		position:relative;
		left:10px;
		font-size:20px;
	}
	.buddy{
		position:relative;
		left:10px;
		width:320px;
		height:100px;
		border: 1px solid gray;
		margin-bottom:20px;
	}
	
	.cr_cmname{
		position:relative;
		font-weight:bold;
		font-size:12px;
		width:50px;
		float: left;
		overflow: hidden; 
  		text-overflow: ellipsis;
  		white-space: nowrap; 
	}
	
	.cnt{
		position: absolute;
		top:20px;
		left:270px;
		font-size:12px;
		color:gray;
	}
</style>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">친구목록</a></li>
    <li><a href="#tabs-2">채팅목록</a></li>
    <li><a href="#tabs-3">Aenean lacinia</a></li>
  </ul>
  <div id="tabs-1">
  	<p class="memtitle">마이프로필</p>
   	<div class="member">
   		<img src="${pageContext.request.contextPath }/resources/images/members/${vo.cmprofile}" class="memimg">
   		<p class="cmname">${vo.cmname }</p>
   		<p class="cmscname">${vo.cmscname }</p>
   		<input type="hidden" id="cmid" value="${vo.cmid }">
   	</div>
   	
   	<p class="buddytitle">친구목록</p>
   	<c:forEach var="vo" items="${list }">
		<div class="buddy">
   			<img src="${pageContext.request.contextPath }/resources/images/members/${vo.cmprofile}" class="memimg">
   			<p class="cmname">${vo.cmname }</p>
   			<p class="cmscname">${vo.cmscname }</p>
   		</div>	   	
   	</c:forEach>
  </div>
  <div id="tabs-2">
  </div>
  <div id="tabs-3">
  </div>
</div>
<script>
	$( "#tabs" ).tabs();
	var cmid=$("#cmid").val();
	function chat_room(){
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath }/user/kjy/chat_room1',
			data:{'cmid':cmid},
			dataType:'json',
			success:function(data){
				$(data.countlist).each(function(i,d){
					var crid=d.CRID;
					var cnt=d.CNT;
					var html="<div class='chat_room"+crid+"' ondblClick='chating("+crid+")'>"+
					"<div class='roomimgbox"+crid+"'>"+
					"</div>"+
					"<div class='roombox"+crid+"'>"+
					"</div>"+
					"</div>";
					
					$("#tabs-2").append(html);
					
					//인원수 주기(2명이상만)
					if(cnt > 2){
						let cnthtml="<p class='cnt'>("+cnt+")</p>"
						$(".chat_room"+crid).append(cnthtml);
					}
					
					//인원별 프로필
					if(cnt == 2){
						//상대방과 나만있을때
						let imghtml="<img src='' class='profile_"+crid+"_0'>";
						$(".roomimgbox"+crid).append(imghtml);
						$(".profile_"+crid+"_0").css({
							position:"absolute",
							width:"80px",
							height:"80px",
							borderRadius: "10px",
						});
					}else if(cnt == 3){
						let imghtml="<img src='' class='profile_"+crid+"_0'>"+
						"<img src='' class='profile_"+crid+"_1'>";
						$(".roomimgbox"+crid).append(imghtml);
						$(".profile_"+crid+"_0").css({
							position:"absolute",
							top:"30px",
							left: "30px",
							width:"50px",
							height:"50px",
							borderRadius: "10px",
							zIndex: "2"
						});
						$(".profile_"+crid+"_1").css({
							position:"absolute",
							top:"0px",
							left: "0px",
							width:"50px",
							height:"50px",
							borderRadius: "10px",
							zIndex: "1"
						});
					}else if(cnt > 3){
						let imghtml="<img src='' class='profile_"+crid+"_0'>"+
						"<img src='' class='profile_"+crid+"_1'>"+
						"<img src='' class='profile_"+crid+"_2'>"+
						"<img src='' class='profile_"+crid+"_3'>";
						$(".roomimgbox"+crid).append(imghtml);
						$(".profile_"+crid+"_0").css({
							position:"absolute",
							top:"0px",
							left: "0px",
							width:"40px",
							height:"40px",
							borderRadius: "10px",
						});
						$(".profile_"+crid+"_1").css({
							position:"absolute",
							top:"0px",
							left: "40px",
							width:"40px",
							height:"40px",
							borderRadius: "10px",
						});
						$(".profile_"+crid+"_2").css({
							position:"absolute",
							top:"40px",
							left: "0px",
							width:"40px",
							height:"40px",
							borderRadius: "10px",
						});
						$(".profile_"+crid+"_3").css({
							position:"absolute",
							top:"40px",
							left: "40px",
							width:"40px",
							height:"40px",
							borderRadius: "10px",
						});
					}
					
					
					//css주기
					$(".chat_room"+crid).css({
						position:"relative",
						left:"10px",
						width:"320px",
						height:"100px",
						border:"1px solid gray",
						marginBottom: "10px",
						cursor:"pointer"
					});
					$(".roomimgbox"+crid).css({
						position:"absolute",
						left:"10px",
						top:"10px",
						width:"80px",
						height:"80px",
						overflow:"hidden"
					});
					$(".roombox"+crid).css({
						position:"absolute",
						left:"100px",
						top:"20px",
						width: "170px",
						height:"20px",
						overflow:"hidden"
					});
					
					chat_room2(crid);
				});
			}
		});
	}
	function chat_room2(crid){
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath }/user/kjy/chat_room2',
			data:{'cmid':cmid,'crid':crid},
			dataType:'json',
			success:function(data){
				$(data.list).each(function(i,d){
					//뒤에 , 붙이기
					if(i == 0){
						let cmname="<p class='cr_cmname'>"+d.cmname+"</p>";
						$(".roombox"+crid).append(cmname);
					}else{
						let cmname="<p class='cr_cmname'>,"+d.cmname+"</p>";
						$(".roombox"+crid).append(cmname);						
					}
					//이미지 속성넣기
					$(".profile_"+crid+"_"+i).attr("src","${pageContext.request.contextPath }/resources/images/members/"+d.cmprofile);
				});
			}
		});
		$("img").error(function(){
			$(this).attr("src","${pageContext.request.contextPath }/resources/images/chat/noimage2.jpg");
		});
	}
	//드래그 방지
	$(document).on("selectstart", function(event){return false;});
	
	function chating(crid){
		window.open('${pageContext.request.contextPath }/user/kjy/chating?crid='+crid, '채팅룸', 'width=700px,height=800px,scrollbars=yes,location=no');
	}
	
	chat_room();
</script>
