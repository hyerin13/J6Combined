<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
	<span style="color:red">결과코드 ${code }</span><br>
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
<button id="payment">결제</button>
<div class="footer" style="clear:both;">
	<jsp:include page="../jhr/footer.jsp" flush="true"/>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$('#payment').click(function(){
			$.ajax({
				url:'/project/kakaopay',
				dataType:'json',
				success:function(data){
					window.open(data.next_redirect_pc_url);
				},
				error:function(error){
					alert(error);
				}
			})
		})
	})
	
	
</script>
</html>