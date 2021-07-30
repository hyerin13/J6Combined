<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	$("#search").click(function(){
		let checkin=$("#checkin").val();
		let checkout=$("#checkout").val();
		$.ajax({
			url:"project/lhjcjy/firstsearch",
			data:{"rcheckin":checkin, "rcheckout":checkout},
			type:"post",
			dataType:"json",
			success:function(data){
				$(data.)
			}
		})
	})
})
</script>
</head>
<body>
<h1>숙소이름</h1>
<div>
<h3>호텔 검색</h3>

체크인
<input type="date" name="checkin">
체크아웃
<input type="date" name="checkout">
<input type="button" value="검색" id="search">

</div>
</body>
</html>