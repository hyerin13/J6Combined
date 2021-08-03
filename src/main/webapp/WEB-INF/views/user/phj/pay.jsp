<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.paybox{
		float:left;
		width:65%;
		border:solid 1px;
		border-color:gray;
		border-image:liner-gradient(to right,gray,white);
		margin:2% 2% 2% 2%;
		padding:7px;
	}
	.boxsize{
		width:85%;
		height:10%
	}
	.hiddenbox{
	
	}
</style>
</head>
<body>
<div class="header">
	<jsp:include page="../jhr/header.jsp" flush="true"/>
</div>
<div class="paybox">
	<span style="border:solid; border-color:gray">안전 결제  | 모든 카드 정보는 왼벽하게 암호화되어 안전하게 보호됩니다.</span>
	<br>
	<div >
	<input type="radio">신용/직불카드
	<div>
		<select class="boxsize">
			<option>Visa</option>
			<option>MasterCard</option>
			<option>JCB</option>
			<option>Amex</option>
		</select>
	</div>
	<input type="radio">온라인 결제
	<div>
		<select class="boxsize">
			<option>PayPal</option>
			<option>카카오페이</option>
			<option>페이코</option>
			<option>Naver Pay</option>
		</select>
	</div>
	</div>
</div>
테스트
결제아이디
결제수단
결제날짜
총 비용
<div class="footer" style="clear:both;">
	<jsp:include page="../jhr/footer.jsp" flush="true"/>
</div>
</body>
<script type="text/javascript">
	function checkEmail(){
		var email=$("#email").val();
		var emailcheck=$("#emailcheck").val();
		if(email==emailcheck){
			let com="입력하신 이메일 주소로 예약 확정서가 발송됩니다."
			$("#emailOk").html(com).css("color","#9FC93C");
		}else{
			let com="이메일'과 '이메일 재입력'에 입력된 이메일 주소가 일치하지 않습니다."
			$("#emailOk").html(com).css("color","#FF0000");
		}
	}
</script>
</html>