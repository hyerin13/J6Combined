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
		border-color:#BDBDBD;
		margin:2% 1% 1% 2%;
		
	}
	.totalinfo{
		float:left;
		border:solid 1px;
		width:25%;
		border-color:#BDBDBD;
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


<form class="form-inline" id="insertOk" action="${pageContext.request.contextPath }/phj/reservationOk">
	<input type="hidden" name="sum" value="${sum }"><br>
	<input type="hidden" id="ramount" name="ramount" value="${ramount }"><br>
	<input type="hidden" id="mid" name="mid" value="${mid }"><br>
	<input type="hidden" id="riid" name="riid" value="${riid }"><br>
	<input type="hidden" id="rcheckin" name="rcheckin" value="${startday } "><br>
	<input type="hidden" id="rcheckout" name="rcheckout" value="${endday }"><br>
	<input type="hidden" id="rcancel" name="rcancel" value="N"><br>
	<input type="hidden" id="aid" name="aid" value="${aid }"><br>
	<input type="hidden" id="rimaxper" name="rimaxper" value="rimaxper"><br>
	<input type="hidden" name="breakfastfee" value="breakfastfee" style="border: none"><br>
	<input type="hidden" name="bedfee" value="bedfee" style="border: none"><br>
	<input type="hidden" name="personfee" value="personfee" style="border: none"><br>
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
		<input id="engName" name="rresname" type="text" class="form-control" required size="70px" placeholder="투숙객의 이름을 입력해주세요."
		onfocus="this.placeholder=''" onblur="this.placeholder='투숙객의 이름을 입력해주세요.'"><br>
		<br>
		<label>
			이메일
		</label>
		<br>
		<input type="text" id="email" oninput="checkEmail()" class="form-control" style="color:gray" required size="70px"
		placeholder="오탈자에 주의해 주세요" onfocus="this.placeholder=''" onblur="this.placeholder='오탈자에 주의해 주세요.'"><br>
		<br>
		<label>
			이메일 재입력
		</label>
		<br>
		<input type="text" name="rresemail" id="emailcheck" size="70px" oninput="checkEmail()" class="form-control"><br>
		<div id="emailOk">
		</div>
		<br>
		<label>
			전화번호(선택 사항)
		</label>
		<br>
		<input type="text" id="rresphone"name="rresphone" size="70px" class="form-control"><br>
		<br>
		</div>
		<div>
		<label>추가</label><br>
		- 조식추가 <input type="number" name="rexbreaknum" id="rexbreaknum" value="0" min="0" max="rexperson"><br>
		- 침대추가 <input type="number" name="rexbed"id="rexbed" value="0" min="0" max="1"><br>
<!-- 		- 인원추가 <input type="number" name="rexperson" id="rexperson" value="0" min="0" max="rexperson"><br>
 -->		
		<br>
			
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
			<input type="checkbox" required="required"> 본인은 이용약관에 동의하며 18세 이상임을 확인합니다.
		</div>
		<div style="float:right; width:70%">
			<span style="color:green; font-style:bold; float:right;">부담 제로 - 예약 무료 취소 가능!</span><br>
			<input type="submit" value="마지막 단계로 이동하기" style="float:right;" id="resOk"><br>
		</div>
		</div>
</form>
<div id="hotelInfo" class="hotel">
	호텔정보
</div><br>
<div class="totalinfo">
<br>
	&nbsp;<label>  ${mid} 님의 예약현황</label><br>
	<table class="table" style="size: 90px;">
		<tr>
			<th style="size: 30px">체크인 </th>
			<td >${startday }</td>
		</tr>
		<tr>
			<th style="size: 30px">체크아웃 </th>
			<td >${endday }</td>
		</tr>
		<tr>
			<th style="size: 30px">방금액 </th>
			<td >${sum }</td>
		</tr>
		<tr>
			<th style="size: 30px">조식추가요금 </th>
			<td ><input type="text" name="breakfastfee" value="breakfastfee" style="border: none"></td>
		</tr>
		<tr>
			<th style="size: 30px">침대추가요금 </th>
			<td ><input type="text" name="bedfee" value="bedfee" style="border: none"></td>
		</tr>
<!-- 	<tr>
			<th style="size: 30px">인원추가요금 </th>
			<td ><input type="text" name="personfee" value="personfee" style="border: none"></td>
		</tr>
		 -->
	</table>
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

	$(document).ready(function(){
/*		$('#insertOk').submit(function(e){
			e.preventDefault();
			var rid=0;
			var ramount=parseInt($("#ramount").val());
			var rcheckin=parseInt($("#rcheckin").val());
			var rcheckout=parseInt($("#rcheckout").val());
			var rresname=$("#engName").val();
			var rresemail=$("#emailcheck").val();
			var rresphone=$("#rresphone").val();
			var rexbreaknum=$("#rexbreaknum").val();
			var rexbed=$("#rexbed").val();
			var rexperson=$("#rexperson").val();
			var rcancel=$("#rcancel").val();
			var mid=$("#mid").val();
			var riid=parseInt($("#riid").val());
			var rordernum=0;
			console.log("눌렸냐");
			$.ajax({
				url:'/project/phj/reservation',
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
					}else{
						alert("실패");
					}
				}
			})
		}) */
		var aid=parseInt($("#aid").val());
		$.ajax({
			url:"/project/phj/accoinfo/"+aid,
			dataType:"json",			
			success:function(d){
				console.log(aid);
				let info="";
				
				info +="<h3>"+ d.aname +"</h3>"+ "<br>" +
				 "<img src='"+d.amainimg+"'>" + "<br>" +
				 d.agrade + "<br>" +
				 d.aaddress;
				
				$("#hotelInfo").html(info);
			}
		})
/*		
		var rcheckin=parseInt($("#rcheckin").val());
		var rcheckout=parseInt($("#rcheckout").val());
		$.ajax({
			url:"/project/phj/roominfo/"+riid,
			dataType:"json",			
			success:function(data){
				console.log(data.riroomtype);
				let roominfo="";
				
				roominfo +="<h3>"+ data.riroomtype +"</h3>"+ "<br>" +
				rcheckin + "<br>" +
				rcheckout;
				
				$("#totalinfo").html(roominfo);
			}
		})*/
		var riid=parseInt($("#riid").val());
		var ramount=parseInt($("#ramount").val());
		$.ajax({
			url:"/project/phj/roominfo/"+riid,
			dataType:"json",			
			success:function(data){
				console.log("방타입 : "+data.riroomtype);
				console.log("최대인원 : "+data.rimaxper);
				var rexperson=data.rimaxper-ramount;
				console.log("인원추가 : " + rexperson);
				$('input[name=rimaxper]').attr('value',data.rimaxper);
				$('input[name=rexperson]').attr('max',rexperson);
				$('input[name=rexbreaknum]').attr('max',rexperson);
			}
		})
		$.ajax({
			url:"/project/phj/addfee/"+riid,
			dataType:"json",			
			success:function(e){
				console.log("인원추가 : "+e.personfee);
				console.log("침대추가 : "+e.bedfee);
				console.log("조식추가 : "+e.breakfastfee);
				$('input[name=personfee]').attr('value',e.personfee);
				$('input[name=bedfee]').attr('value',e.bedfee);
				$('input[name=breakfastfee]').attr('value',e.breakfastfee);
			}
		})
	})
</script>
</html>