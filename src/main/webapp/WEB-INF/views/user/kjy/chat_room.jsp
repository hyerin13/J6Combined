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
	height: 100px;
	background:#C2DBEA;
	border-bottom:1px solid gray; 
}

#footer{
	position:relative;
	height:100px;
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
	top:10px;
	left:10px;
	width:80px;
	height:80px;
	border-radius: 20px;
}
.myname{
	position:absolute;
	left:110px;
	top:20px;
	font-size:20px;
	font-weight:bold;
}
.memsgdiv {
	position: relative;
	height: 50px;
}

.memsgbox {
	position: relative;
	top: 10px;
	float: right;
	right: 20px;
	width: 200px;
	background: white;
	border-radius: 5px;
	margin-left: 30px;
}

.memsg {
	position: relative;
	margin: 10px;
	word-break: break-all;
	font-size: 15px;
}

.metime {
	position: relative;
	float: right;
	top: 10px;
}

.youmsgdiv {
	position: relative;
	height: 100px;
}

.youprofile {
	position: relative;
	float: left;
	left:10px;
	width: 80px;
	height: 80px;
	border-radius: 20px;
}

.youname {
	position: relative;
	top: 10px;
	left: 20px;
	font-size: 15px;
	font-weight: bold;
}

.youmsgbox {
	position: relative;
	top: 10px;
	float: left;
	left: 20px;
	width: 200px;
	background: white;
	border-radius: 5px;
	margin-right: 30px;
}

.youmsg {
	position: relative;
	margin: 10px;
	word-break: break-all;
	font-size: 15px;
}

.youtime {
	position: relative;
	top: 10px;
}


#sendBtn{
	position: absolute;
	top:5px;
	right:5px;
	width:100px;
	height:100px;
}
#chatting{
	position:absolute;
	top:5px;
	left:5px;
	width:585px;
	height:100px;
	overflow:auto;
    resize: none;
}
</style>
<div id="header">
	<img src="${pageContext.request.contextPath }/resources/images/members/${cmprofile }" class="myprofile">
	<p class="myname">${cmname }</p>
	<!-- 파라미터 값들 -->
	<input type="hidden" id="cmid" value=${cmid }>
	<input type="hidden" id="crid" value=${crid }>
	<input type="hidden" id="cmprofile" value=${cmprofile }>
	<input type="hidden" id="cmname" value=${cmname }>
</div>
<div id="content">
<div id="chating" class="chating">
</div>
</div>
<div id="footer">
	<div id="yourMsg">
		<textarea rows="5" cols="20" id="chatting"></textarea>
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
	ws = new WebSocket("ws://" + location.host + "/final/chating");
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
				if(cmid==$("#cmid").val()){
					let html="<div class='memsgdiv'>"+
					"<div class='memsgbox'>"+
					"<p class='memsg'>"+msgmessage+"</p>"+
					"</div>"+
					"<p class='metime'>"+msgshottime+"</p>"+
					"</div>";
					$("#chating").append(html);
				}else{
					let html="<div class='youmsgdiv'>"+
					"<img src='${pageContext.request.contextPath }/resources/images/members/"+cmprofile+"' class='youprofile'>"+
					"<p class='youname'>"+cmname+"</p>"+
					"<div class='youmsgbox'>"+
					"<p class='youmsg'>"+msgmessage+"</p>"+
					"</div>"+
					"<p class='youtime'>"+msgshottime+"</p>"+
					"</div>";
					$("#chating").append(html);
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
		console.log("data:");
	}
	
	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		var msg = data.data;
		if(msg != null && msg.trim() != ''){
			var d = JSON.parse(msg);
			let today = new Date();   
			let msgshottime=today.toLocaleTimeString();
			if(d.cmid == $("#cmid").val()){
				let html="<div class='memsgdiv'>"+
				"<div class='memsgbox'>"+
				"<p class='memsg'>"+d.msgmessage+"</p>"+
				"</div>"+
				"<p class='metime'>"+msgshottime+"</p>"+
				"</div>";
				$("#chating").append(html);	
			}else{
				let html="<div class='youmsgdiv'>"+
				"<img src='${pageContext.request.contextPath }/resources/images/members/"+d.cmprofile+"' class='youprofile'>"+
				"<p class='youname'>"+d.cmname+"</p>"+
				"<div class='youmsgbox'>"+
				"<p class='youmsg'>"+d.msgmessage+"</p>"+
				"</div>"+
				"<p class='youtime'>"+msgshottime+"</p>"+
				"</div>";
				$("#chating").append(html);
			}
		}
		//부모창 리로드
		opener.parent.location.reload();
		//스크롤 하단 고정
		$('#content').scrollTop($('#content')[0].scrollHeight);
	}
}


function send() {
	var option ={
		type: "message",
		cmid : $("#cmid").val(),
		crid : $("#crid").val(),
		cmname : $("#cmname").val(),
		cmprofile : $("#cmprofile").val(),
		msgmessage : $("#chatting").val()
	}
	ws.send(JSON.stringify(option))
	$('#chatting').val("");
	wsEvt();
}
wsOpen();
</script>