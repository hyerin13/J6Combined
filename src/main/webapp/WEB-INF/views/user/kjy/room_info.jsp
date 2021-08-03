<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/images/kjy/jquery-ui.css">
</head>
<style>
	#largeimgbox{
		position: relative;
		width: 1000px;
		left: 400px;
		height: 600px;
		top:50px;
		margin-bottom: 200px;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	.largeimg{
		position:absolute;
		top:100px;
		left:0px;
		width:500px;
		height:400px;
		border-radius: 10px;
	}
	.amainimg{
		position:absolute;
		top:0px;
		left:0px;
		width:500px;
		height:400px;
		z-index: 1;
		border-radius: 10px;
	}
	.anme{
		position:absolute;
		top:100px;
		left: 550px;
		font-size: 30px;
		font-weight: bold;
	}
	.agrade{
		position: absolute;
		top:150px;
		left: 550px;
		font-size: 15px;
		font-weight: bold;
	}
	.aadress{
		position: absolute;
		top:150px;
		left: 600px;
		font-size: 15px;
		font-weight: bold;
	}
	.detailbox{
		position: absolute;
		top:180px;
		left:550px;
		width: 450px;
		height: 200px;
	}
	.adetail{
		position: absolute;
		font-size: 12px;
	}
	#googlemap{
		position: absolute;
		top:400px;
		left:550px;
		width: 450px;
		height: 100px;
		
	}
	
	.title{
		position: absolute;
		top:680px;
		left: 800px;
		font-size: 25px;
		font-weight: bold;
	}
	
	/* 전체테두리 */
	#room_info{
		position:relative;
		width:1000px;
		left: 400px;
		height: 235px;
		border: 1px solid blue;
		margin-bottom: 40px;
		border-radius: 10px;
		box-shadow: 5px 5px 5px gray;
	}
	
	/* 이미지박스 */
	#imgbox{
		position:absolute;
		top:20px;
		left:20px;
		width:175px;
		height:195px;
	}
	#smallimg1{
		position:absolute;
		top:0px;
		left:0px;
		width: 175px;
		height: 120px;
	}
	#smallimg2{
		position:absolute;
		top:125px;
		left:0px;
		width: 85px;
		height: 70px;
	}
	#smallimg3{
		position:absolute;
		top:125px;
		left:90px;
		width: 85px;
		height: 70px;
	}
	
	/* 우측 설명 */
	#romm_name{
		position: absolute;
		top:20px;
		left:215px;
		width:765px;
		height:195px;
	}
	.name{
		position: absolute;
		top:0px;
		line-height: 0px;
	}
	.serv{
		position: absolute;
		top:80px;
		font-size: 15px;
	}
	.subname{
		position: absolute;
		top:105px;
		font-size: 10px;
		color: blue;
	}
	.sumprice{
		position: absolute;
		top:165px;
		right: 180px;
		font-size: 20px;
		color: red;
	}
	.price{
		position: absolute;
		top:135px;
		right: 180px;
		font-size: 15px;
	}
	
	.btn{
		position: absolute;
		top:140px;
		right: 0px;
		width: 150px;
		height: 50px;
	}
	
	/* 맨우측 인원표시 */
	.personimg{
		position:absolute;
		top:0px;
		right:0px;
		height: 20px;
	}
	.person{
		position: absolute;
		top:25px;
		right:0px;
		font-size: 10px;
	}
	.minpersonimg{
		position:absolute;
		top:50px;
		right:0px;
		height: 20px;
	}
	.minperson{
		position: absolute;
		top:75px;
		right:0px;
		font-size: 10px;
	}
	
</style>
<body>
<!-- 이미지 크게 일단 하나 -->
<div id="content">
	<div id="largeimgbox">
	<p class="anme">${accvo.ANAME}</p>
	<p class="agrade">${accvo.AGRADE}&nbsp;|&nbsp;</p>
	<p class="aadress">${accvo.AADDRESS}</p>
	<div class="detailbox">
		<p class="adetail">${accvo.ADETAIL}</p>
	</div>
	<div id="googlemap">
		<input type="hidden" value="${accvo.ANAME}" id="googlename">
		<input type="hidden" value="${accvo.AXCOORDI }" id="googlex">
		<input type="hidden" value="${accvo.AYCOORDI }" id="googley">
	</div>
		<div class="largeimg">
			<img src="${pageContext.request.contextPath }/resources/images/kjy/accommodations/${accvo.AMAINIMG}" class="amainimg">
		</div>
	</div>
	<p class="title">객실정보</p>
	<c:forEach var="vo" items="${list }" varStatus="status">
		<div id="room_info">
			<div id="imgbox">
				<img src="${pageContext.request.contextPath }/resources/images/kjy/room_info/${vo.RIMAINIMG}" id="smallimg1">
				<img src="${pageContext.request.contextPath }/resources/images/kjy/room_info/${vo.RIEXTRAIMG1}" id="smallimg2">
				<img src="${pageContext.request.contextPath }/resources/images/kjy/room_info/${vo.RIEXTRAIMG2}" id="smallimg3">			
			</div>
			<div id="romm_name">
				<h2 class="name">${vo.RIROOMTYPE}</h2>
				<p class="serv">부가서비스</p>
				<p class="subname">${vo.RISERVICE }</p>
				<p class="sumprice">₩&nbsp;${vo.SUM}</p>
				<p class="price"><a href="#" title="${vo.PRICE}">요금세부정보</a></p>
			 	<img class="personimg" src="${pageContext.request.contextPath }/${vo.PERIMG }">
			 	<p class="person">최대&nbsp;${vo.RIMAXPER }인</p>
			 	<img class="minpersonimg" src="${pageContext.request.contextPath }/${vo.MINPERIMG }">
			 	<p class="minperson">현재&nbsp;${person}인</p>
			 	<button type="button" class="btn btn-primary" class="btn">바로예약</button>
			</div>
		</div>
	</c:forEach>
</div>
</body>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIFdez0Bx1XuNNQ0eIa12BjxqJ0gFO6eA&callback=initMap&region=kr"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/images/kjy/jquery-ui.js"></script>
<script type="text/javascript">
//구글 지도
	function initMap() {
		var googlename=$("#googlename").val();//호텔 이름
		var googlex=$("#googlex").val(); //경도
		var googley=$("#googley").val(); //위도
		var xy = { 
			lat:+googlex, 
			lng:+googley
		};//위치
		var map = new google.maps.Map(
		document.getElementById('googlemap'), {
  		zoom: 16,//줌화면크기
  		center: xy
		});
		new google.maps.Marker({
   		 position: xy,//좌표에 마커찍기
   		 map: map,
   		 label:googlename
		});
	}
	
	$(function(){
		
		//사진 호버설정
		var scrollValue=0;
		$(window).scroll(function () { 
			scrollValue = $(document).scrollTop(); 
		});
		$("#imgbox img").hover(function(){
			var top=$(this).offset().top;
			var left=$(this).offset().left;
			var height=$(this).height();
			var img=$(this).attr("src");
			let str="<img src="+img+" id='addimg'>";
			if(top/2>scrollValue){
				$(str).appendTo("#content").css({
					border: '3px solid black',
					position:'absolute',
					top:top-303+'px',
					left:left+'px',
					width:'400px',
					height:'300px'
				});
			}else{
				$(str).appendTo("#content").css({
					border: '3px solid black',
					position:'absolute',
					top:top+height+'px',
					left:left+'px',
					width:'400px',
					height:'300px'
				});
			}
		},function(){
			$("#addimg").remove();
		});
		
		//툴팁효과
		$(".price").tooltip();

		
		$(".btn").click(function(){
			alert("test");
		});
	});
</script>
</html>