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
		padding:10px;
		display:flex;
		flex-direction:row;
	}
	.memtitle{
		position:relative;
		left:10px;
		font-size:20px;
	}
	.memimg{
	/*
		position: absolute;
		top:10px;
		left:10px;
		*/
		width:80px;
		height:80px;
		margin-right:10px;
	}
	.cmname{
	/*
		position: absolute;
		top:20px;
		left:120px;
		*/
		font-size:20px; 
	}
	.cmscname{
	/*
		position: absolute;
		top:60px;
		left:120px;
		*/
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
		display:flex;
		flex-direction:row;
		padding:10px;
	}
	
	.buddy_text {
		width:186px;
		display:block;
		margin-right:10px;
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
	.buddy_more {
		width:12px;
		height:12px;
		position:relative;
		
	}
	#moreContent{
		display:block;
	    position:absolute;
	    background-color:#E8E8E8;
	    align:right;
	    z-index:10;
	    top:25px;
	    right:10px;
	}
	#delbuddy{
    	display:none;
	}
	#newchat{
    	display:none;
	}
	.moreDetail a {
		line-height:22px;
	}
	#more{
	    position:relative;
	    margin-left:auto;
	}
	.cr_msgshottime{
		position:absolute;
		top:20px;
		right:10px;
		font-size:10px;
		color:gray;
	}
	.cr_msgmessage{
		position:absolute;
		top:50px;
		left:100px;
		width:200px;
		height:35px;
		font-size:12px;
		word-break: break-all;
		display: inline-block;
		overflow: hidden; 
		text-overflow: ellipsis;
	}
</style>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">친구목록</a></li>
    <li><a href="#tabs-2">채팅목록</a></li>
  </ul>
  <div id="tabs-1">
  	<p class="memtitle">마이프로필</p>
   	<div class="member">
   		<img src="${pageContext.request.contextPath }/resources/images/members/${vo.cmprofile}" class="memimg">
   		<div class="buddy_text">
	   		<p class="cmname">${vo.cmname }</p>
	   		<p class="cmscname">${vo.cmscname }</p>
   		</div>
   		<!-- 파라미터 넘기기 -->
   		<input type="hidden" id="cmid" value="${vo.cmid }">
   		<input type="hidden" id="cmprofile" value="${vo.cmprofile }">
   		<input type="hidden" id="cmname" value="${vo.cmname }">
   	</div>
   	
   	<p class="buddytitle">친구목록</p>
   	<c:forEach var="vo" items="${list }" varStatus="status">
		<div class="buddy" onclick='room_open("${vo.cbbuid}")'>
   			<img src="${pageContext.request.contextPath }/resources/images/members/${vo.cmprofile}" class="memimg">
   			<div class="buddy_text">
	   			<p class="cmname">${vo.cmname }</p>
	   			<p class="cmscname">${vo.cmscname }</p>
   			</div>
   			<img src="${pageContext.request.contextPath }/resources/images/chat/threedotsicon.svg" class="buddy_more" id="more" onclick="btnmore(${status.index})">
   			<span id="moreContent" class="moreContent_${status.index}">
    			<span class="moreDetail_${status.index}" id="delbuddy"><a href="#">&nbsp;친구 삭제&nbsp;</a></span><br>
    			<span class="moreDetail_${status.index}" id="newchat"><a href="#">&nbsp;채팅방 생성&nbsp;</a></span>
    		</span>
   		</div>	   	
   	</c:forEach>
  </div>
  <div id="tabs-2">
  </div>
</div>
<script>
	$( "#tabs" ).tabs();
	var cmid=$("#cmid").val();
	var cmprofile=$("#cmprofile").val();
	var cmname=$("#cmname").val();
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

	
	
	//더보기버튼
	function btnmore(data) {
		console.log(data);
		//$("#moreContent").css("top",25).css("right",10);
		$(".moreContent_"+data).css("top",25);
		   if( $(".moreDetail_"+data).is(":visible")){
		        $(".moreDetail_"+data).hide();
		   }else{
		        $(".moreDetail_"+data).show();
		   }
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
				//최근 대화내역 출력
				$(data.list2).each(function(i,d){
					let msgshottime="<p class='cr_msgshottime'>"+d.msgshottime+"</p>";
					let msgmessage="<p class='cr_msgmessage'>"+d.msgmessage+"</p>";
					$(".chat_room"+crid).append(msgshottime);
					$(".chat_room"+crid).append(msgmessage);
				});
			}
		});
		$("img").error(function(){
			$(this).attr("src","${pageContext.request.contextPath }/resources/images/chat/noimage2.jpg");
		});
	}
	//드래그 방지
	$(document).on("selectstart", function(event){return false;});
	
	//대체 이미지 지정(이미지 null일떄)
	$("img").error(function(){
		$(this).attr("src","${pageContext.request.contextPath }/resources/images/chat/noimage2.jpg");
	});
	//기존 방 열기
	function chating(crid){
		var url='${pageContext.request.contextPath }/user/kjy/chating_room?crid='+crid+'&cmid='+cmid+'&cmprofile='+cmprofile+'&cmname='+cmname;
		window.open(url, '채팅룸', 'width=700px,height=800px,scrollbars=no,location=no');
	}
	//친구아이디로 확인하여 방이 있는지 여부 체크 후 채팅창 열기
	function room_open(cbbuid){
		var url='${pageContext.request.contextPath }/user/kjy/chating_check?cbbuid='+cbbuid+'&cmid='+cmid+'&cmprofile='+cmprofile+'&cmname='+cmname;
		window.open(url, '채팅룸', 'width=700px,height=800px,scrollbars=no,location=no');
		location.reload();
	}
	chat_room();
</script>
