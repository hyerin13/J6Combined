<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#chatbox{
		position:absolute;
		top:0px;
		left:0px;
		width:500px;
		height:500px;
		border:1px solid gray;		
	}
	.tab{
		position:absolute;
		top:0px;
		left:0px;
		width:100px;
		height:500px;
		background:#EAEAEA;
	}
	.tab img{
		margin:10px;
		width:30px;
		height:30px;
	}
	
</style>
<div id="chatbox">
	<div class="tab">
      	<a href="#tab01"><img src="${pageContext.request.contextPath }/resources/images/chat/chatmain.png"></a>
      	<a href="#tab02"><img src="${pageContext.request.contextPath }/resources/images/chat/chat.jpg"></a>
    </div>
    
    <div class="tabcontent">
    	<div id="tab01">
    		<p>테스트1</p>>
    	</div>
    	<div id="tab02">
    		<p>테스트2</p>>
		</div>
		<div id="tab03">
    		<p>테스트3</p>>
		</div>
  	</div>
</div>
<script>
	$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	});
</script>
