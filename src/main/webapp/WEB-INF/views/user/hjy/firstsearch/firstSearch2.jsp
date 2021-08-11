<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bg-orange {
	background: #d8622b;
	color: #fff !important;
}

body {
	background: #f4f4f4;
}

img {
	width: 100%;
	max-height: 560px;
}

a {
	color: #696969;
}

/*별점 칠하기 css*/
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 0px;
	justify-content: space-around;
	padding: 0 0.2em;
	width: 100px;
}

/*기존 라디오 버튼 사라짐*/
.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}
/*클릭시 변경*/
.star-rating :checked ~ label {
	-webkit-text-fill-color: red;
}
/*호버시 변경*/
.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: pink;
}



.dropdown.dropdown-lg .dropdown-menu {
    margin-top: -1px;
    padding: 6px 20px;
}
.input-group-btn .btn-group {
    display: flex !important;
}
.btn-group .btn {
    border-radius: 0;
    margin-left: -1px;
}
.btn-group .btn:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}
.btn-group .form-horizontal .btn[type="submit"] {
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.form-horizontal .form-group {
    margin-left: 0;
    margin-right: 0;
}
.form-group .form-control:last-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}
@media screen and (min-width: 768px) {
    #adv-search {
        width: 500px;
        margin: 0 auto;
    }
    .dropdown.dropdown-lg {
        position: static !important;
    }
    .dropdown.dropdown-lg .dropdown-menu {
        min-width: 500px;
    }
}
</style>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hznya2qvqk&submodules=geocoder"></script>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>
<body>
	<!--banner section-->
	<section class="title-banner py-4 bg-orange" id="title-banner">
		<div class="container py-5">
			<div class="row">
				<h4>About Us</h4>
			</div>
		</div>
	</section>
	<!--filter section-->
	<div class="container">
		<div class="row ">
			<div class="col-md-12">
				<div class="bg-secondary">
					<div class="card-body">
						<div class="row">
							<div class="col-md-3">
								<form method="post"
									action="${pageContext.request.contextPath }/hjy/firstsearch">
									<div class="form-group">
										<div class="form-control">
											호텔명 or 지역 <input type="text" id="searchHotel"
												name="searchHotel" value="${aaddress }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											체크인 <input type="date" name="checkin" value="${rcheckin }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											체크아웃 <input type="date" name="checkout" value="${rcheckout }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											<label for="filter">객실수</label> <input type="number" min="1"
												id="countRoom" name="countRoom" value="${countRoom }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											<label for="contain">인원수</label> <input type="number" min="1"
												id="countPeople" name="countPeople" value="${rimaxper }">
										</div>
									</div>
									<input type="submit" value="검색" id="search" class="btn bg-orange secondary btn-block">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--main content section-->
	<section class="mb-5">
		<div class="container">
			<div class="row title py-3">
				<div class="col-md-12">
					<h5>
						<strong>검색결과</strong>
					</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="row mb-3">
						<div class="col-md-12">
								<div class="card">
									<div id="accordion">
									    <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#mapshow" aria-expanded="true">
									          지도
									        </button>
									      </h2>
									    </div>
									    <div id="mapshow" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<button id="gomap">지도로 보기</button>
													</li>
												</ul>
									      </div>
									      <script type="text/javascript">
									      $(document).ready(function() {
									      	$("#gomap").click(function() {
									      		$("#list div div").empty();
									      		let html =
									      			`<div id='mapping' style='width:300px;height:300px;'></div>`;
									      		$("#list div div div div div").append(html);
									      	})
									      })
									      
									      	var HOME_PATH = window.HOME_PATH || '.';
											var MARKER_SPRITE_X_OFFSET = 29,
											    MARKER_SPRITE_Y_OFFSET = 50,
											    MARKER_SPRITE_POSITION = {
											        "A0": [0, 0],
											        "B0": [MARKER_SPRITE_X_OFFSET, 0],
											        "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
											        "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
											        "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
											        "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
											        "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
											        "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
											        "I0": [MARKER_SPRITE_X_OFFSET*8, 0],
											
											        "A1": [0, MARKER_SPRITE_Y_OFFSET],
											        "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
											        "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
											        "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
											        "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
											        "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
											        "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
											        "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
											        "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],
											
											        "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
											        "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
											        "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
											        "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
											        "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
											        "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
											        "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
											        "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
											        "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
											    };
											
											var showmap = new naver.maps.Map('mapping', {
											    center: new naver.maps.LatLng(37.3595704, 127.105399),
											    zoom: 10
											});
											
											var bounds = map.getBounds(),
											    southWest = bounds.getSW(),
											    northEast = bounds.getNE(),
											    lngSpan = northEast.lng() - southWest.lng(),
											    latSpan = northEast.lat() - southWest.lat();
											
											var markers = [],
											    infoWindows = [];
											
											for (var key in MARKER_SPRITE_POSITION) {
											
											    var position = new naver.maps.LatLng(
											        southWest.lat() + latSpan * Math.random(),
											        southWest.lng() + lngSpan * Math.random());
											
											    var marker = new naver.maps.Marker({
											        map: map,
											        position: position,
											        title: key,
											        icon: {
											            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
											            size: new naver.maps.Size(24, 37),
											            anchor: new naver.maps.Point(12, 37),
											            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
											        },
											        zIndex: 100
											    });
											
											    var infoWindow = new naver.maps.InfoWindow({
											        content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key.substr(0, 1) +'"</b>.</div>'
											    });
											
											    markers.push(marker);
											    infoWindows.push(infoWindow);
											};
											
											naver.maps.Event.addListener(map, 'idle', function() {
											    updateMarkers(map, markers);
											});
											
											function updateMarkers(map, markers) {
											
											    var mapBounds = map.getBounds();
											    var marker, position;
											
											    for (var i = 0; i < markers.length; i++) {
											
											        marker = markers[i]
											        position = marker.getPosition();
											
											        if (mapBounds.hasLatLng(position)) {
											            showMarker(map, marker);
											        } else {
											            hideMarker(map, marker);
											        }
											    }
											}
											
											function showMarker(map, marker) {
											
											    if (marker.setMap()) return;
											    marker.setMap(map);
											}
											
											function hideMarker(map, marker) {
											
											    if (!marker.setMap()) return;
											    marker.setMap(null);
											}
											
											// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
											function getClickHandler(seq) {
											    return function(e) {
											        var marker = markers[seq],
											            infoWindow = infoWindows[seq];
											
											        if (infoWindow.getMap()) {
											            infoWindow.close();
											        } else {
											            infoWindow.open(map, marker);
											        }
											    }
											}
											for (var i=0, ii=markers.length; i<ii; i++) {
											    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
											}
											
									      </script>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#favorite" aria-expanded="true">
									          즐겨찾기
									        </button>
									      </h2>
									    </div>
									    <div id="favorite" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
								      		<ul class="list-unstyled">
									      		<li>
													<input type="checkbox">즐겨찾기 선호호텔체인
												</li>
											</ul>
									      </div>
									   </div>
									   <script type="text/javascript">
									   function checklist(templist){
										   $("#facilities input").each(function(){
										    	if( $(this).is(":checked") == true ){
											      	var temId = $(this).attr('id');
											      	templist.push(temId);
										    	}
										  	});
											$("#forFree input").each(function(){
										    	if( $(this).is(":checked") == true ){
											      	var temId = $(this).attr('id');
											      	templist.push(temId);
										    	}
										  	});
									   }
											$(document).ready(function() {
												$("#accordion button").click(function() {
													if($($(this).attr('data-target')).attr('class')=='collapse show'){
														$($(this).attr('data-target')).attr('class','collapse')
													}else{
														$($(this).attr('data-target')).attr('class','collapse show')
													}
												});
												
												//편의시설 ajax
												$("#facilities input").click(function() {
													let templist= new Array(); 
													checklist(templist)
													if($("#locationamount").val()!="none"){
														list(templist,locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val())
													}else{
														list(templist);
													}
												})
												
												//무료시설 ajax
												$("#forFree input").click(function() {
													let templist= new Array(); 
													checklist(templist)
													if($("#locationamount").val()!="none"){
														list(templist,locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val())
													}else{
														list(templist);
													}
												})
												
												//자동완성 숙소이름
												$("#searchHotelname").autocomplete({
													source:function(request,response){
														let aname=$("#searchHotelname").val();
														//console.log(aname);
														$.ajax({
															type:'get',
															url:"/project/hjy/ajax/auto",
															data:{"aname":aname,"aaddress":aname,"firstaaddress":"${aaddress }"},
															dataType:"json",
															success:function(data){
																console.log(data)
																response(
																	$.map(data.list,function(item){
																		return{
																			label:item,
																			value:item
																		}
																	})		
																)
															}
														})
													},
													select:function(event,ui){
														console.log(ui);
														console.log(ui.item.label);
														console.log(ui.item.value);
													},
													focus:function(event,ui){
														return false; //한글 에러잡기
													},
													minLength:1,//최소글자수
													autoFocus:true, //첫번째 항목 자동 포커스a 기본값 false
													 classes: {    //잘 모르겠음
											             "ui-autocomplete": "highlight"
											         },
													delay:500, //검색창에 글자 쓰고 autocomplete되기까지 딜레이 시간ms)
													//disabled:true, //자동완성기능 끄기
													//position:{my:"right top", at:"right bottom"},
													close:function(event){
														console.log(event);
													}
												}).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
											        return $( "<li>" )    //기본 tag가 li로 되어 있음 
											        .append( "<div>" + item.value +"</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
											        .appendTo( ul );
											 	};
											 	$("#locationamount").change(function() {
											    	for (var i = 0; i < circle.length; i++) {
												    	circle[i].setMap(null);
												    	circle.shift();
													}
											    	makeCircle(locationmap,locationmarker.getPosition(),$(this).val());
											    	let templist= new Array(); 
													checklist(templist)
													//console.log("위도",ycoordi)
													//console.log("경도",xcoordi)
													list(templist,locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$(this).val());
													
											    })
											});
											
											//좌표 위도경도로 변환계
											function changeXY(xcoordi,ycoordi){
												let xy=[];
												if(xcoordi*1>100){
													// point array 1
												    var point1 = [xcoordi*1, ycoordi*1]
												    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs"; // from
												    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
												   
												    // #1. 변환한 위도 경도 값 저장
												    var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
													xy.push(lonAndLat1[0])
													xy.push(lonAndLat1[1])
												}else{
													xy.push(xcoordi)
													xy.push(ycoordi)
												}
												return xy;
											}
											//거리안에 있는지 측정하기위한function
											function isdistancein1(coords1, coords2) {
											  const { lat: lat1, lon: lon1 } = coords1;
											  const { lat: lat2, lon: lon2 } = coords2;
											  const degToRad = x => x * Math.PI / 180;
											  const R = 6371;
											  const halfDLat = degToRad(lat2 - lat1) / 2;  
											  const halfDLon = degToRad(lon2 - lon1) / 2;  
											  const a = Math.sin(halfDLat) * Math.sin(halfDLat) + 
											            Math.cos(degToRad(lat1)) * Math.cos(degToRad(lat2)) * 
											            Math.sin(halfDLon) * Math.sin(halfDLon);  
											  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)); 
											  return R * c; 
											}
											function isdistancein(coords1, coords2) {
												var isdistanceinlat1 = coords1[0];
												var isdistanceinlon1 = coords1[1];
												var isdistanceinlat2 = coords2[0];
												var isdistanceinlon2 = coords2[1];
												function deg2rad(deg) {
											        return deg * (Math.PI/180)
											    }
											    var r = 6371; //지구의 반지름(km)
											    var dLat = deg2rad(isdistanceinlat2-isdistanceinlat1);
											    var dLon = deg2rad(isdistanceinlon2-isdistanceinlon1);
											    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + 
											    Math.cos(deg2rad(isdistanceinlat1)) * Math.cos(deg2rad(isdistanceinlat2)) * 
											    Math.sin(dLon/2) * Math.sin(dLon/2);
											    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
											    var d = r * c; // Distance in km
											    return Math.round(d*1000);
											}
											function list(facilities,xcoordi,ycoordi,distance){
												   $.ajax({
														url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
														traditional :true,
														data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}",
															"facilities":facilities,"xcoordi":xcoordi,"ycoordi":ycoordi,"distance":distance},
														type:"post",
														dataType:"json",
														success:function(data){
															if(data.code=='success'){
																console.log("파라미터: " +facilities,xcoordi,ycoordi,distance)
															   $("#list").empty();
															   for (var i = 0; i < data.list.length; i++) {
																   let html = "";
																   if(xcoordi){
																	   testxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi)
																	   //기준좌표
																	   	let refcoordi = [xcoordi, ycoordi];
																	   console.log("refcoordi: ",refcoordi)
																	   //db에서 불러온 좌표
																		let dbcoordi = [testxy[1],testxy[0]];
																		console.log("숙소이름: "+data.list[i].aname);
																		console.log("두개사이의 거리: "+isdistancein(refcoordi, dbcoordi),"m");
																		console.log("distance: "+distance)
																		if(isdistancein(refcoordi, dbcoordi)<=distance){
																			html+="<div class='row mb-3'>";
																			html+="<div class='col-md-12'>";
																			html+="<div class='card'>";
																			html+="<div class='card-body'>";
																			html+="<div class='row'>";
																			html+="<div class='col-md-3'>";
																			if(data.list[i].amainimg==null){
																				html+="<img src='${pageContext.request.contextPath }/resources/img/220i0z000000mulfw433F_Z_1080_808_R5_D.jsp' width='300' height='250'>";
																			}else{
																				html+="<img src='${pageContext.request.contextPath }/resources/hjy/hotelmain/"+data.list[i].amainimg+"'width='300' height='250'>";
																			}
																			html+="</div>";
																			html+="<div class='col-md-7'>";
																			html+="<h3>"+data.list[i].aname+"</h3>";
																			html+="<small>"+data.list[i].aaddress+"</small>";
																			html+="<div id='map"+i+"' style='width: 200px; height: 200px;'>지도넣기"
																			html+="<input type='hidden' id='axcoordi"+i+"' value="+data.list[i].axcoordi+">";
																			html+="<input type='hidden' id='aycoordi"+i+"' value="+data.list[i].aycoordi+">";
																			html+="</div>";
																			html+="</div>";
																			html+="<div class='col-md-2'>";
																			html+="<h5>"+data.list[i].sum+"원</h5>";
																			html+="<button class='btn' onclick=\"";
																			html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID="+data.list[i].aid;
																			html+="&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+${rcheckin}+"&endday="+${rcheckout}
																			html+="'\">예약하기</button>";
																			html+="</div>";
																			html+="</div>";
																			html+="</div>";
																			html+="</div>";
																			html+="</div>";
																			html+="</div>";
																		}
																   }else{
																	html+="<div class='row mb-3'>";
																	html+="<div class='col-md-12'>";
																	html+="<div class='card'>";
																	html+="<div class='card-body'>";
																	html+="<div class='row'>";
																	html+="<div class='col-md-3'>";
																	if(data.list[i].amainimg==null){
																		html+="<img src='${pageContext.request.contextPath }/resources/img/220i0z000000mulfw433F_Z_1080_808_R5_D.jsp' width='300' height='250'>";
																	}else{
																		html+="<img src='${pageContext.request.contextPath }/resources/hjy/hotelmain/"+data.list[i].amainimg+"'width='300' height='250'>";
																	}
																	html+="</div>";
																	html+="<div class='col-md-7'>";
																	html+="<h3>"+data.list[i].aname+"</h3>";
																	html+="<small>"+data.list[i].aaddress+"</small>";
																	html+="<div id='map"+i+"' style='width: 200px; height: 200px;'>지도넣기"
																	html+="<input type='hidden' id='axcoordi"+i+"' value="+data.list[i].axcoordi+">";
																	html+="<input type='hidden' id='aycoordi"+i+"' value="+data.list[i].aycoordi+">";
																	html+="</div>";
																	html+="</div>";
																	html+="<div class='col-md-2'>";
																	html+="<h5>"+data.list[i].sum+"원</h5>";
																	html+="<button class='btn' onclick=\"";
																	html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID="+data.list[i].aid;
																	html+="&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+${rcheckin}+"&endday="+${rcheckout}
																	html+="'\">예약하기</button>";
																	html+="</div>";
																	html+="</div>";
																	html+="</div>";
																	html+="</div>";
																	html+="</div>";
																	html+="</div>";
																   }
																   $("#list").append(html);
																}
																   for (var i = 0; i < data.list.length; i++) {
																   		mainMapList(i);
																   }
															}else{
																alert("fail")
															}
														}
													})
											   }
										</script>
									    <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#hotelGrades" aria-expanded="true">
									          호텔등급
									        </button>
									      </h2>
									    </div>
									    <div id="hotelGrades" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<div class="star-rating space-x-4 mx-auto">
															<input type="radio" id="5-stars" name="agrade" value="5"
																v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
															<input type="radio" id="4-stars" name="agrade" value="4"
																v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
																type="radio" id="3-stars" name="agrade" value="3" v-model="ratings" />
															<label for="3-stars" class="star">★</label> <input type="radio"
																id="2-stars" name="agrade" value="2" v-model="ratings" /> <label
																for="2-stars" class="star">★</label> <input type="radio"
																id="1-star" name="agrade" value="1" v-model="ratings" /> <label
																for="1-star" class="star">★</label>
														</div>
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#costomgrade" aria-expanded="true">
									          고객평점
									        </button>
									      </h2>
									    </div>
									    <div id="costomgrade" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<div class="star-rating space-x-4 mx-auto">
															<input type="radio" id="5-stars" name="agrade" value="5"
																v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
															<input type="radio" id="4-stars" name="agrade" value="4"
																v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
																type="radio" id="3-stars" name="agrade" value="3" v-model="ratings" />
															<label for="3-stars" class="star">★</label> <input type="radio"
																id="2-stars" name="agrade" value="2" v-model="ratings" /> <label
																for="2-stars" class="star">★</label> <input type="radio"
																id="1-star" name="agrade" value="1" v-model="ratings" /> <label
																for="1-star" class="star">★</label>
														</div>
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#price" aria-expanded="true">
									          가격
									        </button>
									      </h2>
									    </div>
									    <div id="price" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#forFree" aria-expanded="true">
									          무료제공
									        </button>
									      </h2>
									    </div>
									    <div id="forFree" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="checkbox" id="조식포함">조식포함
													</li>
													<li>
														<input type="checkbox" id="무료주차">무료주차
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#AccommodationName" aria-expanded="true">
									          숙소명
									        </button>
									      </h2>
									    </div>
									    <div id="AccommodationName" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="text" placeholder="숙소명" id="searchHotelname">
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#location" aria-expanded="true">
									          위치
									        </button>
									      </h2>
									    </div>
									    <div id="location" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
													   <div id="locationmap" style="width:100%; height:300px;"></div>
													</li>
													<li>
														인근반경
													</li>
													<li>
														<select id="locationamount">
															<option value="none">거리 상관없음</option>
															<option value="500">0.5km</option>
															<option value="1000">1km</option>
															<option value="2000">2km</option>
															<option value="5000">5km</option>
															<option value="10000">10km</option>
														</select>
													</li>
												</ul>
									      </div>
									   </div>
									    <script type="text/javascript">
									    var xcoordi; 
									    var ycoordi; 
									    function searchAddressToCoordinate(address) {
									  	  naver.maps.Service.geocode({
									  	    query: address
									  	  }, function(status, response) {
									  	    if (status === naver.maps.Service.Status.ERROR) {
									  	      if (!address) {
									  	        return alert('Geocode Error, Please check address');
									  	      }
									  	      return alert('Geocode Error, address:' + address);
									  	    }

									  	    if (response.v2.meta.totalCount === 0) {
									  	      return alert('검색결과가 없습니다.');
									  	    }

									  	    var htmlAddresses = [],
									  	      item = response.v2.addresses[0],
									  	      point = new naver.maps.Point(item.x, item.y);
									  	      xcoordi = item.x;
									  	      ycoordi = item.y;

									  	    if (item.roadAddress) {
									  	      htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
									  	    }

									  	    if (item.jibunAddress) {
									  	      htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
									  	    }

									  	    if (item.englishAddress) {
									  	      htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
									  	    }
									  	  locationmap.setCenter(point);
									  	  });
									  	}
									  	searchAddressToCoordinate($("#searchHotel").val());
									    
									    var locationposition = new naver.maps.LatLng(ycoordi, xcoordi);

									    var locationmap = new naver.maps.Map('locationmap', {
									        center: locationposition,
									        zoom: 15
									    });

									    var locationmarker = new naver.maps.Marker({
									        position: locationposition,
									        map: locationmap
									    });
									    var circle =[];

									    naver.maps.Event.addListener(locationmap, 'click', function(e) {
									    	locationmarker.setPosition(e.coord);
									    });
									    
									    function makeCircle(locationmap,locationposition,size){
									    	circle.push(new naver.maps.Circle({
										        map: locationmap,
										        center: locationposition,
										        radius: size,//m단위의 반지름 입력
										        fillColor: 'crimson',
										        fillOpacity: 0.8
										    })
									    	);
									    }
									    </script>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#facilities" aria-expanded="true">
									          편의시설
									        </button>
									      </h2>
									    </div>
									    <div id="facilities" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="checkbox" id="금연">금연
													</li>
													<li>
														<input type="checkbox" id="수영장">수영장
													</li>
													<li>
														<input type="checkbox" id="스파">스파
													</li>
													<li>
														<input type="checkbox" id="욕조">욕조
													</li>
													<li>
														<input type="checkbox" id="wifi">wifi
													</li>
													<li>
														<input type="checkbox" id="피트니스">피트니스
													</li>
												</ul>
									      </div>
									   </div>
									</div>
								</div>
							</div>
						</div>
					</div>
			<div class="col-md-9" id="list">
				<c:forEach var="vo" items="${list }" varStatus="status">
					<div class="row mb-3">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-3">
											<c:choose>
												<c:when test="${vo.amainimg eq null}">
													<!-- 
														src="${pageContext.request.contextPath }/resources/img/220i0z000000mulfw433F_Z_1080_808_R5_D.jsp"
													 -->
													<img
														src=""
														width="300" height="250">
												</c:when>
												<c:otherwise>
													<!-- 
														src="${pageContext.request.contextPath }/resources/hjy/hotelmain/${vo.amainimg }"
													 -->
													<img src=""
														width="300" height="250">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-md-7">
											<h3>${vo.aname }</h3>
											<small>${vo.aaddress }</small>
											<div id="map${status.index }" style="width: 200px; height: 200px;">
												 지도넣기
												<input type="hidden" id="axcoordi${status.index }" value="${vo.axcoordi }">
												<input type="hidden" id="aycoordi${status.index }" value="${vo.aycoordi }">
											</div>
												<script type="text/javascript">
												mainMapList(${status.index });
												function mainMapList(index){
													var mainmaplist = new Array();
													mainmaplist.push(index);
													if($("#axcoordi"+index).val()*1>100){
												    // point array 1
												    var point1 = [$("#axcoordi"+index).val()*1, $("#aycoordi"+index).val()*1]
												    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs"; // from
												    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
												   
												    // #1. 변환한 위도 경도 값 저장
												    var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
													
													var mainmap = new naver.maps.Map('map'+index, {
													   center: new naver.maps.LatLng(lonAndLat1[1], lonAndLat1[0]),
													    zoom: 15
													});
													
													var testmarker = new naver.maps.Marker({
													    position: new naver.maps.LatLng(lonAndLat1[1],lonAndLat1[0]),
													    map: mainmap
													});
													}
													else{
													//console.log(index,"번째 x"+$("#aycoordi"+index).val())
													//console.log(index,"번째 y"+$("#axcoordi"+index).val())
													var hotelDetailMap = new naver.maps.Map('map'+index, {
													    center: new naver.maps.LatLng($("#aycoordi"+index).val(), $("#axcoordi"+index).val()),
													    zoom: 15
													});
	
												var hotelDetailmarker = new naver.maps.Marker({
												    position: new naver.maps.LatLng($("#aycoordi"+index).val(), $("#axcoordi"+index).val()),
												    map: hotelDetailMap
												});
												}
												}
												</script>
													
											
											
											
											
										</div>
										<div class="col-md-2">
											<h5>${vo.SUM}원</h5>
											<button class="btn"
												onclick="location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID=${vo.aid}&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}'">예약하기</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
	</section>
	<!--cta section-->
	<section class="py-4 bg-orange">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h2>Best Place to Find information</h2>
				</div>
				<div class="col-md-4">
					<buttton type="button" class="btn btn-outline-light">Find
					Out Now</buttton>
				</div>

			</div>
		</div>
	</section>
	<!--footer section-->
	<section class="py-5 bg-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h5>About Us</h5>
					<p>Lorem Ipsum Generator. With our simple and useful tool you
						can generate a standard text which you can place in your web
						design to look more realistic.</p>
				</div>
				<div class="col-md-3">footer two</div>
				<div class="col-md-3">footer three</div>
				<div class="col-md-3">footer four</div>
			</div>
		</div>
	</section>

	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</body>
</html>