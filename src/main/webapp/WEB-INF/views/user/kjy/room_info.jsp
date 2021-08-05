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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500;600;700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
</head>
<style>
* {
	font-family: 'Stylish', sans-serif;
}

#largeimgbox {
	position: relative;
	width: 1000px;
	left: 400px;
	height: 600px;
	top: 50px;
	margin-bottom: 200px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.largeimg {
	position: absolute;
	top: 100px;
	left: 0px;
	width: 500px;
	height: 400px;
	border-radius: 10px;
}

.amainimg {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 500px;
	height: 400px;
	z-index: 1;
	border-radius: 10px;
}

.anme {
	position: absolute;
	top: 100px;
	left: 550px;
	font-size: 30px;
	font-weight: bold;
}

.agrade {
	position: absolute;
	top: 150px;
	left: 550px;
	font-size: 15px;
	font-weight: bold;
}

.aadress {
	position: absolute;
	top: 150px;
	left: 600px;
	font-size: 15px;
	font-weight: bold;
}

.detailbox {
	position: absolute;
	top: 180px;
	left: 550px;
	width: 450px;
	height: 200px;
}

.adetail {
	position: absolute;
	font-size: 12px;
}

#googlemap {
	position: absolute;
	top: 400px;
	left: 550px;
	width: 450px;
	height: 100px;
}

.title {
	position: absolute;
	top: 680px;
	left: 400px;
	font-size: 25px;
	font-weight: bold;
}

/* 전체테두리 */
#room_info {
	position: relative;
	width: 1000px;
	left: 400px;
	height: 235px;
	border: 1px solid blue;
	margin-bottom: 40px;
	border-radius: 10px;
	box-shadow: 5px 5px 5px gray;
}

/* 이미지박스 */
#imgbox {
	position: absolute;
	top: 20px;
	left: 20px;
	width: 175px;
	height: 195px;
}

#smallimg1 {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 175px;
	height: 120px;
}

#smallimg2 {
	position: absolute;
	top: 125px;
	left: 0px;
	width: 85px;
	height: 70px;
}

#smallimg3 {
	position: absolute;
	top: 125px;
	left: 90px;
	width: 85px;
	height: 70px;
}

/* 우측 설명 */
#romm_name {
	position: absolute;
	top: 20px;
	left: 215px;
	width: 765px;
	height: 195px;
}

.name {
	position: absolute;
	top: 0px;
	line-height: 0px;
}

.serv {
	position: absolute;
	top: 80px;
	font-size: 15px;
	cursor: help;
}

.subname {
	position: absolute;
	top: 105px;
	font-size: 10px;
	color: blue;
}

.sumprice {
	position: absolute;
	top: 165px;
	right: 180px;
	font-size: 20px;
	color: red;
}

.price {
	position: absolute;
	top: 135px;
	right: 180px;
	font-size: 15px;
}

.btn {
	position: absolute;
	top: 140px;
	right: 0px;
	width: 150px;
	height: 50px;
}

/* 맨우측 인원표시 */
.personimg {
	position: absolute;
	top: 0px;
	right: 0px;
	height: 20px;
}

.person {
	position: absolute;
	top: 25px;
	right: 0px;
	font-size: 10px;
}

.minpersonimg {
	position: absolute;
	top: 50px;
	right: 0px;
	height: 20px;
}

.minperson {
	position: absolute;
	top: 75px;
	right: 0px;
	font-size: 10px;
}

#reviewbox {
	position: relative;
	width: 1000px;
	top: 100px;
	left: 400px;
	height: 1250px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.reviewtitle {
	position: absolute;
	top: 50px;
	left: 0px;
	font-size: 25px;
	font-weight: bold;
}

.sumstart {
	position: absolute;
	top: 100px;
	left: 0px;
	font-size: 15px;
	font-weight: bold;
}

#totalreview {
	position: absolute;
	top: 200px;
	left: 0px;
	width: 1000px;
	height: 970px;
}
#review {
	position: relative;
	width: 1000px;
	height: 150px;
	padding: 0px;
	background: #FFFFFF;
	-webkit-border-radius: 31px;
	-moz-border-radius: 31px;
	border-radius: 31px;
	border: #5347C0 solid 2px;
	margin-bottom: 50px;
	box-shadow: 5px 5px 5px gray;
}

#review:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 20px 6px 0;
	border-color: #FFFFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	bottom: -20px;
	left: 100px;
}

#review:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 21px 7px 0;
	border-color: #5347C0 transparent;
	display: block;
	width: 0;
	z-index: 0;
	bottom: -23px;
	left: 99px;
}

.retitle {
	position: absolute;
	top: 10px;
	left: 10px;
	font-size: 20px;
	font-weight: normal;
}

.reviewid {
	position: absolute;
	top: 42px;
	left: 10px;
	font-size: 12px;
}

.recontent {
	position: absolute;
	top: 70px;
	left: 10px;
	width: 800px;
	height: 70px;
	font-size: 15px;
}

.restar {
	position: absolute;
	top: 15px;
	right: 10px;
	font-size: 15px;
}

#page {
	position: absolute;
	top: 1200px;
	left: 450px;
	width: 100px;
	height: 50px;
	font-size: 25px;
	border: 1px gray;
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
		<input type="hidden" value="${vo.AID }" id="AID">
		
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
				<p class="price"><a href="javascript:void(0);" title="${vo.PRICE}">요금세부정보</a></p>
			 	<img class="personimg" src="${pageContext.request.contextPath }/${vo.PERIMG }">
			 	<p class="person">최대&nbsp;${vo.RIMAXPER }인</p>
			 	<img class="minpersonimg" src="${pageContext.request.contextPath }/${vo.MINPERIMG }">
			 	<p class="minperson">현재&nbsp;${person}인</p>
			 	<!-- session에 id가 있는지 확인후 없을경우 로그인페이지로 -->
			 	<c:choose>
			 		<c:when test="${empty sessionScope.mid }">
			 			<input type="button" class="btn btn-primary" class="btn" value="바로예약" onclick="loginpage()">
			 		</c:when>
			 		<c:otherwise>
			 			<input type="button" class="btn btn-primary" class="btn" value="바로예약" onclick="location.href='${pageContext.request.contextPath }/user/kjy/reservation?RIID=${vo.RIID}&STARTDAY=${STARTDAY}&ENDDAY=${ENDDAY}&RAMOUNT=${person }&SUM=${vo.SUM }'">
			 		</c:otherwise>
			 	</c:choose>
			</div>
		</div>
	</c:forEach>
	<div id="reviewbox">
		<p class="reviewtitle">솔직이용후기</p>
		<div id="totalreview"></div>
		<div id="page"></div>
	</div>
</div>
</body>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIFdez0Bx1XuNNQ0eIa12BjxqJ0gFO6eA&callback=initMap&region=kr"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/images/kjy/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		list(1);
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
			if(top-300>scrollValue){
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
	
	});

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
	
	//리뷰 총점
	var AID=$("#AID").val();
	var SSTAR=0;
	var SUMSTAR=0;
	var CNT=0;
	$.ajax({
		url:"${pageContext.request.contextPath }/user/kjy/review2",
		data:{"AID":AID},
		dataType:"json",
		success:function(d){
			SUMSTAR=d.SUMSTAR;
			CNT=d.CNT;
			if(SUMSTAR==1){
				SSTAR="★☆☆☆☆"
			}else if(SUMSTAR==2){
				SSTAR="★★☆☆☆";
			}else if(SUMSTAR==3){
				SSTAR="★★★☆☆";
			}else if(SUMSTAR==4){
				SSTAR="★★★★☆";
			}else if(SUMSTAR==5){
				SSTAR="★★★★★";
			}
			let html="<p class='sumstart'>"+CNT+"개의 리뷰 전체평점: "+SSTAR+"</p>";
			$("#reviewbox").append(html);
		}
	});
	//리뷰페이지
	function list(pageNum){
		$("#totalreview").empty();
		$.ajax({
			url:"${pageContext.request.contextPath }/user/kjy/review1",
			data:{"AID":AID,"pageNum":pageNum},
			dataType:"json",
			success:function(data){
				$(data.result).each(function(i,d){
					let RETITLE=d.retitle;
					let RECONTENT=d.recontent;
					let RERDATE=d.rerdate;
					let RESTAR=d.restar;
					let MID=d.mid;
					if(RESTAR==1){
						RESTAR="★☆☆☆☆"
					}else if(RESTAR==2){
						RESTAR="★★☆☆☆";
					}else if(RESTAR==3){
						RESTAR="★★★☆☆";
					}else if(RESTAR==4){
						RESTAR="★★★★☆";
					}else if(RESTAR==5){
						RESTAR="★★★★★";
					}
					let html="<div id='review'>"+
					"<p class='retitle'>"+RETITLE+"</p>"+
					"<p class='reviewid'>(작성자: "+MID+")</p>"+
					"<p class='recontent'>"+RECONTENT+"</p>"+
					"<p class='restar'>평점: "+RESTAR+"</p>"+
					"</div>";
					$("#totalreview").append(html);
				});
				//페이징 처리
				let startPage=data.startPageNum;
				let endPage=data.endPageNum;
				let pageCount=data.totalPageCount;
				let pageHtml="";
				if(startPage>5){
					pageHtml += "<a href='javascript:list("+ (startPage-1) + ")'>이전</a>";
				}
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:blue'>"+ i + "</span></a> ";
					}else{
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
					}	
				}
				if(endPage<pageCount){
					pageHtml += "<a href='javascript:list("+ (endPage+1) + ")'>다음</a>";
				}
				$("#page").html(pageHtml);
			}
		});
	}
	
	//로그인페이지로 이동
	function loginpage(){
		alert("로그인 페이지로 이동합니다.");
		location.href='${pageContext.request.contextPath }/';
	}
	
</script>
</html>