<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<!-- 푸터 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css">
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<!-- jquery ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!-- x,y좌표 위도,경도로 바꾸기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>
<!-- 지도추가 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hznya2qvqk&submodules=geocoder"></script>
<!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/firstsearchmain.css">

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">

<style type="text/css">
.bg-orange {
	background: #00AEF0;
	color: #fff !important;
}

body {
	font-family: Brezel Grotesk, Helvetica Neue, Helvetica, Arial,
		sans-serif;
}

img {
	width: 100%;
	max-height: 560px;
}

a {
	color: #696969;
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

.noresult {
	font-family: Brezel Grotesk, Helvetica Neue, Helvetica, Arial,
		sans-serif;
	font-weight: 400;
}

#sort {
	padding: 5px 5px 5px 5px;
	color: #00AEF0;
	border: 1px solid #00AEF0;
	border-radius: 3px;
}

.text-left {
	color: black;
}
</style>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript">
let aname;
function collectInfo(){
	let countRoom=$("#countRoom").val();
	let countPeople=$("#countPeople").val();
	$("#showInfo").val("객실"+countRoom+"인원"+countPeople);
}
$(function(){
	//자동완성 - 지윤
	$("#searchHotel").autocomplete({
		source:function(request,response){
			let aname=$("#searchHotel").val();
			$.ajax({
				type:'get',
				url:"/project/lhjcjy/ajax/auto",
				data:{"aname":aname,"aaddress":aname},
				dataType:"json",
				success:function(data){
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
 	
 	//숙소이름 자동완성 검색에 아무것도 안써져있을때 수행 -지영
 	$("#searchHotelname").focusout(function() {
 		if($(this).val()==""){
 			aname="";
 			callList();
 		}
 	});
 	//숙소이름 자동완성 검색 -지영
	$("#searchHotelname").autocomplete({
		source:function(request,response){
			let aname=$("#searchHotelname").val();
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
			aname =ui.item.value;
			console.log("aname",aname)
			callList();
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
			//if(event.)
			//console.log("event",event)
		}
	}).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
        return $( "<li>" )    //기본 tag가 li로 되어 있음 
        .append( "<div>" + item.value +"</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
        .appendTo( ul );
 	};
 	
 	//즐겨찾기 체크박스 클릭 시 실행되는 ajax -지영
	$("#favorite input").click(function() {
		if("${mid}"=="undifined" || "${mid}"==""){
		console.log(${mid})
        	var confirmcheck=confirm("로그인 하셔야 이용할 수 있는 서비스입니다. 로그인 하시겠습니까?")
        	if(confirmcheck	){
        		alert("로그인창으로 이동합니다.");
        		location.href = "${pageContext.request.contextPath }/jhr/login";
				$(this).prop('checked',false)
        	}else{
				$(this).prop('checked',false)
        	}
        }else{
			callList();
		}
	})
	
	//편의시설 체크박스 클릭 시 실행되는 ajax -지영
	$("#facilities input").click(function() {
 		callList()
	})
		
	//무료시설 체크박스 클릭 시 실행되는 ajax -지영
	$("#forFree input").click(function() {
 		callList()
	})
	
	//거리를 통한 검색의 select옵션이 변경되었을때 실행될 함수 -지영
 	$("#locationamount").change(function() {
 		let grade;
		let star;
		//성급 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#grade"+i).attr('style')=="background-color: #00AEF0"){
 				grade = $("#grade"+i).attr('id')
 				grade = grade.substring(5)
 				break;
 			};
		}
 		//리뷰별점 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#star"+i).attr('style')=="background-color: #00AEF0"){
 				star = $("#star"+i).attr('id')
 				star = star.substring(4)
 				break;
 			};
		}
 		
    	for (var i = 0; i < circle.length; i++) {
	    	circle[i].setMap(null);
	    	circle.shift();
		}
    	let templist= new Array(); 
		checklist(templist)
    	if($(this).val()=="none"){
    		list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
    	}else{
    	makeCircle(locationmap,locationmarker.getPosition(),$(this).val());
		list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$(this).val(),grade,star,aname);
    	}
		
    })
    
	//지도로 보기 클릭시 효과 -지영
	$("#gomap").click(function() {
		let grade;
		let star;
		//성급 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#grade"+i).attr('style')=="background-color: #00AEF0"){
 				grade = $("#grade"+i).attr('id')
 				grade = grade.substring(5)
 				break;
 			};
		}
 		//리뷰별점 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#star"+i).attr('style')=="background-color: #00AEF0"){
 				star = $("#star"+i).attr('id')
 				star = star.substring(4)
 				break;
 			};
		}
	  if($("#gomap").html()=="지도로 보기"){
		  $("#gomap").html("돌아가기")
		  $("#location").attr('class','collapse')
		  $("#list").empty();
		  
		  let html = "<div id='gomapchange' style='width:100%; height:1050px;'></div>";
		  $("#list").append(html);
		  let templist= new Array(); 
		  checklist(templist)
		  gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
		}else{
	    	  $("#gomap").html("지도로 보기")
	    	  $("#location").attr('class','collapse show')
			  $("#list").empty();
	    	  let templist= new Array(); 
			  checklist(templist)
			  if($("#locationamount").val()!="none"){
				  list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val(),grade,star,aname)
			  }else{
				  list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname);
			  }
	  	}
	})
 	
 	//전체 정렬
	$("#sort").change(function(){
		let sort = $(this).val();
		let templist = new Array();
		checklist(templist)
 		callList()
	})
	
   	// 평점 div박스
  	$(".star_section_field").click(function(){
		let restar = $(this).attr("id");
		$(this).siblings().attr('style','background-color: none');
		for (var i =0; i <= 5-restar.substring(4); i++) {
			$("#star"+(Number(restar.substring(4))+i)).attr('style','background-color: #00AEF0');
		}
	 	callList()
	});
   	
	// 성급 div박스
 	$(".grade_section_field").click(function(){
		let agrade = $(this).attr("id");
		$(this).siblings().attr('style','background-color: none');
		for (var i =0; i <= 6-agrade.substring(5); i++) {
			$("#grade"+(Number(agrade.substring(5))+i)).attr('style','background-color: #00AEF0');
		}
		callList();
	});		
  		
  	//슬라이더 관련 실행
	slider(${minmax.minsum},${minmax.maxsum})
    $('#count_min').change(function(){
    	$('#slider').slider('values',0,$(this).val());
   	})
   	$('#count_max').change(function(){
    	$('#slider').slider('values',1,$(this).val());
   	})
});

//가격 range slider -지윤
function slider(minsum,maxsum){
 $('#slider').slider({
     orientation:'horizontal',
      min:Number(minsum),
      max:Number(maxsum),
      step:10000,
      range:true,
      values:[minsum,maxsum],
      create:function(e, ui){ //text 박스에 value값 나타냄
          $('#count_min').val(minsum);
          $('#count_max').val(maxsum);
      },
      change:function(e,ui){ //value 가 change 되었을 때
          $('#count_min').val(ui.values[0]);
          $('#count_max').val(ui.values[1]);
          
  		let minprice=$("#count_min").val();
  		let maxprice=$("#count_max").val();
  		
  		$("#accommList").empty();
  		
  		callList();
      }
      
      
  });
}

//조건에 따른 list내역(지도로보기,리스트보기) 호출을 위한 반복function
function callList(){
	let grade;
	let star;
	let templist= new Array(); 
	checklist(templist);
	//성급 몇인지 뽑아오는부분
		for (var i =1; i <= 5; i++) {
			if($("#grade"+i).attr('style')=="background-color: #00AEF0"){
				grade = $("#grade"+i).attr('id')
				grade = grade.substring(5)
				break;
			};
	}
		//리뷰별점 몇인지 뽑아오는부분
		for (var i =1; i <= 5; i++) {
			if($("#star"+i).attr('style')=="background-color: #00AEF0"){
				star = $("#star"+i).attr('id')
				star = star.substring(4)
				break;
			};
	}
	//인근반경 거리가 상관없음이 아닐때
	if($("#locationamount").val()!="none"){
		//지도로보기로 지도가 펼쳐져 있을때				
	 	if($("#gomap").html()=="돌아가기"){
			gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
		//리스트가 나올때				
	 	}else{
			list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val(),grade,star,aname)
	 	}
	}else{
		if($("#gomap").html()=="돌아가기"){
			gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
	 	}else{
			list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
	 	}
	}
}


//지도로 보기 ajax받아와서 뿌려주기 -지영
function gomapchange(facilities,minprice,maxprice,sort,axcoordi,aycoordi,distance,agrade,restar){
	  let gomapchange = new naver.maps.Map('gomapchange', {
          center: new naver.maps.LatLng(ycoordi, xcoordi),
          zoom: 14
      })
	var latlngs = [];
    var contentString=[];
    var fac = "";
    for (var i = 0; i < facilities.length; i++) {
		fac+=facilities[i];
		if(i !=facilities.length-1){
			fac+=",";
		}
	}
	  $.ajax({
			url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
			 async: false,
			 data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}",
					"fac":fac,"minprice":minprice,"maxprice":maxprice,"sort":sort,"xcoordi":xcoordi,"ycoordi":ycoordi,"distance":distance,"restar":restar,"agrade":agrade,"autoaname":aname},
			type:"get",
			dataType:"json",
			success:function(data){
				if(data.code=='success'){
		        	for (var i = 0; i < data.list.length; i++) {
		        		let star="";
						if(data.list[i].restar == 5){
							star = "★★★★★";
						}else if(data.list[i].restar == 4){
							star="★★★★☆";
						}else if(data.list[i].restar == 3){
							star="★★★☆☆";
						}else if(data.list[i].restar == 2){
							star = "★★☆☆☆";
						}else if(data.list[i].restar == 1){
							star = "★☆☆☆☆";
						}else if(data.list[i].restar == 0){
							star="☆☆☆☆☆";
						}
		        		if(data.list[i].axcoordi>100){
							let listxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi);
							latlngs.push(new naver.maps.LatLng(listxy[0], listxy[1]));
		        		}else{
							latlngs.push(new naver.maps.LatLng(data.list[i].axcoordi, data.list[i].aycoordi));
		        		}
						if(data.list[i].amainimg==null){
							  let html = '<div class="iw_inner" style="padding:3px;">'+'<h5>'+star+'</h5>'+'<h3>'+data.list[i].aname+'</h3>'+'<h5>';
		    		          if(data.list[i].agrade!=null){
			    		          html+=data.list[i].agrade+'성급</h5>'
		    		          }
		    		          html+='<p>'+data.list[i].aaddress
		    		          +'<br> <img src="${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg" width="300" height="250" /><br>'
		    		          +'전화번호: '+data.list[i].aphone+' | 가격: '+data.list[i].amountsum+'원<br/>'
		    		          +"<br><button class='btn btn-outline-primary' onclick=\""
							  +"location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid+
							  +"&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+data.checkin+"&endday="+data.checkout+"'\">예약하기</button>"
							  +'</p></div>'
							contentString.push(html)
					   }else{
						   let html = '<div class="iw_inner"style="padding:3px;">'+'<h5>'+star+'</h5>'+'<h3>'+data.list[i].aname+'</h3>'+'<h5>';
						   if(data.list[i].agrade!=null){
			    		          html+=data.list[i].agrade+'성급</h5>'
		    		          }
						   html+='<p>'+data.list[i].aaddress
		    		          +'<br /> <img src="${pageContext.request.contextPath }/resources/images/accommodations/'+data.list[i].amainimg+'"width="300" height="250"/><br />'
		    		          +'<br>전화번호: '+data.list[i].aphone+' <br><br> 가격: '+data.list[i].amountsum+'원<br/>'
		    		          +"<br><button class='btn btn-outline-primary' onclick=\""
							  +"location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid+
							  +"&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+data.checkin+"&endday="+data.checkout
							  +"'\">예약하기</button>"
							  +'</p></div>'
						   contentString.push(html)
						   }
    		        	}
					}
				}
		  })	

		  var markerList = [];
		  for (var i=0, ii=latlngs.length; i<ii; i++) {
	          let marker = new naver.maps.Marker({
	              position: latlngs[i],
	              map: gomapchange
	          });
	          marker.set('seq', i);
	          
		      markerList.push(marker);
		      
		      marker.addListener('click', marckerClick);
		      
		      marker = null;
	  }

	  function marckerClick(e){
		  var marker = e.overlay;
	      seq = marker.get('seq');
	      var infowindow = new naver.maps.InfoWindow({
		      content: contentString[seq],
		      maxWidth: 200,
		      backgroundColor: "#eee",
		      borderColor: "#00AEF0",
		      borderWidth: 5,
		      anchorSize: new naver.maps.Size(30, 30),
		      anchorSkew: true,
		      anchorColor: "#eee",
		      pixelOffset: new naver.maps.Point(20, -20)
		  	});
	      
		  if (infowindow.getMap()) {
	          infowindow.close();
	      } else {
	          infowindow.open(gomapchange, marker);
	      }
	  }  
 }

//선호호텔체인,부대시설,무료시설 체크박스 선택되어있는지 체크해주는 function -지영
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
	$("#favorite input").each(function(){
		if( $(this).is(":checked") == true ){
	      	var temId = $(this).attr('id');
	      	templist.push(temId);
		}
		});
}

//좌표(X,Y) 위도경도로 변환함수 -지영
function changeXY(xcoordi,ycoordi){
	let xy=[];
	if(xcoordi*1>100){
		// point array 1
	    var point1 = [xcoordi*1, ycoordi*1]
	    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs"; // from
	    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
	   
	    // #1. 변환한 위도 경도 값 저장
	    var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
		xy.push(lonAndLat1[1])
		xy.push(lonAndLat1[0])
		console.log('변환계 사용')
	}else{
		xy.push(xcoordi)
		xy.push(ycoordi)
		console.log('변환계 사용안함')
	}
	return xy;
}

//위도 경도를 통해 거리 구하는 함수 -지영
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

//위의 검색조건,왼쪽 검색조건에 맞는 list뽑아주기 ajax
function list(facilities,minprice,maxprice,sort,xcoordi,ycoordi,distance,agrade,restar){
	let changecnt=0;
   $.ajax({
		url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
		traditional :true,
		data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}",
			"facilities":facilities,"minprice":minprice,"maxprice":maxprice,"sort":sort,"xcoordi":xcoordi,"ycoordi":ycoordi,"distance":distance,"restar":restar,"agrade":agrade,"autoaname":aname},
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.code=='success'){
			   $("#list").empty();
			   if(data.list.length==0){
				   $("#list").html("<div style='text-align: center;'><img style='width:200px;height:200px;'src = 'https://content.r9cdn.net/res/images/horizon/hotels/results/brands/hotelscombined/max-magnifying-glass.png?v=2ce4b5af1d8bd19e6264dabe7ceb3c51793b5f87&cluster=5'><br><Br><h3>조건에 맞는 호텔이 없습니다</h3></div>");
			   }else{
				   for (var i = 0; i < data.list.length; i++) {
					   let html = "";
					   //xcoordi값이 있을때
					   if(xcoordi){
						   	let testxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi)
						   //기준좌표
						   	let refcoordi = [xcoordi, ycoordi];
						   //db에서 불러온 좌표
							dbcoordi = [testxy[0],testxy[1]];
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
										html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg' width='300' height='250'>";
									}else{
										html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/"+data.list[i].amainimg+"'width='300' height='250'>";
									}
									html+="</div>";
									html+="<div class='col-md-6'>";
									html+="<h3>"+data.list[i].aname+"</h3>";
									html+="<small>"+data.list[i].aaddress+"</small>";
									html+="<div id='map"+changecnt+"' style='width: 200px; height: 200px;'>지도넣기"
									html+="<input type='hidden' id='axcoordi"+changecnt+"' value="+data.list[i].axcoordi+">";
									html+="<input type='hidden' id='aycoordi"+changecnt+"' value="+data.list[i].aycoordi+">";
									html+="</div>";
									html+="</div>";
									html+="<div class='col-md-3' style='padding-left: 70px;'>";
									if(data.list[i].agrade !=null){
										html+="<h5>"+data.list[i].agrade+"성급</h5>";
									}
									html+="<h5>";
									if(data.list[i].restar==5){
										html+="★★★★★";
									}else if(data.list[i].restar==4){
										html+="★★★★☆";
									}else if(data.list[i].restar==3){
										html+="★★★☆☆";
									}else if(data.list[i].restar==2){
										html+="★★☆☆☆";
									}else if(data.list[i].restar==1){
										html+="★☆☆☆☆";
									}else{
										html+="☆☆☆☆☆";
									}
									html+="</h5>";
									html+="<h4>"+data.list[i].amountsum+"원</h4>";
									html+="<button class='btn btn-outline-primary' onclick=\"";
									html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid+
											+"&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}"
									html+="'\">예약하기</button>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									changecnt++;
							   }
				   			}else{
								html+="<div class='row mb-3'>";
								html+="<div class='col-md-12'>";
								html+="<div class='card'>";
								html+="<div class='card-body'>";
								html+="<div class='row'>";
								html+="<div class='col-md-3'>";
								if(data.list[i].amainimg==null){
									html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg' width='300' height='250'>";
								}else{
									html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/"+data.list[i].amainimg+"'width='300' height='250'>";
								}
								html+="</div>";
								html+="<div class='col-md-6'>";
								html+="<h3>"+data.list[i].aname+"</h3>";
								html+="<small>"+data.list[i].aaddress+"</small>";
								html+="<div id='map"+i+"' style='width: 200px; height: 200px;'>지도넣기"
								html+="<input type='hidden' id='axcoordi"+i+"' value="+data.list[i].axcoordi+">";
								html+="<input type='hidden' id='aycoordi"+i+"' value="+data.list[i].aycoordi+">";
								html+="</div>";
								html+="</div>";
								html+="<div class='col-md-3'style='padding-left: 70px;'>";
								if(data.list[i].agrade !=null){
									html+="<h5>"+data.list[i].agrade+"성급</h5>";
								}
								html+="<h5>"
								if(data.list[i].restar==5){
									html+="★★★★★"
								}else if(data.list[i].restar==4){
									html+="★★★★☆"
								}else if(data.list[i].restar==3){
									html+="★★★☆☆"
								}else if(data.list[i].restar==2){
									html+="★★☆☆☆"
								}else if(data.list[i].restar==1){
									html+="★☆☆☆☆"
								}else{
									html+="☆☆☆☆☆"
								}
								html+="</h5>"
								html+="<h4>"+data.list[i].amountsum+"원</h4>";
								html+="<button class='btn btn-outline-primary' onclick=\"";
								html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid;
								html+="&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}"
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
			   }
				    if(changecnt!=0){
					    for (var i = 0; i < changecnt; i++) {
					  		mainMapList(i);
					   	}
					}else{
						for (var i = 0; i < data.list.length; i++) {
						    mainMapList(i);
						}
				   	}
				}else{
					alert("fail")
				}
			}
		})
	}

//db에 받아온 주소를 좌표로 변환해서 xcoordi, ycoordi에 저장하기+왼쪽 거리검색의 센터를 해당 좌표로 지정 -지영
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
/*
	  if (response.v2.meta.totalCount === 0) {
	    return alert('검색결과가 없습니다.');
	  }
*/
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

//찍힌 좌표와 선택한 반경에 따라 원 그려주기 -지영
function makeCircle(locationmap,locationposition,size){
circle.push(
	new naver.maps.Circle({
        map: locationmap,
        center: locationposition,
        radius: size,//m단위의 반지름 입력
        fillColor: 'crimson',
        fillOpacity: 0.8
    })
);
}

//리스트에 호텔 위치에 맞는 지도 표시하기 -지영
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
		var hotelDetailMap = new naver.maps.Map('map'+index, {
		    center: new naver.maps.LatLng($("#axcoordi"+index).val(), $("#aycoordi"+index).val()),
		    zoom: 15
		});
	
		var hotelDetailmarker = new naver.maps.Marker({
		    position: new naver.maps.LatLng($("#axcoordi"+index).val(), $("#aycoordi"+index).val()),
		    map: hotelDetailMap
		});
	}
}
//체크인 날짜이동
function inMoveBefore(){ //버튼 클릭시 하루 전날로 이동
	let date = new Date($("#checkin").val());
	//console.log(date);
	let year = date.getFullYear();
	let month = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let day = (date.getDate()-1) > 9 ? (date.getDate()-1) : '0' + (date.getDate()-1);
	//console.log(year + month + day);
	$("#checkin").val(year + "-" + month + "-" + day);	
}
function inMoveAfter(){ //버튼 클릭시 다음날로 이동
	let date = new Date($("#checkin").val());
	//console.log(date);
	let iyear = date.getFullYear();
	let imonth = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let idate = (date.getDate()+1) > 9 ? (date.getDate()+1) : '0' + (date.getDate()+1);
	//console.log(ye + mo + da);
	$("#checkin").val(iyear + "-" + imonth + "-" + idate);	
}
//체크아웃 날짜이동
function outMoveBefore(){ //버튼 클릭시 하루 전날로 이동
	let date = new Date($("#checkout").val());
	let year = date.getFullYear();
	let month = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let day = (date.getDate()-1) > 9 ? (date.getDate()-1) : '0' + (date.getDate()-1);
	$("#checkout").val(year + "-" + month + "-" + day);	
}

function outMoveAfter(){ //버튼 클릭시 다음날로 이동
	let date = new Date($("#checkout").val());
	//console.log(date);
	let oyear = date.getFullYear();
	let omonth = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let odate = (date.getDate()+1) > 9 ? (date.getDate()+1) : '0' + (date.getDate()+1);
	//console.log(oyear + omonth + odate);
	$("#checkout").val(oyear + "-" + omonth + "-" + odate);
}
</script>
</head>
<body>
	<!--header section-->
	<div class="header">
		<div class="header_container">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/" class="logo_container">
					<div class="logo_img">
						<svg class="svg_image" viewBox="0 0 190 24">
						<g fill="none">
							<path fill="#2C4162"
								d="M29.207 23.715V5.735h3.533v7.282h5.574V5.736h3.533v17.939h-3.533v-7.363H32.74v7.363h-3.533zm14.681-5.939c0-3.58 1.885-6.752 5.536-6.752 3.65 0 5.535 3.173 5.535 6.752 0 3.336-1.688 6.183-5.535 6.183-3.848 0-5.536-2.847-5.536-6.183zm3.259-.04c0 2.237.706 3.132 2.277 3.132 1.57 0 2.276-.854 2.276-3.092 0-2.156-.588-3.58-2.276-3.58-1.688-.04-2.277 1.384-2.277 3.54zm9.735-3.58h-1.57v-2.888h1.57v-2.97h3.023v2.97h3.258v2.888h-3.258v4.515c0 1.993.078 2.36.667 2.36.393 0 .51-.204.51-.651 0-.244-.078-.448-.078-.448h2.238s.157.448.157 1.099c0 2.033-1.374 2.928-3.062 2.928-2.356 0-3.494-1.26-3.494-4.108v-5.695h.04zm14.525 5.858c0-.204-.04-.367-.04-.367h2.513s.196.407.196 1.058c0 2.36-2.316 3.295-4.2 3.295-3.808 0-5.653-2.644-5.653-6.224 0-3.539 1.688-6.712 5.457-6.712 2.826 0 4.593 2.034 4.593 4.76a9.467 9.467 0 01-.354 2.522h-6.712c.039 1.87.903 2.888 2.63 2.888 1.256-.04 1.57-.732 1.57-1.22zm-4.083-4.068h4.083c.118-.773-.157-2.115-1.924-2.115-1.727 0-2.159 1.464-2.159 2.115zm8.755 7.769V5.776h3.1v17.94h-3.1zm4.946-3.254c0-.773.314-1.342.314-1.342h2.826s-.157.325-.157.813c0 .854.707 1.261 1.767 1.261 1.02 0 1.649-.407 1.649-1.057 0-.855-.786-1.14-2.12-1.505-1.885-.489-4.044-.936-4.044-3.702 0-2.522 1.806-3.865 4.397-3.865 2.238 0 4.318 1.099 4.318 3.336 0 .65-.196 1.18-.196 1.18h-2.827s.118-.326.118-.651c0-.692-.589-1.098-1.374-1.098-1.099 0-1.57.488-1.57 1.016 0 .651.707.977 2.08 1.302 1.885.448 4.123.976 4.123 3.824 0 2.685-1.806 4.027-4.633 4.027-2.944-.04-4.671-1.464-4.671-3.539z"
								style="user-select: auto;"></path>
							<path
								d="M91.899 15.254c0-5.207 2.826-9.478 7.615-9.478 3.77 0 5.653 2.238 5.653 4.882 0 1.098-.235 1.749-.235 1.749h-2.984s.079-.285.079-.936c0-1.302-.785-2.278-2.552-2.278-2.787 0-4.082 2.482-4.082 6.02 0 2.889.981 5.33 4.004 5.33 1.334 0 2.59-.692 2.59-2.645 0-.366-.078-.691-.078-.691h3.023s.196.57.196 1.383c0 3.824-3.023 5.37-5.888 5.37-5.535 0-7.341-3.987-7.341-8.706zm15.153 2.522c0-3.58 1.884-6.752 5.535-6.752 3.65 0 5.535 3.173 5.535 6.752 0 3.336-1.688 6.183-5.535 6.183-3.847 0-5.535-2.847-5.535-6.183zm3.258-.04c0 2.237.707 3.132 2.277 3.132 1.57 0 2.277-.854 2.277-3.092 0-2.156-.59-3.58-2.277-3.58-1.688-.04-2.277 1.384-2.277 3.54zm18.097-5.004c.628-.935 1.649-1.708 3.023-1.708 2.63 0 4.122 1.952 4.122 4.881v7.81l-3.102-.04v-7.2c0-1.587-.55-2.32-1.57-2.32s-1.57.937-1.57 2.279v7.281h-3.101v-7.24c0-1.587-.55-2.32-1.65-2.32-1.059 0-1.609.937-1.609 2.157v7.403h-3.1V11.268h2.983v1.18h.039c.314-.489 1.217-1.424 2.67-1.424 1.413 0 2.394.773 2.865 1.708zm9.186-6.996h3.101v6.345h.04c.588-.61 1.53-1.057 2.63-1.057 3.376 0 4.907 3.01 4.907 6.549 0 3.458-1.57 6.386-4.947 6.386-1.177 0-2.198-.61-2.748-1.342h-.039v1.098h-2.983V5.735h.039zm3.14 12c0 1.586.55 3.172 2.277 3.172 1.531 0 2.277-1.505 2.277-3.091 0-1.953-.51-3.661-2.277-3.661-1.688-.04-2.277 1.79-2.277 3.58zm11.267-12c1.1 0 1.963.895 1.963 2.033 0 1.14-.864 2.034-1.963 2.034-1.1 0-1.963-.895-1.963-2.034.04-1.098.903-2.033 1.963-2.033zm-1.531 5.532h3.101v12.447h-3.101zm8.951 12.447h-3.102V11.268h3.101v1.22h.04c.51-.691 1.334-1.464 2.944-1.464 2.277 0 3.808 1.952 3.808 4.434v8.217h-3.18V16.27c0-1.342-.628-2.156-1.688-2.156-.903 0-1.963.407-1.963 2.563v7.037h.04zm15.466-3.701c0-.204-.039-.367-.039-.367h2.513s.196.407.196 1.058c0 2.36-2.316 3.295-4.2 3.295-3.808 0-5.654-2.644-5.654-6.224 0-3.539 1.688-6.712 5.457-6.712 2.787 0 4.593 2.034 4.593 4.76 0 1.383-.353 2.522-.353 2.522h-6.713c.04 1.87.903 2.888 2.63 2.888 1.256-.04 1.57-.732 1.57-1.22zm-4.082-4.068h4.082c.118-.773-.157-2.115-1.923-2.115-1.727 0-2.16 1.464-2.16 2.115zm18.843 7.769h-2.866v-1.057h-.04c-.47.61-1.57 1.301-2.865 1.301-2.277 0-4.71-1.912-4.71-6.508 0-3.824 2.001-6.427 4.553-6.427 1.335 0 2.238.447 2.787 1.057h.04V5.776h3.1v17.94zm-7.577-5.98c0 2.238 1.139 3.133 2.395 3.133s2.237-1.099 2.237-3.092c0-2.4-.902-3.62-2.237-3.62-1.492 0-2.395 1.22-2.395 3.58zm-158.399.489c0-3.905-.55-9.438-1.216-12.448-.275-1.22-.825-2.115-1.728-2.766A4.641 4.641 0 0019 2.156c-.04 0-.079-.04-.118-.04-2.355-.774-4.553-1.14-6.83-1.1-2.277-.04-4.476.286-6.83 1.1-.04 0-.08.04-.119.04a6.285 6.285 0 00-1.727.854c-.903.651-1.452 1.546-1.727 2.766C.98 8.786.432 14.32.432 18.224c0 1.017.04 1.912.118 2.644.078.813.235 1.424.47 1.668.354.447.904 1.18 3.18 1.18h15.703c2.277 0 2.787-.733 3.18-1.18.235-.244.353-.855.47-1.668.118-.732.158-1.627.118-2.644z"
								fill="#FFF" style="user-select: auto;"></path>
							<path
								d="M3.023 5.573c-1.492 0-2.67-1.261-2.67-2.766C.353 1.26 1.57.04 3.023.04c1.491 0 2.67 1.26 2.67 2.766 0 1.505-1.179 2.766-2.67 2.766m18.137.001c-1.493 0-2.67-1.261-2.67-2.766C18.49 1.26 19.707.04 21.16.04c1.49 0 2.669 1.26 2.669 2.766 0 1.505-1.217 2.766-2.67 2.766"
								fill="#FFF" style="user-select: auto;"></path>
							<path
								d="M4.79 10.129c-.04.122-.04.285-.04.407.04.854.707 1.545 1.531 1.586.903.04 1.649-.732 1.649-1.627 0-.122 0-.244-.04-.366 0-.082-.117-.163-.196-.163H4.986c-.079 0-.157.04-.197.163m10.913 0c-.039.122-.039.285-.039.407.04.854.707 1.545 1.531 1.586.903.04 1.649-.732 1.649-1.627 0-.122 0-.244-.04-.366-.039-.082-.117-.163-.196-.163H15.9c-.118 0-.197.04-.197.163"
								fill="#2C4162" style="user-select: auto;"></path>
							<path
								d="M16.134 17.492c0-.082.04-.123.04-.204v-.366c0-1.424-.629-5.207-1.021-6.671-.04-.163-.157-.244-.353-.285H8.793c-.196.04-.314.163-.353.285-.353 1.464-1.02 5.207-1.02 6.671v.325c0 .936 1.962 2.075 4.357 2.075 2.198 0 4.004-.936 4.318-1.83 0 .04 0 0 .04 0z"
								fill="#00AEF0" style="user-select: auto;"></path>
							<path
								d="M14.8 9.966H8.793c-.235.04-.353.203-.353.366 0 .082 0 .163.04.204.196.447.392.895.667 1.342.432.732.903 1.424 1.57 2.075.196.203.432.447.667.65a.715.715 0 00.432.163c.157 0 .314-.04.432-.163.235-.203.432-.406.667-.65.668-.651 1.139-1.343 1.57-2.075.236-.407.472-.854.668-1.342.04-.082.04-.163.04-.204a.47.47 0 00-.393-.366z"
								fill="#2C4162" style="user-select: auto;"></path>
						</g>
					</svg>
					</div>
				</a>
			</div>
			<div class="nav">
				<ul class="nav_menu">
					<li><a class="nav_hotel"><span>호텔</span></a></li>
					<li><a><span>항공권</span></a></li>
					<li><a><span>렌터카</span></a></li>
					<li><a><span>액티비티</span></a></li>
					<li><a><span>이벤트</span></a></li>
				</ul>
				<div class="nav_account">
					<div class="nav_account_container">
						<div class="nav_mypage">
							<c:choose>
								<c:when test="${empty sessionScope.mid }">
									<!-- 로그인이 안되어있을때 -->
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath }/user/kjy/mypage">마이트립</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="nav_login">
							<c:choose>
								<c:when test="${empty mid }">
									<a href="${pageContext.request.contextPath }/jhr/login">로그인</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath }/jhr/logout">로그아웃</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--filter section-->
	<div style='position: absolute; left: 50%; margin-left: -765px;'>
		<div class="search">
			<div class="search_container">
				<form class="search_content" style='width: 1150px;' method="post"
					action="${pageContext.request.contextPath }/lhjcjyhjy/firstsearch">
					<div class="search_insert">
						<div class="search_insert_container">
							<div class="search_insert_content">
								<div class="search_insert_city">
									<div class="search_city_display">
										<svg viewBox="0 0 20 21">
												<path fill-rule="evenodd" clip-rule="evenodd"
												d="M8.31529 16.2594C4.18311 16.2594 0.833313 12.9096 0.833313 8.77745C0.833313 4.64527 4.18311 1.29547 8.31529 1.29547C12.4475 1.29547 15.7973 4.64527 15.7973 8.77745C15.7973 10.5759 15.1628 12.2261 14.1054 13.5165L18.949 18.36C19.2392 18.6503 19.2392 19.1209 18.949 19.4111C18.6587 19.7014 18.1881 19.7014 17.8979 19.4111L13.0543 14.5676C11.7639 15.6249 10.1137 16.2594 8.31529 16.2594ZM12.5286 13.0429C11.4458 14.1126 9.95766 14.7729 8.31529 14.7729C5.00407 14.7729 2.3198 12.0887 2.3198 8.77745C2.3198 5.46623 5.00407 2.78195 8.31529 2.78195C11.6265 2.78195 14.3108 5.46623 14.3108 8.77745C14.3108 10.4198 13.6504 11.908 12.5807 12.9908C12.5716 12.999 12.5628 13.0075 12.554 13.0162C12.5453 13.0249 12.5368 13.0338 12.5286 13.0429Z"
												fill="#4E4E4E"></path>
											</svg>
										<div class="city_text_wrap">
											<div class="city_text">
												<input type="text" id="searchHotel" name="searchHotel"
													value="${aaddress }" />
											</div>
										</div>
									</div>
								</div>
								<div class="search_insert_date">
									<div class="search_date_display">
										<div class="date_check">
											<div class="date_text">
												<svg viewBox="0 0 20 21">
														<path fill-rule="evenodd" clip-rule="evenodd"
														d="M14.5952 3.67643H18.381C18.8149 3.67643 19.1667 4.04952 19.1667 4.50976V7.68436V18.7955C19.1667 19.2557 18.8149 19.6288 18.381 19.6288H1.61905C1.18511 19.6288 0.833333 19.2557 0.833333 18.7955V7.68436V4.50976C0.833333 4.04952 1.18511 3.67643 1.61905 3.67643H5.40476V2.1288C5.40476 1.66857 5.75654 1.29547 6.19048 1.29547C6.62441 1.29547 6.97619 1.66857 6.97619 2.1288V3.67643H13.0238V2.1288C13.0238 1.66857 13.3756 1.29547 13.8095 1.29547C14.2435 1.29547 14.5952 1.66857 14.5952 2.1288V3.67643ZM2.40476 8.51769V17.9621H17.5952V8.51769H2.40476ZM17.5952 6.85102H2.40476V5.34309H17.5952V6.85102ZM4.66667 10.0256H6.19048C6.62441 10.0256 6.97619 10.3987 6.97619 10.859V11.6526C6.97619 12.1129 6.62441 12.4859 6.19048 12.4859H4.66667C4.23273 12.4859 3.88095 12.1129 3.88095 11.6526V10.859C3.88095 10.3987 4.23273 10.0256 4.66667 10.0256ZM9.2381 10.0256H10.7619C11.1958 10.0256 11.5476 10.3987 11.5476 10.859V11.6526C11.5476 12.1129 11.1958 12.4859 10.7619 12.4859H9.2381C8.80416 12.4859 8.45238 12.1129 8.45238 11.6526V10.859C8.45238 10.3987 8.80416 10.0256 9.2381 10.0256ZM6.97619 14.8272C6.97619 14.367 6.62441 13.9939 6.19048 13.9939H4.66667C4.23273 13.9939 3.88095 14.367 3.88095 14.8272V15.6209C3.88095 16.0811 4.23273 16.4542 4.66667 16.4542H6.19048C6.62441 16.4542 6.97619 16.0811 6.97619 15.6209V14.8272ZM10.7619 13.9939C11.1958 13.9939 11.5476 14.367 11.5476 14.8272V15.6209C11.5476 16.0811 11.1958 16.4542 10.7619 16.4542H9.2381C8.80416 16.4542 8.45238 16.0811 8.45238 15.6209V14.8272C8.45238 14.367 8.80416 13.9939 9.2381 13.9939H10.7619ZM15.3333 10.0256H13.8095C13.3756 10.0256 13.0238 10.3987 13.0238 10.859V11.6526C13.0238 12.1129 13.3756 12.4859 13.8095 12.4859H15.3333C15.7673 12.4859 16.119 12.1129 16.119 11.6526V10.859C16.119 10.3987 15.7673 10.0256 15.3333 10.0256Z"
														fill="#4E4E4E"></path>
													</svg>
												<div class="date_innertext">
													<input type="date" id="checkin" name="checkin"
														value="${rcheckin }">
												</div>
											</div>
											<button class="date_btn_before" type="button"
												onclick="inMoveBefore()">
												<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
														fill="none" style="user-select: auto;"></path>
													</svg>
											</button>
											<button class="date_btn_after" type="button"
												onclick="inMoveAfter()">
												<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
														fill="none" style="user-select: auto;"></path>
													</svg>
											</button>
										</div>
										<div class="date_sep"></div>
										<div class="date_check">
											<div class="date_text">
												<svg viewBox="0 0 20 21">
														<path fill-rule="evenodd" clip-rule="evenodd"
														d="M14.5952 3.67643H18.381C18.8149 3.67643 19.1667 4.04952 19.1667 4.50976V7.68436V18.7955C19.1667 19.2557 18.8149 19.6288 18.381 19.6288H1.61905C1.18511 19.6288 0.833333 19.2557 0.833333 18.7955V7.68436V4.50976C0.833333 4.04952 1.18511 3.67643 1.61905 3.67643H5.40476V2.1288C5.40476 1.66857 5.75654 1.29547 6.19048 1.29547C6.62441 1.29547 6.97619 1.66857 6.97619 2.1288V3.67643H13.0238V2.1288C13.0238 1.66857 13.3756 1.29547 13.8095 1.29547C14.2435 1.29547 14.5952 1.66857 14.5952 2.1288V3.67643ZM2.40476 8.51769V17.9621H17.5952V8.51769H2.40476ZM17.5952 6.85102H2.40476V5.34309H17.5952V6.85102ZM4.66667 10.0256H6.19048C6.62441 10.0256 6.97619 10.3987 6.97619 10.859V11.6526C6.97619 12.1129 6.62441 12.4859 6.19048 12.4859H4.66667C4.23273 12.4859 3.88095 12.1129 3.88095 11.6526V10.859C3.88095 10.3987 4.23273 10.0256 4.66667 10.0256ZM9.2381 10.0256H10.7619C11.1958 10.0256 11.5476 10.3987 11.5476 10.859V11.6526C11.5476 12.1129 11.1958 12.4859 10.7619 12.4859H9.2381C8.80416 12.4859 8.45238 12.1129 8.45238 11.6526V10.859C8.45238 10.3987 8.80416 10.0256 9.2381 10.0256ZM6.97619 14.8272C6.97619 14.367 6.62441 13.9939 6.19048 13.9939H4.66667C4.23273 13.9939 3.88095 14.367 3.88095 14.8272V15.6209C3.88095 16.0811 4.23273 16.4542 4.66667 16.4542H6.19048C6.62441 16.4542 6.97619 16.0811 6.97619 15.6209V14.8272ZM10.7619 13.9939C11.1958 13.9939 11.5476 14.367 11.5476 14.8272V15.6209C11.5476 16.0811 11.1958 16.4542 10.7619 16.4542H9.2381C8.80416 16.4542 8.45238 16.0811 8.45238 15.6209V14.8272C8.45238 14.367 8.80416 13.9939 9.2381 13.9939H10.7619ZM15.3333 10.0256H13.8095C13.3756 10.0256 13.0238 10.3987 13.0238 10.859V11.6526C13.0238 12.1129 13.3756 12.4859 13.8095 12.4859H15.3333C15.7673 12.4859 16.119 12.1129 16.119 11.6526V10.859C16.119 10.3987 15.7673 10.0256 15.3333 10.0256Z"
														fill="#4E4E4E"></path>
													</svg>
												<div class="date_innertext">
													<input type="date" id="checkout" name="checkout"
														value="${rcheckout }">
												</div>
											</div>
											<button class="date_btn_before" type="button"
												onclick="outMoveBefore()">
												<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
														fill="none" style="user-select: auto;"></path>
													</svg>
											</button>
											<button class="date_btn_after" type="button"
												onclick="outMoveAfter()">
												<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
														fill="none" style="user-select: auto;"></path>
													</svg>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="search_insert_countRoom">
								<div class="search_room_display">
									<svg viewBox="0 0 200 200">
				                           <path
											d="M160.6 180H39.4c-1.6 0-3.2-.8-4.1-2.1c-8-11.5-6.8-32.8 2.2-41.5c3.9-3.8 23.8-10.5 35.6-14C58.8 108.1 50 95.4 50 70.9C50 38.6 68.2 20 100 20s50 18.6 50 50.9c0 23.8-8.2 36.7-23.1 51.5c11.8 3.5 31.6 10.2 35.6 14c9.1 8.7 10.3 30 2.3 41.5c-1 1.3-2.6 2.1-4.2 2.1zM42.3 170h115.5c4-8.3 2.4-21.8-2.1-26.3c-3.6-2.8-31.2-12.1-38.9-13.8c-3.5-.8-5.1-4.9-3-7.8c7.9-10.8 26.3-19.2 26.3-51.2c0-18.7-6.9-40.9-40-40.9S60 52.2 60 70.9c0 31.9 18.4 40.3 26.3 51.2c2.1 2.9.5 7.1-3 7.8c-7.7 1.6-35.3 10.9-38.9 13.7c-4.6 4.5-6.1 18.1-2.1 26.4zm2.2-26.4z" />
				                        </svg>
									<div class="room_text_wrap">
										<div class="room_text">
											<!--  
												<div id="content_bt">
											    	<input type="button" onclick="showID('content');" id="ttt" value="인원수,객실수">
											        <div id="content" style="display:none;">
													   인원수 <input type="number" min="1" id="countPeople"><br>
												       객실수 <input type="number" min="1" id="countRoom">
											    	</div>
											    </div>								    	 
										   		-->
											<input type="number" min="1" id="countRoom" name="countRoom"
												value="${countRoom }" />
										</div>
									</div>
								</div>
							</div>
							<div class="search_insert_countPeople">
								<div class="search_people_display">
									<svg viewBox="0 0 200 200">
				                           <path
											d="M160.6 180H39.4c-1.6 0-3.2-.8-4.1-2.1c-8-11.5-6.8-32.8 2.2-41.5c3.9-3.8 23.8-10.5 35.6-14C58.8 108.1 50 95.4 50 70.9C50 38.6 68.2 20 100 20s50 18.6 50 50.9c0 23.8-8.2 36.7-23.1 51.5c11.8 3.5 31.6 10.2 35.6 14c9.1 8.7 10.3 30 2.3 41.5c-1 1.3-2.6 2.1-4.2 2.1zM42.3 170h115.5c4-8.3 2.4-21.8-2.1-26.3c-3.6-2.8-31.2-12.1-38.9-13.8c-3.5-.8-5.1-4.9-3-7.8c7.9-10.8 26.3-19.2 26.3-51.2c0-18.7-6.9-40.9-40-40.9S60 52.2 60 70.9c0 31.9 18.4 40.3 26.3 51.2c2.1 2.9.5 7.1-3 7.8c-7.7 1.6-35.3 10.9-38.9 13.7c-4.6 4.5-6.1 18.1-2.1 26.4zm2.2-26.4z" />
				                        </svg>
									<div class="people_text_wrap">
										<div class="people_text">
											<input type="number" min="1" id="countPeople"
												name="countPeople" value="${rimaxper }" />
										</div>
									</div>
								</div>
							</div>
							<div class="search_insert_button_container">
								<button class="search_insert_button" type="submit" id="search">
									<span class="search_icon_container"> <span
										class="search_icon"> <svg viewBox="0 0 92 92">
													<path
													d="M20.8 39.27c0-11.016 8.808-19.976 19.637-19.976 10.827 0 19.635 8.96 19.635 19.972 0 11.014-8.808 19.976-19.635 19.976-10.83 0-19.64-8.96-19.64-19.976zm55.472 32.037l-15.976-16.25c3.357-4.363 5.376-9.835 5.376-15.788 0-14.16-11.32-25.67-25.232-25.67-13.923 0-25.24 11.51-25.24 25.67s11.32 25.67 25.237 25.67c4.776 0 9.227-1.388 13.04-3.74L69.84 77.85c1.77 1.8 4.664 1.8 6.432 0 1.77-1.8 1.77-4.744 0-6.544z"
													fill="currentColor" style="user-select: auto;"></path>
												</svg>
									</span>
									</span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!--main content section-->
	<section class="mb-5">
		<div class="container">
			<div class="row title py-3">
				<div class="col-md-12">
					<h5>
						<strong>검색결과</strong>
					</h5>
					<select name="sort" id="sort">
						<option value="all">전체</option>
						<option value="price_low">가격(낮은순)</option>
						<option value="price_high">가격(높은순)</option>
						<option value="star">평점</option>
					</select>
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
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse" data-target="#mapshow"
												aria-expanded="true">지도</button>
										</h2>
									</div>
									<div id="mapshow" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li>
													<button id="gomap" class="btn btn-outline-primary">지도로 보기</button>
												</li>
											</ul>
										</div>

									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse" data-target="#favorite"
												aria-expanded="true">즐겨찾기</button>
										</h2>
									</div>
									<div id="favorite" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li><input type="checkbox" id="즐겨찾기">즐겨찾기
													선호호텔체인</li>
											</ul>
										</div>
									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#hotelGrades" aria-expanded="true">
												호텔등급</button>
										</h2>
									</div>
									<div id="hotelGrades" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li>
													<div class="grade_section" style='padding-left: 20px;'>
														<div class="grade_section_field" id="grade1">1+</div>
														<div class="grade_section_field" id="grade2">2+</div>
														<div class="grade_section_field" id="grade3">3+</div>
														<div class="grade_section_field" id="grade4">4+</div>
														<div class="grade_section_field" id="grade5">5</div>
													</div>
													<br>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#costomgrade" aria-expanded="true">
												고객평점</button>
										</h2>
									</div>
									<div id="costomgrade" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li>
													<div class="star_section"  style='padding-left: 20px;'>
														<div class="star_section_field" id="star1">1+</div>
														<div class="star_section_field" id="star2">2+</div>
														<div class="star_section_field" id="star3">3+</div>
														<div class="star_section_field" id="star4">4+</div>
														<div class="star_section_field" id="star5">5</div>
													</div>
													<br>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse" data-target="#price"
												aria-expanded="true">가격</button>
										</h2>
									</div>
									<div id="price" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li>
													<form>
														<div style='text-align: center;'>
															<input id="count_min" type="text" size="10"
															class="price-range-field" /> ~ <input id="count_max"
															type="text" size="10" class="price-range-field" />
														</div>
															<br>
														<div id="slider"></div>
													</form>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse" data-target="#forFree"
												aria-expanded="true">무료제공</button>
										</h2>
									</div>
									<div id="forFree" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li><input type="checkbox" id="조식포함">조식포함</li>
												<li><input type="checkbox" id="무료주차">무료주차</li>
											</ul>
										</div>
									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#AccommodationName" aria-expanded="true">
												숙소명</button>
										</h2>
									</div>
									<div id="AccommodationName" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li><input type="text" placeholder="숙소명"
													id="searchHotelname"></li>
											</ul>
										</div>
									</div>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse" data-target="#location"
												aria-expanded="true">위치</button>
										</h2>
									</div>
									<div id="location" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li>
													<div id="locationmap" style="width: 100%; height: 300px;"></div>
												</li><br>
												<li style='text-align: center;'>인근반경</li><br>
												<li style='text-align: center;'><select id="locationamount">
														<option value="none">거리 상관없음</option>
														<option value="500">0.5km</option>
														<option value="1000">1km</option>
														<option value="2000">2km</option>
														<option value="5000">5km</option>
														<option value="10000">10km</option>
												</select></li>
											</ul>
										</div>
									</div>
									<script type="text/javascript">
									    var xcoordi; 
									    var ycoordi; 
									    var circle =[];
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
									    
									    //왼쪽 인근반경 지도를 클릭했을때 핀 위치 저장하기 -지영
									    naver.maps.Event.addListener(locationmap, 'click', function(e) {
									    	locationmarker.setPosition(e.coord);
									    });
									    
									    </script>
									<div class="card-header">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left"
												type="button" data-toggle="collapse"
												data-target="#facilities" aria-expanded="true">
												편의시설</button>
										</h2>
									</div>
									<div id="facilities" class="collapse show"
										aria-labelledby="headingOne">
										<div class="card-body">
											<ul class="list-unstyled">
												<li><input type="checkbox" id="금연">금연</li>
												<li><input type="checkbox" id="수영장">수영장</li>
												<li><input type="checkbox" id="스파">스파</li>
												<li><input type="checkbox" id="욕조">욕조</li>
												<li><input type="checkbox" id="wifi">wifi</li>
												<li><input type="checkbox" id="피트니스">피트니스</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-md-9" id="list">

					<c:choose>
						<c:when test="${list.size()==0}">
							<h3>${nullmsg}</h3>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${list }" varStatus="status">
								<div class="row mb-3">
									<div class="col-md-12">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col-md-3">
														<c:choose>
															<c:when test="${vo.amainimg eq null or vo.amainimg==''}">
																<img
																	src="${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg"
																	width="300" height="250">
															</c:when>
															<c:otherwise>
																<img
																	src="${pageContext.request.contextPath }/resources/images/accommodations/${vo.amainimg }"
																	width="300" height="250">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-md-6">
														<h3>${vo.aname }</h3>
														<small>${vo.aaddress }</small>
														<div id="map${status.index }"
															style="width: 200px; height: 200px;">
															<input type="hidden" id="axcoordi${status.index }"
																value="${vo.axcoordi }"> <input type="hidden"
																id="aycoordi${status.index }" value="${vo.aycoordi }">
														</div>
														<script type="text/javascript">
													mainMapList(${status.index });
													</script>
													</div>
													<div class="col-md-3" style="padding-left: 70px;">
														<c:if test="${vo.agrade!=null}">
															<h5>${vo.agrade }성급</h5>
														</c:if>
														<c:choose>
															<c:when test="${vo.restar==5 }">
																<h5>★★★★★</h5>
															</c:when>
															<c:when test="${vo.restar==4 }">
																<h5>★★★★☆</h5>
															</c:when>
															<c:when test="${vo.restar==3 }">
																<h5>★★★☆☆</h5>
															</c:when>
															<c:when test="${vo.restar==2 }">
																<h5>★★☆☆☆</h5>
															</c:when>
															<c:when test="${vo.restar==1 }">
																<h5>★☆☆☆☆</h5>
															</c:when>
															<c:when test="${vo.restar==0 }">
																<h5>☆☆☆☆☆</h5>
															</c:when>
															<c:otherwise>
																<h5>☆☆☆☆☆</h5>
															</c:otherwise>
														</c:choose>
														<h4>${vo.amountsum}원</h4>
														<button class="btn btn-outline-primary"
															onclick="location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid=${vo.aid}&riid=${vo.riid }&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}'">예약하기</button>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>

	<!--footer section-->
	<div class="footer">
		<div class="footer_container">
			<div class="site_map">
				<div class="site_map_container">
					<div class="nav_column">
						<h6>회사 정보</h6>
						<ul>
							<li><a href="#">J6 소개</a></li>
							<li><a href="#">사이트 작동 방식</a></li>
							<li><a href="#">모바일</a></li>
						</ul>
					</div>
					<div class="nav_column">
						<h6>연락처</h6>
						<ul>
							<li><a href="#">도움말/FAQ</a></li>
							<li><a href="#">숙박시설 관리</a></li>
							<li><a href="#">제휴 프로그램</a></li>
						</ul>
					</div>
					<div class="nav_column">
						<h6>더 보기</h6>
						<ul>
							<li><a href="#">위치별 호텔 검색</a></li>
							<li><a href="#">최저가 보장</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="privacy">
				<div class="privacy_container">
					<a href="#">개인 정보 보호 정책</a> <a href="#">쿠키 정책</a> <a href="#">이용
						약관</a> <span>©2021 HotelsCombined</span>
				</div>
			</div>

			<div class="description">
				<p>J6에서 주요 여행지의 호텔 상품을 최저가로 만나보세요. 수 백개의 호텔 사이트를 검색하여, 고객님께서 딱
					맞는 호텔 상품을 바로 찾아 예약하실 수 있도록 도와드립니다. J6에서는 국내 유명한 호텔 사이트를 한 번에 검색하여
					한눈에 비교할 수 있도록 도와 드리고 있어 특가 상품을 쉽게 찾으실 수 있습니다. 지금 바로 시작해 보세요.</p>
			</div>

			<div class="group_logo">
				<div class="group_logo_container">
					<p>J6은 온라인 여행 기업 '부킹홀딩스(Booking Holdings Inc.)'의 그룹사입니다.</p>
					<ul>
						<li class="group_logo_booking"></li>
						<li class="group_logo_kayak"></li>
						<li class="group_logo_opentable"></li>
						<li class="group_logo_princeline"></li>
						<li class="group_logo_agoda"></li>
						<li class="group_logo_rentalcars"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>



</body>
</html>