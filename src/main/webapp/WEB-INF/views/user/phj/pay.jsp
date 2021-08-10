<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
	총가격<input type="text" value="${sum }">
	예약아이디<input type="text" id="rid" value="${rid }">
	인원<input type="text" id="ramount" value="${ramount }">
	체크인<input type="text" id="rcheckin" value="${rcheckin }">
	체크아웃<input type="text" id="rcheckout" value="${rcheckout }">
	예약자이름<input type="text" id="rresname" value="${rresname }">
	이메일<input type="text" id="rresemail" value="${rresemail }">
	전화번호<input type="text" id="rresphone" value="${rresphone }">
	조식추가<input type="text" id="rexbreaknum" value="${rexbreaknum }">
	침대추가<input type="text" id="rexbed" value="${rexbed }">
	인원추가<input type="text" id="rexperson" value="${rexperson }">
	취소여부<input type="text" id="rcancel" value="${rcancel }">
	예약자 아이디<input type="text" id="mid" value="${mid }">
	객실아이디<input type="text" id="riid" value="${riid }">
	객실예약번호<input type="text" id="rordernum" value="${rordernum }">
	<br>
	<br>
	<span style="border:solid; border-color:gray">안전 결제  | 모든 카드 정보는 왼벽하게 암호화되어 안전하게 보호됩니다.</span>
	<br>
	<br>
	<div >
	<input type="button" id="card" value="신용/직불카드">
	
	<input type="button" id="kakao" value="카카오 바로결제">

	</div>
</div>

<div class="footer" style="clear:both;">
	<jsp:include page="../jhr/footer.jsp" flush="true"/>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$('#kakao').click(function(){
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
	
	$("#card").click(function () {
		var rid=0;
		var ramount=parseInt($("#ramount").val());
		var rcheckin=$("#rcheckin").val();
		var rcheckout=$("#rcheckout").val();
		var rresname=$("#rresname").val();
		var rresemail=$("#rresemail").val();
		var rresphone=$("#rresphone").val();
		var rexbreaknum=$("#rexbreaknum").val();
		var rexbed=$("#rexbed").val();
		var rexperson=$("#rexperson").val();
		var rcancel=$("#rcancel").val();
		var mid=$("#mid").val();
		var riid=parseInt($("#riid").val());
		var rordernum=0;
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp42648943');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드imp42648943
		IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: '주문명:결제테스트',
		//결제창에서 보여질 이름
		amount: 1000,
		//가격
		buyer_email: 'guswn3618@gmail.com',
		buyer_name: '박현주',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: '/project/approval'
		/*
		모바일 결제시,
		결제가 끝나고 랜딩되는 URL을 지정
		(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		*/
		}, function (rsp) {
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			$.ajax({
				url:'/project/phj/insert',
				data:JSON.stringify({"rid":rid,"rordernum":rordernum,"ramount":ramount,"rcheckin":rcheckin,"rcheckout":rcheckout,
					"rresname":rresname,"rresphone":rresphone,"rresemail":rresemail,"rexbreaknum":rexbreaknum,
					"rexbed":rexbed,"rexperson":rexperson,"rcancel":rcancel,"mid":mid,"riid":riid}),
				type:"post",
				dataType:"json",
				contentType:'application/json',
				success:function(data){
					console.log(data);
					if(data.code=='success'){
						console.log(data.code);
						location.href="/project/approval";
					}else{
						alert("실패");
					}
				}
			})
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
		});
});
</script>
</html>