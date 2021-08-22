<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body >
	<div class="header">
		<jsp:include page="../jhr/header.jsp" flush="true"/>
	</div>
	<div style="text-align: center;">
	<br>
	<img src="${pageContext.request.contextPath }/resources/images/accommodations/approval.jpg" style="width:30%;height: 30%;">
	<br>
	<br>
	<table class="table">
		<tr>
			<th style="font-size: 20px;text-align: center;">${mid }님의 예약이 완료되었습니다!</th>
		</tr>
		<tr>
			<td style="font-size: 17px;text-align: center;">예약 확인은 <a href="">마이페이지</a>에서 해주세요!</td>
		</tr>
	</table>
		</div>
	<div class="footer" style="clear:both;">
		<jsp:include page="../jhr/footer.jsp" flush="true"/>
	</div>
</body>
<script type="text/javascript">
/*	$(document).ready(function(){
		var mid=$("#mid").val();
		$.ajax({
			url:"/project/phj/checkReservation/"+mid,
			dataType:"json",			
			success:function(e){
				let info="";
				info +=e.rordernum

				$('#rnum').html(info);
			}
		})
	})
	rrodernum
	*/
</script>
</html>