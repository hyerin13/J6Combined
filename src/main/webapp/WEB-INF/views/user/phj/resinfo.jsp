<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style>
	.box{
		float:left;
		width:650px;
		border:solid 1px;
		border-color:#BDBDBD;
		border-image:liner-gradient(to right,gray,white);
		margin:2% 2% 2% 2%;
		padding:7px;
	}
	.hotel{
		float:left;
		border:solid 1px;
		width:25%;
		margin:2% 1% 1% 2%;
		
	}
	.totalinfo{
		float:left;
		border:solid 1px;
		margin:1% 1% 1% 2%;
	}
	.bill{
		float:left;
		border:solid 1px;
		margin:1% 1% 1% 2%;
	}
	.labelpadding{
		margin:10px 10px 20px 0px;
	}
	.sInput{
		width:450px;
		height:30px;
	}
	
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../jhr/header.jsp" flush="true"/>
	</div>

<form class="form-inline" >
<div class="box">
	<label>
	<< 고객님의 정보를 입력해 주세요 >>
	</label><br>
	<br>
	<div class="form-group ">
	<label >
		영문이름
	</label>
	<br>
	<input id="endName" type="text" class="form-control" required><br>
	<br>
	<label>
		이메일
	</label>
	<br>
	<input type="text" id="email" oninput="checkEmail()" class="form-control" style="color:gray" required
	placeholder="오탈자에 주의해 주세요" onfocus="this.placeholder=''" onblur="this.placeholder='오탈자에 주의해 주세요'"><br>
	<br>
	<label>
		이메일 재입력
	</label>
	<br>
	<input type="text" id="emailcheck" oninput="checkEmail()" class="form-control"><br>
	<div id="emailOk">
	</div>
	<br>
	<label>
		전화번호(선택 사항)
	</label>
	<br>
	<input type="text" class="form-control"><br>
	<br>
	</div>
	<div>
	<label>
		거주 국가/지역<br>
		<select>
			<option value="212">대한민국</option>
			<option value="198">말레이시아</option>
			<option value="181">미국</option>
			<option value="114">싱가포르</option>
			<option value="107">영국</option>
			<option value="192">인도네시아</option>
			<option value="3">일본</option>
			<option value="191">중국</option>
			<option value="106">태국</option>
			<option value="139">호주</option>
		</select>
	</label><br>
	<br>
	<input id="bookForSomeoneElse" name="bookForSomeoneElse" type ="checkbox">
	<span>예약자와 투숙자가 다를 경우 클릭해서 투숙객 정보를 입력해 주세요.</span><br>
	<div id="elseInfo">
		
	</div>
	<br>
	<label>
		<< 특별 요청하기 >><br>
		<span>특별 요청 사항 반영 여부는 숙소 여건에 따라 달라질 수 있습니다. 예약 완료 즉시 요청 사항을 숙소/호스트에게 전달 하겠습니다.</span><br>
	</label>
	<div>
		급연/흡연 가능 객실 선택(이용 가능 여부는 여건에 따라 달라질 수 있음)<br>
		<input type="radio" value="non-smoking"> 금연 객실
		<input type="radio" value="smoking"> 흡연 객실<br>
		침대 구성 선택(이용 가능 여부는 여건에 따라 달라질 수 있음)<br>
		<input type="radio" value="onebed"> 큰 침대를 원합니다
		<input type="radio" value="twobed"> 트윈베드를 원합니다<br>
	</div>
	<span>
		특별 요청 사항 더 추가하기<br>
	</span><br>
	<label>
		<< 숙소 도착 예정 시간 >><br>
		<span>더 원활한 체크인을 위해 숙소 도착 예정 시간을 숙소 혹은 호스트에게 전달해 드립니다.</span><br>
	</label>
	<select>
			<option>미정</option>
		<optgroup label="오전">
			<option value="0-2">00:00-02:00</option>
			<option value="2-4">02:00-04:00</option>
			<option value="4-6">04:00-06:00</option>
			<option value="6-8">06:00-08:00</option>
			<option value="8-10">08:00-10:00</option>
			<option value="10-12">10:00-12:00</option>
		</optgroup>
		<optgroup label="오후">
			<option value="12-2">12:00-02:00</option>
			<option value="2-4">02:00-04:00</option>
			<option value="4-6">04:00-06:00</option>
			<option value="6-8">06:00-08:00</option>
			<option value="8-10">08:00-10:00</option>
			<option value="10-0">10:00-00:00</option>
		</optgroup>
	</select>
	<div>
		<input type="checkbox"> 본인은 이용약관에 동의하며 18세 이상임을 확인합니다.
	</div>
	<div style="float:right; width:70%">
		<span style="color:green; font-style:bold; float:right;">부담 제로 - 예약 무료 취소 가능!</span><br>
		<a href="${pageContext.request.contextPath }/pay"><input type="button" value="마지막 단계로 이동하기" style="float:right;" id="resOk"></a><br>
		<span style="color:green; font-style:bold; float:right;">즉시 예약해 이 객실과 요금을 확보하세요!</span><br>
	</div>
	</div>
</div>
</form>
<div id="hotelInfo" class="hotel">
	호텔정보
</div><br>
<div class="totalinfo">
	예약정보
</div><br>
<div class="bill">
	결제가격
</div><br>
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
	$(function(){
		$('#resOk').click(function(){
			let rresname=$("#engName").val();
			let rresemail=$("#emailcheck").val();
			$.ajax({
				url:'/project/reservation',
				data:{"rresname":rresname,"rresemail":rresemail},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.code=='예약성공'){
						alert(data.code);
					}else{
						alert("실패");
					}
				}
			})
		})
	})
</script>
</html>