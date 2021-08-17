<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.star_section_field{
	width: 30px;
	height: 30px;
	border: 3px solid blue;
	float: left;
}
.grade_section_field{
	width: 30px;
	height: 30px;
	border: 3px solid blue;
	float: left;
}
</style> 
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hznya2qvqk&submodules=geocoder"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript">
function collectInfo(){
	let countRoom=$("#countRoom").val();
	let countPeople=$("#countPeople").val();
	console.log(countRoom)
	$("#showInfo").val("객실"+countRoom+"인원"+countPeople);
}
$(function(){
	//아코디언 제목? 메뉴? 누르면 숨기기/보이기효과-지영
	$("#accordion button").click(function() {
		if($($(this).attr('data-target')).attr('class')=='collapse show'){
			$($(this).attr('data-target')).attr('class','collapse')
		}else{
			$($(this).attr('data-target')).attr('class','collapse show')
		}
	});
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
 	
 	//숙소이름 자동완성 검색 -지영
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
 	
 	//즐겨찾기 체크박스 클릭 시 실행되는 ajax -지영
	$("#favorite input").click(function() {
		//0817 추가
	 	console.log("즐겨찾기 체크박스 클릭")
		
		if(!sessionStorage.getItem('id') ){
			alert('로그인 하셔야 이용할 수 있는 서비스입니다.')
			$(this).prop('checked',false)
		}else{
			let templist= new Array(); 
			checklist(templist) //체크가 몇개 되어있는지, 어떤게 체크되어있는지 확인하는 펑션 
			//인근반경 거리가 상관없음일때
			if($("#locationamount").val()!="none"){
				
			}else{
				
			}
		}
	})
	
	//편의시설 체크박스 클릭 시 실행되는 ajax -지영
	$("#facilities input").click(function() {
		console.log("편의시설 체크박스 클릭")
		let templist= new Array(); 
		checklist(templist)
					

			if($("#locationamount").val()!="none"){
			 	if($("#gomap").html()=="돌아가기"){
			 		console.log("gomapok1"+templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
					  //gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val(),grade,star)
			 	}else{
			 		console.log("gomapok2"+templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
					//list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val(),grade,star)
			 	}
			}else{
				if($("#gomap").html()=="돌아가기"){
					console.log("gomapok3"+templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
					  gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
			 	}else{
			 		console.log("gomapok4"+templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
					list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
			 	}
			}
	})
		
	//무료시설 체크박스 클릭 시 실행되는 ajax -지영
	$("#forFree input").click(function() {
		
		console.log("무료시설 체크박스 클릭")
		let templist= new Array(); 
		checklist(templist)
		if($("#locationamount").val()!="none"){
		 	if($("#gomap").html()=="돌아가기"){
		 				 	}else{
		 				 	}
		}else{
			if($("#gomap").html()=="돌아가기"){
				console.log("gomapok3"+templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
				  //gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
		 	}else{
		 		console.log("gomapok4"+templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
				//list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
		 	}
		}
	})
	
	//거리를 통한 검색의 select옵션이 변경되었을때 실행될 함수 -지영
 	$("#locationamount").change(function() {
 		
    	for (var i = 0; i < circle.length; i++) {
	    	circle[i].setMap(null);
	    	circle.shift();
		}
    	let templist= new Array(); 
		checklist(templist)
    	if($(this).val()=="none"){
    		    	}else{
    	makeCircle(locationmap,locationmarker.getPosition(),$(this).val());
    	    	}
		
    })
    
	//지도로 보기 클릭시 효과 -지영
	$("#gomap").click(function() {
	  if($("#gomap").html()=="지도로 보기"){
		 console.log('test')
		  $("#gomap").html("돌아가기")
		  $("#location").attr('class','collapse')
		  $("#list").empty();
		  let html = "<div id='gomapchange' style='width:100%; height:1400px;'></div>";
		  let templist= new Array(); 
		  checklist(templist)
		  $("#list").append(html);
		  
		 
		  
		}else{
	    	  $("#gomap").html("지도로 보기")
	    	  $("#location").attr('class','collapse show')
			  $("#list").empty();
	    	  let templist= new Array(); 
				checklist(templist)
				if($("#locationamount").val()!="none"){
									}else{
									}
	  	}
	})
	//셀렉트박스 정렬 -지윤
 	$("#sort").change(function(){
 			let sort=$(this).val();
 			console.log("sort"+sort);
 			
 			

 			
 			let templist= new Array(); 
 			checklist(templist)
 			if($("#locationamount").val()=="none"){
 					    	}else{
	 	    	makeCircle(locationmap,locationmarker.getPosition(),$("#locationamount").val());
	 	    	
 	    	}
			//list(facilities,xcoordi,ycoordi,distance,sort);	
	});
	   //가격 range slider -지윤
        $('#slider').slider({
            orientation:'horizontal',
             min:${minmax.minsum},
             max:${minmax.maxsum},
             step:10000,
             range:true,
             values:[${minmax.minsum},${minmax.maxsum}],
             
             create:function(e, ui){ //text 박스에 value값 나타냄
                 var values = $(this).slider('option','values');
                 $('#count_min').val(values[0]);
                 $('#count_max').val(values[1]);
             },
             change:function(e,ui){ //value 가 change 되었을 때
                 $('#count_min').val(ui.values[0]);
                 $('#count_max').val(ui.values[1]);
                 
                let searchHotel=$("#searchHotel").val();
         		let checkin=$("input[name=checkin]").val();
         		let checkout=$("input[name=checkout]").val();
         		let countPeople=$("input[name=countPeople]").val();
         		let countRoom=$("input[name=countRoom]").val();
         		let minprice=$("#count_min").val();
         		let maxprice=$("#count_max").val();
         		$("#accommList").empty();
         				
         		$.ajax({
        			url:"/project/lhjcjy/rangeslider",
        			dataType:"json",
        			type:"get",
        			data:{"searchHotel":searchHotel,"checkin":checkin, "checkout":checkout,"countPeople":countPeople,"countRoom":countRoom, "minprice":minprice, "maxprice":maxprice },
        			success:function(data){
        				$(data.list).each(function(i,d){
        					let aid=d.aid;
        					let amainimg=d.amainimg;
        					let aname=d.aname;
        					let aaddress=d.aaddress;
        					let grade = d.agrade;
        					//let star=d.star;
        					let amountsum=d.amountsum;
        					let restar = d.star;
    						if(restar == 5){
    							let star = "★★★★★";
    						}else if(restar == 4){
    							star="★★★★☆";
    						}else if(restar == 3){
    							star="★★★☆☆";
    						}else if(restar == 2){
    							star = "★★☆☆☆";
    						}else if(restar == 1){
    							star = "★☆☆☆☆";
    						}else if(restar == 0){
    							star="☆☆☆☆☆";
    						}
        					let li="<div class='accommList'>";
        					li += "<div class='eachList'>";
        					li += "<div class='card'>";
        					li += "<div class='card-body'>";
        					li += "<div class='row'>";
        					li += "<div class='col-md-3'>";
        					li += "<img src='${pageContext.request.contextPath }/resources/images/accommodations/"+amainimg+"' width='300' height='250'>";
        					li += "</div>";
        					console.log("!!!!!!");
        					li += "<div class='col-md-7'>";
        					li += "<h3>"+aname+"</h3>";
        					li += "<small>"+aaddress+"</small>";
        					li += "</div>";
        					li += "<div class='col-md-2'>";
        					if(grade == null){
        						li += "<h5> </h5>";
        					}else{
        						li += "<h5>" + grade + "성급</h5>";
        					}
        					li += "<h5>" + star + "</h5>";
        					li += "<h4>"+amountsum+"원</h4>";
        					li += "<button class=\"btn\" onclick=\"location.href='{pageContext.request.contextPath }/user/kjy/room_info?aid="+aid+"&person="+countPeople+"&roomnum="+countRoom+"&startday="+checkin+"&endday="+checkout+"'\">예약하기</button>" 
        					li += "</div>";
        					li += "</div>";
        					li += "</div>";
        					li += "</div>";
        					li += "</div>";
        					li += "</div>";
        					$("#accommList").append(li);
        				})
        			}
        		})
                 
             }
         });
        $('#count_min').change(function(){
    		$('#slider').slider('values',0,$(this).val());
    	})
    	$('#count_max').change(function(){
    		$('#slider').slider('values',1,$(this).val());
    	})
	   
     // 평점 div박스
   		$(".star_section_field").click(function(){
   			let searchHotel = $("#searchHotel").val();
			let checkin = $("input[name=checkin]").val();
			let checkout = $("input[name=checkout]").val();
			let countPeople = $("input[name=countPeople]").val();
			let countRoom = $("input[name=countRoom]").val();
			let restar = $(this).attr("id");
		
			$("#accommList").empty();
			$.ajax({
		 		url : "${pageContext.request.contextPath }/lhjcjy/starsection",
				data : {"searchHotel" : searchHotel, "checkin" : checkin, "checkout" : checkout, "countRoom" : countRoom, "countPeople" : countPeople, "restar" : restar},
				dataType : "json",
				success : function(data){
					$(data.list).each(function(i,d){
						let restar = d.restar;
						let amainimg = d.amainimg;
						let aname = d.aname;
						let address = d.aaddress;
						if(restar == 5){
							let star = "★★★★★";
						}else if(restar == 4){
							star="★★★★☆";
						}else if(restar == 3){
							star="★★★☆☆";
						}else if(restar == 2){
							star = "★★☆☆☆";
						}else if(restar == 1){
							star = "★☆☆☆☆";
						}else if(restar == 0){
							star="☆☆☆☆☆";
						}
						let price = d.amountsum;
						let grade = d.agrade;
						console.log(aname + ", " + address + ", " + star + ", " + price);
						let aid = d.aid;
						let person = d.rimaxper;
						let roomnum = d.countRoom;
						let rcheckin = d.rcheckin;
						let rcheckout = d.rcheckout;
						console.log(aid + ", " + person + ", " + roomnum + ", " + rcheckin + ", " + rcheckout);
						
						let html = "<div class='accommList'>";
						html    += "<div class='eachList'>";
						html	+= "<div class='card'>";
						html	+= "<div class='card-body'>";
						html	+= "<div class='row'>";
						html	+= "<div class='col-md-3'>";
						html	+= "<img src='${pageContext.request.contextPath }/resources/images/accommodations/" + amainimg + "' width='300' height='250'>";
						html	+= "</div>";
						html	+= "<div class='col-md-7'>";
						html	+= "<h3>" + aname + "</h3>";
						html	+= "<small>" + address + "</small>";
						html	+= "<p><small>지도보기?뭐든추가</small></p>";
						html	+= "</div>";
						html	+= "<div class='col-md-2'>";
						if(grade == null){
    						html += "<h5> </h5>";
    					}else{
    						html += "<h5>" + grade + "성급</h5>";
    					}
						html	+= "<h5>" + star + "</h5>";
						html	+= "<h4>" + price + "원</h4>";
						html	+= "<button class='btn' onclick=" + "location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid=" + aid + "&person=" + person + "&roomnum=" + roomnum + "&startday=" + rcheckin + "&endday=" + rcheckout + "'>예약하기</button>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						$("#accommList").append(html);
					});
				}	
			});
		});
   		// 성급 div박스
   		$(".grade_section_field").click(function(){
   			let searchHotel = $("#searchHotel").val();
			let checkin = $("input[name=checkin]").val();
			let checkout = $("input[name=checkout]").val();
			let countPeople = $("input[name=countPeople]").val();
			let countRoom = $("input[name=countRoom]").val();
			let agrade = $(this).attr("id");
		
			$("#accommList").empty();
			$.ajax({
		 		url : "${pageContext.request.contextPath }/lhjcjy/gradesection",
				data : {"searchHotel" : searchHotel, "checkin" : checkin, "checkout" : checkout, "countRoom" : countRoom, "countPeople" : countPeople, "agrade" : agrade},
				dataType : "json",
				success : function(data){
					$(data.list).each(function(i,d){
						let restar = d.restar;
						let amainimg = d.amainimg;
						let aname = d.aname;
						let address = d.aaddress;
						console.log("평점: " + restar);
						if(restar == 5){
							let star = "★★★★★";
						}else if(restar == 4){
							star="★★★★☆";
						}else if(restar == 3){
							star="★★★☆☆";
						}else if(restar == 2){
							star = "★★☆☆☆";
						}else if(restar == 1){
							star = "★☆☆☆☆";
						}else if(restar == 0){
							star="☆☆☆☆☆";
						}
						let price = d.amountsum;
						let grade = d.agrade;
						console.log(aname + ", " + address + ", " + star + ", " + price + ", " + grade);
						let aid = d.aid;
						let person = d.rimaxper;
						let roomnum = d.countRoom;
						let rcheckin = d.rcheckin;
						let rcheckout = d.rcheckout;
						console.log(aid + ", " + person + ", " + roomnum + ", " + rcheckin + ", " + rcheckout);
						
						let html = "<div class='accommList'>";
						html    += "<div class='eachList'>";
						html	+= "<div class='card'>";
						html	+= "<div class='card-body'>";
						html	+= "<div class='row'>";
						html	+= "<div class='col-md-3'>";
						html	+= "<img src='${pageContext.request.contextPath }/resources/images/accommodations/" + amainimg + "' width='300' height='250'>";
						html	+= "</div>";
						html	+= "<div class='col-md-7'>";
						html	+= "<h3>" + aname + "</h3>";
						html	+= "<small>" + address + "</small>";
						html	+= "<p><small>지도보기?뭐든추가</small></p>";
						html	+= "</div>";
						html	+= "<div class='col-md-2'>";
						if(grade == null){
    						html += "<h5> </h5>";
    					}else{
    						html += "<h5>" + grade + "성급</h5>";
    					}
						html	+= "<h5>" + star + "</h5>";
						html	+= "<h4>" + price + "원</h4>";
						html	+= "<button class='btn' onclick=" + "location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid=" + aid + "&person=" + person + "&roomnum=" + roomnum + "&startday=" + rcheckin + "&endday=" + rcheckout + "'>예약하기</button>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						html	+= "</div>";
						$("#accommList").append(html);
					});
				}	
			});
		});				
});
//지도로 보기 ajax받아와서 뿌려주기 -지영
function gomapchange(facilities,axcoordi,aycoordi,distance){
	  let gomapchange = new naver.maps.Map('gomapchange', {
          center: new naver.maps.LatLng(ycoordi, xcoordi),
          zoom: 13
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
				"fac":fac,"xcoordi":axcoordi,"ycoordi":aycoordi,"distance":distance},
			type:"get",
			dataType:"json",
			success:function(data){
				if(data.code=='success'){
		        	for (var i = 0; i < data.list.length; i++) {
		        		if(data.list[i].aycoordi>100){
							let listxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi);
							latlngs.push(new naver.maps.LatLng(listxy[1], listxy[0]));
		        		}else{
							latlngs.push(new naver.maps.LatLng(data.list[i].aycoordi, data.list[i].axcoordi));
		        		}
						if(data.list[i].amainimg==null){
							contentString.push(
				    		          '<div class="iw_inner"><h3>'+data.list[i].aname+'</h3><p>'+data.list[i].aaddress
				    		          +'<br /> <img src="${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg" width="300" height="250" /><br />'
				    		          +'전화번호: '+data.list[i].aphone+' | 가격: '+data.list[i].amountsum+'<br/>'
				    		          +"<button class='btn' onclick=\""
									  +"location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID="+data.list[i].aid
									  +"&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+data.checkin+"&endday="+data.checkout+"'\">예약하기</button>"
									  +'</p></div>'
									  )
					   }else{
						   contentString.push(
				    		          '<div class="iw_inner"><h3>'+data.list[i].aname+'</h3><p>'+data.list[i].aaddress
				    		          +'<br /> <img src="${pageContext.request.contextPath }/resources/images/accommodations/'+data.list[i].amainimg+'"width="300" height="250"/><br />'
				    		          +data.list[i].aphone+' | '+data.list[i].amountsum+'<br/>'
				    		          +"<button class='btn' onclick=\""
									  +"location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID="+data.list[i].aid
									  +"&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+data.checkin+"&endday="+data.list[i].amainimg
									  +"'\">예약하기</button>"
									  +'</p></div>'
									  )
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
		      borderColor: "#2db400",
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
if(ycoordi*1>100){
	console.log('변환계 사용')
	// point array 1
    var point1 = [xcoordi*1, ycoordi*1]
    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs"; // from
    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
   
    // #1. 변환한 위도 경도 값 저장
    var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
	xy.push(lonAndLat1[0])
	xy.push(lonAndLat1[1])
}else{
	console.log('변환계 사용안함')
	xy.push(xcoordi)
	xy.push(ycoordi)
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
function list(facilities,xcoordi,ycoordi,distance,sort){
	console.log("sort2:"+sort)
let changecnt=0;
   $.ajax({
		url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
		traditional :true,
		data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}",
			"facilities":facilities,"xcoordi":xcoordi,"ycoordi":ycoordi,"distance":distance,"sort":sort},
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.code=='success'){
			   $("#list").empty();
			   for (var i = 0; i < data.list.length; i++) {
				   let html = "";
				   //xcoordi값이 있을때
				   if(xcoordi){
					   	let testxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi)
					   //기준좌표
					   	let refcoordi = [xcoordi, ycoordi];
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
								html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg' width='300' height='250'>";
							}else{
								html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/"+data.list[i].amainimg+"'width='300' height='250'>";
							}
							html+="</div>";
							html+="<div class='col-md-7'>";
							html+="<h3>"+data.list[i].aname+"</h3>";
							html+="<small>"+data.list[i].aaddress+"</small>";
							html+="<div id='map"+changecnt+"' style='width: 200px; height: 200px;'>지도넣기"
							html+="<input type='hidden' id='axcoordi"+changecnt+"' value="+data.list[i].axcoordi+">";
							html+="<input type='hidden' id='aycoordi"+changecnt+"' value="+data.list[i].aycoordi+">";
							html+="</div>";
							html+="</div>";
							html+="<div class='col-md-2'>";
							html+="<h5>"+data.list[i].amountsum+"원</h5>";
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
							changecnt++;
						}
						if(sort){
							if(this.value=="all"){
								
							}
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
					html+="<div class='col-md-7'>";
					html+="<h3>"+data.list[i].aname+"</h3>";
					html+="<small>"+data.list[i].aaddress+"</small>";
					html+="<div id='map"+i+"' style='width: 200px; height: 200px;'>지도넣기"
					html+="<input type='hidden' id='axcoordi"+i+"' value="+data.list[i].axcoordi+">";
					html+="<input type='hidden' id='aycoordi"+i+"' value="+data.list[i].aycoordi+">";
					html+="</div>";
					html+="</div>";
					html+="<div class='col-md-2'>";
					html+="<h5>"+data.list[i].amountsum+"원</h5>";
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

//리스트에 호텔 위치에 맞는 지도+핀 표시하기 -지영
function mainMapList(index){
	var mainmaplist = new Array();
	mainmaplist.push(index);
	if($("#aycoordi"+index).val()*1>100){
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
		let copy3 = $("#aycoordi"+index).val();
		$("#aycoordi"+index).val($("#axcoordi"+index).val());
		$("#axcoordi"+index).val(copy3)
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

</script>
</head>
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
													<input type="checkbox" id="즐겨찾기">즐겨찾기 선호호텔체인
												</li>
											</ul>
									      </div>
									   </div>
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
														<div class ="grade_section">	
															<h4>성급</h4>
															<div class="grade_section_field" id="1">1+</div>
															<div class="grade_section_field" id="2">2+</div>
															<div class="grade_section_field" id="3">3+</div>
															<div class="grade_section_field" id="4">4+</div>
															<div class="grade_section_field" id="5">5</div>
														</div><br>
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
														<div class ="star_section">
															<h4>평점</h4>
															<div class="star_section_field" id="1">1+</div>
															<div class="star_section_field" id="2">2+</div>
															<div class="star_section_field" id="3">3+</div>
															<div class="star_section_field" id="4">4+</div>
															<div class="star_section_field" id="5">5</div>
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
									      			<li>
													<form>
														<input id="count_min" type="text" size="10" class="price-range-field" />
														~ <input id="count_max" type="text" size="10" class="price-range-field" />
														<div id="slider"></div>
													</form>
													</li>
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
												<c:when test="${vo.amainimg eq null or vo.amainimg==''}">
													<img
														src="${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg"
														width="300" height="250">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath }/resources/images/accommodations/${vo.amainimg }"
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
												</script>
										</div>
										<div class="col-md-2">
									                	<h5>${vo.agrade }성급</h5>
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
									                <c:otherwise>
									               		<h5>☆☆☆☆☆점</h5>
									                </c:otherwise>	
									                </c:choose>
											<h4>${vo.amountsum}원</h4>
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

	
	
	
</body>
</html>