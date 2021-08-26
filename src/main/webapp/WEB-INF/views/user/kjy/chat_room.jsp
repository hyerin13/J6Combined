<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/js/jquery-ui.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500;600;700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>

#header {
	position: relative;
	height: 50px;
	background:#C2DBEA;
	border-bottom:1px solid gray; 
}

#footer{
	position:relative;
	height:50px;
	background:white; 
	border-top:1px solid gray; 
}

#content{
	position:relative;
	background: #D6F0FF;
	height:590px;
	overflow-y:scroll;
	overflow-x:hidden;
}
.myprofile {
	position:absolute;
	top:5px;
	left:5px;
	width:40px;
	height:40px;
	border-radius: 10px;
}
.myname{
	position:absolute;
	left:60px;
	top:15px;
	font-size:15px;
	font-weight:bold;
}
#sendBtn{
	position: absolute;
	top:5px;
	right:5px;
	width:100px;
	height:50px;
}
#chatting{
	position:absolute;
	top:5px;
	left:5px;
	width:285px;
	height:50px;
	overflow:auto;
    resize: none;
}

.smallmenu{
	position: absolute;
	top:5px;
	right:20px;
	width:40px;
	height:40px;
	border-radius: 20px;
}
.smmenu{
	position:absolute;
	font-size:12px;
	font-weight: bold;
	margin-top:10px;
	text-decoration:none;
}

.moremenu{
	display:none;
	position:absolute;
	background-color:white;
	width:75px;
	height:80px;
	border:0.5px solid black;
	z-index:10;
	top:45px;
	right:5px;
}
</style>
<div id="header">
	<img src="${pageContext.request.contextPath }/resources/images/members/${cmprofile }" class="myprofile">
	<p class="myname">${cmname }</p>
	<img src="${pageContext.request.contextPath }/resources/images/chat/menu2.png" class="smallmenu">
	<span class="moremenu">
		<span id="menu1" class="smmenu">창닫기</span><br>
		<span id="menu2" class="smmenu">대화상대초대</span><br>
		<span id="menu3" class="smmenu">채팅방나가기</span><br>
	</span>
	<!-- 파라미터 값들 -->
	<input type="hidden" id="cmid" value=${cmid }>
	<input type="hidden" id="crid" value=${crid }>
	<input type="hidden" id="cmprofile" value=${cmprofile }>
	<input type="hidden" id="cmname" value=${cmname }>
</div>
<div id="content">
<div id="contentarea" class="contentarea">
</div>
</div>
<div id="footer">
	<div id="Msg">
		<textarea rows="" cols="" id="chatting"></textarea>
		<button class="btn btn-primary" onclick="send()" id="sendBtn">보내기</button>
	</div>
</div>
<script type="text/javascript">

var crid=$("#crid").val();
var cmid=$("#cmid").val();
var cmprofile=$("#cmprofile").val();
var cmname=$("#cmname").val();
//소켓 연결
var ws;
function wsOpen(){
	ws = new WebSocket("ws://" + location.host + "${pageContext.request.contextPath }/chating");
	//소켓 연결후 ajax로 채팅 리스트 불러오기
	$.ajax({
		type:'get',
		data:{'crid':crid},
		url:'${pageContext.request.contextPath }/user/kjy/messagelist',
		dataType:'json',
		success:function(data){
			$(data.list).each(function(i,d){
				let msgmessage=d.msgmessage;
				let cmid=d.cmid;
				let msgshottime=d.msgshottime;
				let cmname=d.cmname;
				let cmprofile=d.cmprofile;
				let msgsysmsg=d.msgsysmsg;
				if(msgsysmsg!=null){
					let html="<div class='sysdiv'>"+
					"<div class='sysbox'>"+
					"<p class='msgsysmsg'>"+msgsysmsg+"</p>"+
					"</div>"+
					"</div>";
					$("#contentarea").append(html);
					$(".sysdiv").css({
						position: "relative",
						width:"380px",
						textAlign:"center"
					});
					$(".sysbox").css({
						position: "relative",
						margin:"0 auto",
						width:"200px",
						wordBreak: "break-all"
					});
					$(".msgsysmsg").css({
						background:"white",
						fontSize:"12px",
						fontweight: "bold",
						borderRadius: "5px"
					});
				}
				if(cmid==$("#cmid").val() && msgmessage!=null){
					let html="<div class='memsgdiv'>"+
					"<div class='memsgbox'>"+
					"<p class='memsg'>"+msgmessage+"</p>"+
					"</div>"+
					"<p class='metime'>"+msgshottime+"</p>"+
					"</div>";
					$("#contentarea").append(html);
					$(".memsgdiv").css({
						position: "relative",
						width:"380px",
					});
					$(".memsgbox").css({
						position: "relative",
						width:"200px",
						left:"170px",
						wordBreak: "break-all"
					});
					$(".memsg").css({
						background:"white",
						fontSize:"15px",
						borderRadius: "5px"
					});
					$(".metime").css({
						position: "relative",
						display: "inline-block",
						left:"300px",
						fontSize:"10px"
					});
				}else if(msgmessage!=null){
					let html="<div class='youmsgdiv'>"+
					"<img src='${pageContext.request.contextPath }/resources/images/members/"+cmprofile+"' class='youprofile'>"+
					"<p class='youname'>"+cmname+"</p>"+
					"<div class='youmsgbox'>"+
					"<p class='youmsg'>"+msgmessage+"</p>"+
					"<p class='youtime'>"+msgshottime+"</p>"+
					"</div>"+
					"</div>";
					$("#contentarea").append(html);
					$(".youmsgdiv").css({
						position: "relative",
						width:"380px",
					});
					$(".youprofile").css({
						position: "relative",
						left:"10px",
						width:"50px",
						height:"50px",
						borderRadius: "15px"				
					});
					$(".youname").css({
						position: "absolute",
						top:"5px",
						left:"70px",
						fontSize:"12px",
						fontweight: "bold"
					});
					$(".youmsgbox").css({
						position: "relative",
						width:"200px",
						top:"-20px",
						left:"70px",
						wordBreak: "break-all"
					});
					$(".youmsg").css({
						display: "inline-block",
						background:"white",
						fontSize:"15px",
						borderRadius: "5px",
					});
					$(".youtime").css({
						position: "relative",
						fontSize:"10px"
					});
				}
			});
			//스크롤 하단 고정
			$('#content').scrollTop($('#content')[0].scrollHeight);
		}
	});
}

function wsEvt() {
	ws.onopen = function(data){
		//소켓이 열리면 초기화 세팅하기
		console.log(data);
	}
	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		var msg = data.data;
		if(msg != null && msg.trim() != ''){
			var d = JSON.parse(msg);
			let today = new Date();   
			let msgshottime=today.toLocaleTimeString();
			let msgmessage=d.msgmessage;
			let cmname=d.cmname;
			let cmprofile=d.cmprofile;
			let msgsysmsg=d.msgsysmsg;
			//시스템 메세지
			if(msgsysmsg!=null){
				let html="<div class='sysdiv'>"+
				"<div class='sysbox'>"+
				"<p class='msgsysmsg'>"+msgsysmsg+"</p>"+
				"</div>"+
				"</div>";
				$("#contentarea").append(html);
				$(".sysdiv").css({
					position: "relative",
					width:"380px",
					textAlign:"center"
				});
				$(".sysbox").css({
					position: "relative",
					margin:"0 auto",
					width:"200px",
					wordBreak: "break-all"
				});
				$(".msgsysmsg").css({
					background:"white",
					fontSize:"12px",
					fontweight: "bold",
					borderRadius: "5px"
				});
			}else{
				if(d.cmid == $("#cmid").val()){
					let html="<div class='memsgdiv'>"+
					"<div class='memsgbox'>"+
					"<p class='memsg'>"+msgmessage+"</p>"+
					"</div>"+
					"<p class='metime'>"+msgshottime+"</p>"+
					"</div>";
					$("#contentarea").append(html);	
					
					$(".memsgdiv").css({
						position: "relative",
						width:"380px",
					});
					$(".memsgbox").css({
						position: "relative",
						width:"200px",
						left:"170px",
						wordBreak: "break-all"
					});
					$(".memsg").css({
						background:"white",
						fontsize:"15px",
						borderRadius: "5px"
					});
					$(".metime").css({
						position: "relative",
						display: "inline-block",
						left:"300px",
						fontSize:"10px"
					});
				}else{
					let html="<div class='youmsgdiv'>"+
					"<img src='${pageContext.request.contextPath }/resources/images/members/"+cmprofile+"' class='youprofile'>"+
					"<p class='youname'>"+cmname+"</p>"+
					"<div class='youmsgbox'>"+
					"<p class='youmsg'>"+msgmessage+"</p>"+
					"<p class='youtime'>"+msgshottime+"</p>"+
					"</div>"+
					"</div>";
					$("#contentarea").append(html);
					$(".youmsgdiv").css({
						position: "relative",
						width:"380px",
					});
					$(".youprofile").css({
						position: "relative",
						left:"10px",
						width:"50px",
						height:"50px",
						borderRadius: "15px"				
					});
					$(".youname").css({
						position: "absolute",
						top:"5px",
						left:"70px",
						fontSize:"12px",
						fontweight: "bold"
					});
					$(".youmsgbox").css({
						position: "relative",
						width:"200px",
						top:"-20px",
						left:"70px",
						wordBreak: "break-all"
					});
					$(".youmsg").css({
						display: "inline-block",
						background:"white",
						fontSize:"15px",
						borderRadius: "5px",
					});
					$(".youtime").css({
						position: "relative",
						fontSize:"10px"
					});
				}	
			}
		}
		//스크롤 하단 고정
		$('#content').scrollTop($('#content')[0].scrollHeight);
	}
}


function send(data) {
	var option ={
		type: "message",
		cmid : $("#cmid").val(),
		crid : $("#crid").val(),
		cmname : $("#cmname").val(),
		cmprofile : $("#cmprofile").val(),
		msgmessage : $("#chatting").val(),
		msgsysmsg : data
	}
	ws.send(JSON.stringify(option))
	$('#chatting').val("");
	wsEvt();
}
wsOpen();

$(document).on("mouseenter",".smmenu",function(){
	$(this).css({
		cursor: "pointer",
		textDecoration: "underline"
	});
});
$(document).on("mouseleave",".smmenu",function(){
	$(this).css({
		cursor: "default",
		textDecoration: "none"		
	});
});

$(document).on("mouseenter",".smallmenu",function(){
	$(this).attr("src","${pageContext.request.contextPath }/resources/images/chat/menu1.png");
	$(this).css("cursor","pointer");
});
$(document).on("mouseleave",".smallmenu",function(){
	$(this).attr("src","${pageContext.request.contextPath }/resources/images/chat/menu2.png");
	$(this).css("cursor","default");
});

$(".smallmenu").on('click',function(){
	if( $(".moremenu").is(":visible")){
    	$(".moremenu").hide();
	}else{
		$(".moremenu").show();
	}
});

$("#menu1").on('click',function(){
	location.href="${pageContext.request.contextPath }/user/kjy/chat_main";
});

$("#menu2").on('click',function(){
});

$("#menu3").on('click',function(){
	$.ajax({
		type:'post',
		data:{'crid':crid,"cmid":cmid,"cmname":cmname},
		url:'${pageContext.request.contextPath }/user/kjy/chat_exit',
		dataType:'json',
		success:function(data){
			let code=data.code;
			let msgsysmsg=data.msgsysmsg;
			if(code=='success'){
				location.href="${pageContext.request.contextPath }/user/kjy/chat_main";
				//나갔다는 메세지 상대방에게 보내기
				send(msgsysmsg);
			}else{
				console.log("오류발생!");
			}
		}
	});
	
});

</script>