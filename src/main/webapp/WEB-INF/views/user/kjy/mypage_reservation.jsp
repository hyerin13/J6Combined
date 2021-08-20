<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#cutitle{
		position: relative;
		margin-top:30px;
		font-size:30px;
		font-weight:bold;
		margin-bottom:30px;
	}
	.box1{
		position: relative;
		width: 1000px;
		height: 160px;
		border:1px solid gray;
		border-radius: 10px;
		margin-bottom:20px;
	}
	.imgbox{
		position: absolute;
		top:20px;
		left:20px;
		width:150px;
		height:120px;
		border-radius: 10px;
	}
	.roomtype{
		position: absolute;
		top:20px;
		left:220px;
		font-size:20px;
		font-weight:bold;
	}
	.checkinout{
		position: absolute;
		top:60px;
		left:220px;
		font-size:15px;
	}
	.resname{
		position: absolute;
		top:90px;
		left:220px;
		font-size:15px;
	}
	.resphone{
		position:absolute;
		top:120px;
		left:220px;
		font-size: 15px;
	}
	.pmethod{
		position: absolute;
		top:60px;
		left:550px;
		font-size:15px;
	}
	.pdate{
		position: absolute;
		top:90px;
		left:550px;
		font-size:15px;
	}
	.ptotal{
		position: absolute;
		top:120px;
		left:550px;
		font-size:15px;
	}
	.cancelbtn1{
		position: absolute;
		top:80px;
		right:40px;
		font-size:15px;
		font-weight:bold;
		color: blue;
		cursor:pointer;
	}
	.cancelbtn2{
		position: absolute;
		top:80px;
		right:40px;
		font-size:15px;
		font-weight:bold;
		color: red;
	}
	
	#patitle{
		position: relative;
		margin-top:30px;
		font-size:30px;
		font-weight:bold;
		margin-bottom:30px;	
	}
	.box2{
		position: relative;
		width: 1000px;
		height: 160px;
		border:1px solid gray;
		border-radius: 10px;
		margin-bottom:20px;
		background: #DCDCDC;
	}
	.expirebtn{
		position: absolute;
		top:80px;
		right:40px;
		font-size:15px;
		font-weight:bold;
		color: black;
	}
	
	.reviewbtn{
		position: absolute;
		top:80px;
		right:40px;
		font-size:15px;
		font-weight:bold;
		color: #59DA50;
		cursor:pointer;
	}
	
	#page{
		position: relative;
		margin-bottom:40px;
		left: 450px;
		width: 100px;
		height: 50px;
		font-size: 25px;
	}
	
	
	.modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 300px;
        height: 200px;
                              
    }
    
    .modal2 {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    /* Modal Content/Box */
    .modal-content2 {
    	position:absolute;
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centerede */
        padding: 20px;
        border: 1px solid #888;
        top:-150px;
        left:700px;
        width: 510px;
        height: 700px;
       	overflow:auto; 
       	overflow-x:hidden;
    }
    
    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .close2 {
    	position:absolute;
    	right:20px;
        color: #fefefe;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close2:hover,
    .close2:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    .pwcheck{
    	position: absolute;
    	top:50px;
    	left:40px;
    	font-size:18px;
    	font-weight: bold;
    }
    .textcheck{
    	position: absolute;
    	top:90px;
    	left:40px;
    	font-size:18px;
    	text-align:center;
    }
    #pwcheck{
    	position: absolute;
    	top:140px;
    	left:40px;
    	width:200px;
    	height:40px;
    }
    .review_head{
    	position: fixed;
    	top:138px;
    	left:700px;
    	width:494px;
    	height:50px;
    	background:#418BCA;
    	z-index: 2;
    }
    .reviewhead{
    	position:absolute;
    	top:5px;
    	left:200px;
    	font-size: 25px;
    	color: white;
    }  
    .review_roomphoto{
    	position:absolute;
    	top:50px;
    	left:-1px;
    	width:500px;
    	height:100px;
    	border-bottom:1px solid gray;
    }
    .room_img{
    	position:absolute;
    	top:10px;
    	left:30px;
    	width:80px;
    	height:80px;
    	border:1px solid gray;
    	border-radius: 5px;
    }
    .room_aname{
    	position: absolute;
    	top:10px;
    	left:130px;
    	font-size:25px;
    }
    .room_type{
    	position: absolute;
    	top:60px;
    	left:130px;
    	font-size:15px;
    }
    .review_content{
    	position:absolute;
    	top:150px;
    	left: -1px;
    	width: 500px;
    	height:180px;
    	border-bottom:1px solid gray;
    }
    .content_title{
    	position:absolute;
    	top:40px;
    	left:145px;
    	font-size:20px;
    }
    .content_star{
    	position:absolute;
    	top:50px;
    	left:80px;
    	font-size:50px;
    }
    .content_star a{
	 	color: gray; 
	} 
	.content_star a.on{
	 	color: blue;
	}
	.content_starhtml{
		position:absolute;
		top:120px;
		left:185px;
		font-size:15px;
	}
	.review_content2{
    	position:absolute;
    	top:330px;
    	left: -1px;
    	width: 500px;
    	height:300px;
    	border-bottom:1px solid gray;
    }
    .content2_titlehtml1{
    	position:absolute;
    	top:20px;
    	left:140px;
    	font-size:20px;
    }
    .content2_titlehtml2{
    	position:absolute;
    	top:45px;
    	left:140px;
    	font-size:20px;
    }
    .content2_title{
    	position: absolute;
    	top:80px;
    	left:28px;
    	width:443px;
    	font-size:15px;
    }
    .content2_content{
    	position:absolute;
    	top:110px;
    	left:28px;
    	height:150px;
    	overflow:auto;
    	resize: none;
    	/*resize=늘리기없애기*/
    }
    .content2_count{
		position:absolute;
		top:265px;
		right:28px;
		font-size:15px;   	
    }
    .content_file{
    	position:absolute;
    	top:630px;
    	left:-1px;
    	height:300px;
    	width:500px;
    }
    .filebox{
    	position: absolute;
    	top:40px;
    	left:30px;
    	width:440px;
    	height:50px; 
 		border: 1px solid gray;
 		border-style: dashed;
 		cursor:pointer;
    }
    #review_file{
    	position: absolute;
 		width: 1px;
 		height: 1px;
 		padding: 0;
  		margin: -1px;
  		overflow: hidden;
 		clip:rect(0,0,0,0);
  		border: 0;
    }
    .review_file_label{
    	position: absolute;
    	top:10px;
    	left:100px;
    	font-size:20px;
    	cursor:pointer;
    }
    #file_imgbox{
    	position:absolute;
    	top:120px;
    	left:30px;
    	height:100px;
    	width:100px;
    }
    #file_img{
    	width:100px;
    	height:100px;
    }
    #review_btn{
    	position: fixed;
    	top:788px;
    	left:700px;
    	width:494px;
    	height:50px;
    	z-index: 2;
    }
</style>
<div id="part1"></div>
<div id="part2"></div>
<div id="page"></div>

<!-- 모달창 -->
<div id="myModal" class="modal">
   <!-- 모달 내용 -->
   <div class="modal-content">
      <span class="close">&times;</span><br>                                                               
      <p class="pwcheck">비밀번호를 입력해주세요</p>
      <input class="textcheck" type="password">
      <input type="button" class="btn btn-primary" id="pwcheck" value="확인">
   </div>
</div>
<div id="myModal2" class="modal2">
    <!-- 모달 내용 -->
    <div class="modal-content2">
    	<div class="review_head">
		 	<span class="close2">&times;</span>
      		<span class="reviewhead">리뷰쓰기</span>    
    	</div>
    	<div class='review_roomphoto'>
    		<img class="room_img">
    		<span class="room_aname"></span>
    		<span class="room_type"></span>
    	</div>
    	<div class="review_content">
    		<span class="content_title">상품은 만족하셨나요?</span>
    		<p class="content_star"> 
				<a href="javascript:void(0);" value="1">★</a> 
				<a href="javascript:void(0);" value="2">★</a> 
				<a href="javascript:void(0);" value="3">★</a> 
				<a href="javascript:void(0);" value="4">★</a> 
				<a href="javascript:void(0);" value="5">★</a> 
			<p>
			<span class="content_starhtml"></span>
    	</div>
    	<div class="review_content2">
    		<span class="content2_titlehtml1">어떤점이 좋았나요?</span>
    		<span class="content2_titlehtml2"></span>
    		<input type="text" class="content2_title" placeholder="제목을 입력해주세요">
    		<textarea rows="10" cols="60" class="content2_content" placeholder="최대 500자까지 입력가능합니다."></textarea>
    		<span class="content2_count">(0/500)</span>
    	</div>
    	<div class="content_file">
    		<div class="filebox">
    		<form id="fileForm2" method="post" enctype="multipart/form-data" style="display: none;">
    			<input type="file" id="review_file" name="review_photo">
    		</form>
    			<label for="review_file" class="review_file_label">클릭하여 사진 첨부하기</label>
    		</div>
    		<div id="file_imgbox">
    			<img id="file_img"  onerror="imgAreaError()">
    		</div>
    	</div>
    	<input type="button" value="등록" class="btn btn-primary" id="review_btn">
    </div>
</div>    
    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//예약내역 불러오기
function reservationlist(pageNum){
	$("#part1").empty();
	$("#part2").empty();
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath }/user/kjy/reservationlist',
		data:{'pageNum':pageNum},
		dataType: 'json',
		success:function(data){
			let pastlist=data.pastlist;
			let currentlist=data.currentlist;
			if(currentlist!=null){
				var title1="<p id='cutitle'>최근 내역</p>";
				$("#part1").append(title1);
				$(currentlist).each(function(i,d){
					if(d.rcancel=='N'){
						let html="<div class='box1'>"+
						"<img src='${pageContext.request.contextPath }/resources/images/room_info/"+d.rimainimg+"' class='imgbox'>"+
						"<p class='roomtype'>"+d.riroomtype+"</p>"+
						"<p class='checkinout'>예약날짜 : "+d.rcheckin+" ~ "+d.rcheckout+"</p>"+
						"<p class='resname'>이름 : "+d.rresname+"</p>"+
						"<p class='resphone'>전화번호 : "+d.rresphone+"</p>"+
						"<p class='pmethod'>결제수단 : "+d.pmethod+"</p>"+
						"<p class='pdate'>결제날짜 : "+d.pdate+"</p>"+
						"<p class='ptotal'>결제금액 : "+d.ptotal+"원</p>"+
						"<p class='cancelbtn1' onclick='cancelclick("+d.pid+")'>주문취소</p>"+
						"</div>";
						$("#part1").append(html);
					}else{
						let html1="<div class='box1'>"+
						"<img src='${pageContext.request.contextPath }/resources/images/room_info/"+d.rimainimg+"' class='imgbox'>"+
						"<p class='roomtype'>"+d.riroomtype+"</p>"+
						"<p class='checkinout'>예약날짜 : "+d.rcheckin+" ~ "+d.rcheckout+"</p>"+
						"<p class='resname'>이름 : "+d.rresname+"</p>"+
						"<p class='resphone'>전화번호 : "+d.rresphone+"</p>"+
						"<p class='pmethod'>결제수단 : "+d.pmethod+"</p>"+
						"<p class='pdate'>결제날짜 : "+d.pdate+"</p>"+
						"<p class='ptotal'>결제금액 : "+d.ptotal+"원</p>"+
						"<p class='cancelbtn2'>취소완료</p>"+
						"</div>";
						$("#part1").append(html1);
					}
				});
			}
			if(pastlist!=null){
				var title2="<p id='patitle'>과거 내역</p>";
				$("#part2").append(title2);
				$(pastlist).each(function(i,d){
					if(d.rcancel=='N'){
						if(d.reid=='0'){
							let html2="<div class='box2'>"+
							"<img src='${pageContext.request.contextPath }/resources/images/room_info/"+d.rimainimg+"' class='imgbox'>"+
							"<p class='roomtype'>"+d.riroomtype+"</p>"+
							"<p class='checkinout'>예약날짜 : "+d.rcheckin+" ~ "+d.rcheckout+"</p>"+
							"<p class='resname'>이름 : "+d.rresname+"</p>"+
							"<p class='resphone'>전화번호 : "+d.rresphone+"</p>"+
							"<p class='pmethod'>결제수단 : "+d.pmethod+"</p>"+
							"<p class='pdate'>결제날짜 : "+d.pdate+"</p>"+
							"<p class='ptotal'>결제금액 : "+d.ptotal+"원</p>"+
							"<p class='reviewbtn' onclick='reviewclick("+d.rid+")'>리뷰쓰기</p>"+
							"</div>";
							$("#part2").append(html2);
						}else{
							let html2="<div class='box2'>"+
							"<img src='${pageContext.request.contextPath }/resources/images/room_info/"+d.rimainimg+"' class='imgbox'>"+
							"<p class='roomtype'>"+d.riroomtype+"</p>"+
							"<p class='checkinout'>예약날짜 : "+d.rcheckin+" ~ "+d.rcheckout+"</p>"+
							"<p class='resname'>이름 : "+d.rresname+"</p>"+
							"<p class='resphone'>전화번호 : "+d.rresphone+"</p>"+
							"<p class='pmethod'>결제수단 : "+d.pmethod+"</p>"+
							"<p class='pdate'>결제날짜 : "+d.pdate+"</p>"+
							"<p class='ptotal'>결제금액 : "+d.ptotal+"원</p>"+
							"<p class='expirebtn'>기간만료</p>"+
							"</div>";
							$("#part2").append(html2);
						}
					}else{
						let html2="<div class='box2'>"+
						"<img src='${pageContext.request.contextPath }/resources/images/room_info/"+d.rimainimg+"' class='imgbox'>"+
						"<p class='roomtype'>"+d.riroomtype+"</p>"+
						"<p class='checkinout'>예약날짜 : "+d.rcheckin+" ~ "+d.rcheckout+"</p>"+
						"<p class='resname'>이름 : "+d.rresname+"</p>"+
						"<p class='resphone'>전화번호 : "+d.rresphone+"</p>"+
						"<p class='pmethod'>결제수단 : "+d.pmethod+"</p>"+
						"<p class='pdate'>결제날짜 : "+d.pdate+"</p>"+
						"<p class='ptotal'>결제금액 : "+d.ptotal+"원</p>"+
						"<p class='cancelbtn2'>취소완료</p>"+
						"</div>";
						$("#part2").append(html2);
					}
				});
			}
			//페이징 처리
			let startPage=data.startPageNum;
			let endPage=data.endPageNum;
			let pageCount=data.totalPageCount;
			let pageHtml="";
			if(startPage>5){
				pageHtml += "<a href='javascript:reservationlist("+ (startPage-1) + ")'>이전</a>";
			}
			for(let i=startPage;i<=endPage;i++){
				if(i==pageNum){
					pageHtml += "<a href='javascript:reservationlist("+ i + ")'><span style='color:blue'>"+ i + "</span></a> ";
				}else{
					pageHtml += "<a href='javascript:reservationlist("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
				}	
			}
			if(endPage<pageCount){
				pageHtml += "<a href='javascript:reservationlist("+ (endPage+1) + ")'>다음</a>";
			}
			$("#page").html(pageHtml);
		}
	});
}

reservationlist();
$(document).on("mouseenter",".cancelbtn1",function(){
	$(this).css({
		textDecoration: "underline"
	});
});
$(document).on("mouseleave",".cancelbtn1",function(){
	$(this).css({
		textDecoration: "none"
	});
});
$(document).on("mouseenter",".reviewbtn",function(){
	$(this).css({
		textDecoration: "underline"
	});
});
$(document).on("mouseleave",".reviewbtn",function(){
	$(this).css({
		textDecoration: "none"
	});
});

$(".close").click(function(){
	$("#myModal").css('display','none');
	//페이지 스크롤이동 다시 허용
	$('html').css('overflow','visible');
});
$(".close2").click(function(){
	$("#myModal2").css('display','none');
	//페이지 스크롤이동 다시 허용
	$('html').css('overflow','visible');
});

//pid통해 결제 취소
function cancelclick(pid){
	$("#myModal").css('display','block');
	//페이지 스크롤이동 막기
	$('html').css('overflow','hidden');
	$("#pwcheck").click(function(){
		var mpw=$(".textcheck").val();
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/user/kjy/reservationpwdcheck',
			data:{'mpw':mpw},
			dataType: 'json',
			success:function(data){
				if(data.code=='success'){
					$.ajax({
						type:'post',
						url:'${pageContext.request.contextPath }/user/kjy/reservationcancel',
						data:{'pid':pid},
						dataType: 'json',
						success:function(d){
							if(d.code=='success'){
								alert("취소요청이 완료되었습니다.");
								$("#myModal").css('display','none');//모달창 닫기
								$("#part1").empty();//새로고침
								$("#part2").empty();
								reservationlist();
							}else{
								alert("취소요청이 실패하였습니다.");
							}			
						}
					});
				}else{
					alert("비밀번호가 틀렸습니다.");
					$(".textcheck").val('');//텍스트비우기
				}
			}
		});
	});
}


//rid통해 리뷰쓰기 
function reviewclick(rid){
	$("#myModal2").css('display','block');
	
	//이미지 영역 일단 안보이게하기
	$('#file_imgbox').css({ 'display' : 'none' });
	//사진첨부 미리보기
	function readURL(input){
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#file_img').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#review_file").change(function() {
		if( $("#review_file").val() == '' ) {
			$('#file_img').attr('src' , '');  
		}
		$('#file_imgbox').css({ 'display' : '' });
		readURL(this);
	});
	// 이미지 에러 시 미리보기영역 미노출
	function imgAreaError(){
		$('#file_imgbox').css({ 'display' : 'none' });
	}
	//사진첨부하기 글자 css
	$(document).on("mouseenter",".filebox",function(){
		$(this).css({
			background: "#D8D8D8"
		});
	});
	$(document).on("mouseleave",".filebox",function(){
		$(this).css({
			background: "white"
		});
	});
	
	//페이지 스크롤이동 막기
	$('html').css('overflow','hidden');
	
	//텍스트 500자 제한두기
	$(".content2_content").on("keyup",function(){
		$(".content2_count").html("("+$(this).val().length+"/500)");
		if($(this).val().length>500){
			$(this).val($(this).val().substring(0,500));
			$(".content2_count").html("(500/500)");
		}
	});
	
	//별점추기 밑줄 없애기
	$(document).on("mouseenter",".content_star a",function(){
		$(this).css({
			textDecoration: "none"
		});
	});
	$(document).on("mouseleave",".content_star a",function(){
		$(this).css({
			textDecoration: "none"
		});
	});
	//별점주기 별로 글자 출력
	var starval="";
	$(".content_star a").click(function(){
		$(this).parent().children("a").removeClass("on"); 
		$(this).addClass("on").prevAll("a").addClass("on"); 
		starval=$(this).attr("value"); 
		if(starval=='1'){
			$(".content_starhtml").html("1점 (별로에요)");
			$(".content2_titlehtml1").html("만족도 1점을 주셨네요.");
			$(".content2_titlehtml2").html("어떤 점이 아쉬웠나요?");
		}else if(starval=='2'){
			$(".content_starhtml").html("2점 (그저그래요)");
			$(".content2_titlehtml1").html("만족도 2점을 주셨네요.");
			$(".content2_titlehtml2").html("어떤 점이 아쉬웠나요?");
		}else if(starval=='3'){
			$(".content_starhtml").html("3점 (괜찮아요)");
			$(".content2_titlehtml1").html("만족도 3점을 주셨네요.");
			$(".content2_titlehtml2").html("어떤 점이 좋았나요?");
		}else if(starval=='4'){
			$(".content_starhtml").html("4점 (좋아요)");
			$(".content2_titlehtml1").html("만족도 4점을 주셨네요.");
			$(".content2_titlehtml2").html("어떤 점이 좋았나요?");
		}else{
			$(".content_starhtml").html("5점 (최고에요)");
			$(".content2_titlehtml1").html("만족도 5점을 주셨네요.");
			$(".content2_titlehtml2").html("어떤 점이 좋았나요?");
		}
	});
	
	//숙소정보 불러오기
	$.ajax({
		type:'get',
		url:"${pageContext.request.contextPath }/user/kjy/reservationreview",
		data:{'rid':rid},
		dataType:"json",
		success: function(data){
			var aname=data.ANAME;
			var roomtype=data.RIROOMTYPE;
			var mainimg=data.RIMAINIMG;
			$(".room_aname").html(aname);
			$(".room_type").html(roomtype);
			$(".room_img").attr("src","${pageContext.request.contextPath }/resources/images/room_info/"+mainimg);
		}
	});
	
	//form 전송하기
	$("#review_btn").click(function(){
		var retitle=$(".content2_title").val();
		var recontent=$(".content2_content").val();
		var form = $('#fileForm2')[0];
		var data = new FormData(form);
		data.append("retitle", retitle);
		data.append("recontent",recontent);
		data.append("rephoto",form);
		data.append("restar",starval);
		data.append("rid",rid);
		if(retitle==""){
			alert("제목을 입력해주세요");
		}else if(recontent==""){
			alert("내용을 입력해주세요");
		}else if(starval==""){
			alert("평점은 최소 1점이상 주셔야합니다.");
		}else{
			$.ajax({
				type:'post',
				enctype: 'multipart/form-data',
				url:"${pageContext.request.contextPath }/user/kjy/inserttest",
				data: data,
				dataType:"json",
				processData: false,    
			    contentType: false,      
			    cache: false,  
				timeout: 600000,
				success: function(data){
					if(data==1){
						alert("리뷰등록이 완료되었습니다.");
						$("#myModal2").css('display','none');
						$('html').css('overflow','visible');
						$("#part1").empty();//새로고침
						$("#part2").empty();
						reservationlist();
					}else{
						alert("리뷰등록이 실패하였습니다.");
						$("#myModal2").css('display','none');
						$('html').css('overflow','visible');
						$("#part1").empty();//새로고침
						$("#part2").empty();
						reservationlist();
					}
				}
			});
		}
	});
}
</script>