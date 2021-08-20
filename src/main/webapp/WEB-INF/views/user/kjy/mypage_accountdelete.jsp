<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	.title{
		position: absolute;
		top:20px;
		font-size:30px;
		font-weight:bold;
	}
	.deletecontent{
		position:absolute;
		top:100px;
		width:1000px;
		height:300px;
		border:1px solid gray;
		border-radius: 10px;
	}
	.pwinput{
		position:absolute;
		top:90px;
		left:390px;
		font-size:20px;
	}
	.pwtext{
		position:absolute;
		top:130px;
		left:390px;
		font-size:20px;
		text-align: center;
	}
	#okbtn{
		position:absolute;
		top:170px;
		left:450px;
		width:100px;
		height:35px;
	}
	
	.modal3 {
        display: none; /* Hidden by defaulteㄷ */
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
    .modal-content3 {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 300px;
        height: 200px;
                              
    }
    /* The Close Button */
    .close3 {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close3:hover,
    .close3:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .pwcheck3{
    	position:relative;
    	width:120px;
    	top:-10px;
    	left:70px;
    	font-size:18px;
    	font-weight: bold;
    }
    .textcheck3{
    	position:relative;
    	top:0px;
    	left:30px;
    	font-size:18px;
    	text-align:center;
    }
    #pwcheck3{
    	position:relative;
    	top:30px;
    	left:30px;
    	width:200px;
    	height:40px;
    }
</style>
<p class="title">회원탈퇴</p>
<div class="deletecontent">
	<p class="pwinput">비밀번호를 입력해주세요</p>
	<input type="password" class="pwtext">
	<input type="button" value="확인" class="btn btn-primary" id="okbtn">
</div>
<!-- 모달창 -->
<div id="myModal3" class="modal3">
   <!-- 모달 내용 -->
   <div class="modal-content3">
      <span class="close3">&times;</span><br>                                                               
      <p class="pwcheck3">보안문자 입력</p>
      <input class="textcheck3" type="text">
      <input type="button" class="btn btn-primary" id="pwcheck3" value="확인">
   </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	var emailcheck="";
	$("#okbtn").click(function(){
		var mpw=$(".pwtext").val();
		$.ajax({
			dataType: 'json',
			url:'${pageContext.request.contextPath }/user/kjy/pwdcheck',
			data:{'mpw':mpw},
			success:function(data){
				if(data.code=='success'){
					$("#myModal3").css('display','block');
					$('html').css('overflow','hidden');
					$.ajax({
						dataType: 'json',
						url:'${pageContext.request.contextPath }/user/kjy/emailcheck',
						success:function(data){
							emailcheck=data.key;
							console.log(emailcheck);
							$("#pwcheck3").click(function(){
								var text=$(".textcheck3").val();
								if(emailcheck!=text){
									alert("보안코드를 다시 확인해주세요");
								}else{
									if(confirm("정말 탈퇴하시겠습니까?") == true){
										$.ajax({
											dataType: 'json',
											url:'${pageContext.request.contextPath }/user/kjy/memberdel',
											success:function(data){
												console.log(data);
												if(data=='1'){
													alert("탈퇴가 완료되었습니다");
													location.href="${pageContext.request.contextPath }/";
												}
											}
										});
									}else{
										return;
									}
								}
							});
						}
					});
				}else{
					alert("비밀번호를 확인해주세요");
				}
			}
		});
		
	});
	$(".close3").click(function(){
		$("#myModal3").css('display','none');
		//페이지 스크롤이동 다시 허용
		$('html').css('overflow','visible');
	});
	
</script>