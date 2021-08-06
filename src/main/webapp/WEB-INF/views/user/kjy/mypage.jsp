<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/images/kjy/jquery-ui.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500;600;700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	* {
		font-family: 'Stylish', sans-serif;
	}
	#headbox{
		position: absolute;
		top:100px;
		left: 400px;
		height: 400px;
		width: 1000px;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	.name{
		position: absolute;
		top:50px;
		left: 0px;
		font-size: 25px;
		font-weight: normal;
	}
	.memt{
		position: absolute;
		top:100px;
		left: 0px;
		font-size: 50px;
		font-weight: normal;
	}
	.profile{
		position: absolute;
		top:50px;
		right: 0px;
		width: 200px;
		height: 200px;
		border-radius: 100px;
		background: #489CFF;
	}
	.initial{
		position:absolute;
		font-size:100px;
		color: white;
		top:-70px;
		left:70px;
	}
	#proimg{
		position: absolute;
		top:0px;
		right: 0px;
		width: 200px;
		height: 200px;
		border-radius: 100px;
	}
	
	
	#contentbox{
		position:absolute;
		left:400px;
		top:600px;
		width:1000px;
		margin:0; 
		padding:0;
	}
	/*tab css*/
	div,ul,li {
		list-style:none;
	}
	.tab{
		position:absolute;
		left:0px;
		float:left; 
		width:600px; 
		height:290px;
	}
	.tabnav{
		position:relative;
		left:0px;
		font-size:0; 
		width:1000px; 
		border:1px solid #ddd;
	}
	.tabnav li{
		display: inline-block;  
		height:46px; 
		text-align:center; 
		border-right:1px solid #ddd;
	}
	.tabnav li a:before{
		content:""; 
		position:absolute; 
		left:0; 
		top:0px; 
		width:100%; 
		height:3px; 
	}
	.tabnav li a.active:before{
		background:blue;
	}
	.tabnav li a.active{
		border-bottom:1px solid #fff;
	}
	.tabnav li a{ 
		position:relative; 
		display:block; 
		background: #f8f8f8; 
		color: #000; 
		padding:0 30px; 
		line-height:46px; 
		text-decoration:none; 
		font-size:16px;
	}
	.tabnav li a:hover,.tabnav li a.active{
		background:#fff; color:blue; 
	}
	.tabcontent{
		position:relative;
		padding: 20px; 
		width:1000px;
		height:244px; 
		border:1px solid #ddd; 
		border-top:none;
	}
</style>
</head>
<body>
<div id="headbox">
	<p class="name">${vo.mname }님</p>
	<p class="memt">돌아오셔서 반갑습니다.</p>
	<div class="profile">
		<p class=" initial">${initial }</p>
		<img src="${pageContext.request.contextPath }/resources/images/kjy/mypage/${vo.mprofile}" onerror="this.style.display='none'" id="proimg">
	</div>
</div>
<div id="contentbox">
	<div class="tab">
    	<ul class="tabnav">
      		<li><a href="#tab01">탭1</a></li>
      		<li><a href="#tab02">탭2</a></li>
    	</ul>
    <div class="tabcontent">
    <div id="tab01">tab1 content</div>
    <div id="tab02">tab2 content</div>
  	</div>
  </div><!--tab-->
</div>	
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
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
</html>