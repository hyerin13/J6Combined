<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/final/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	/*
	$("#search").click(function(){
		let checkin=$("#checkin").val();
		let checkout=$("#checkout").val();
		$.ajax({
			url:"project/lhjcjy/firstsearch",
			data:{"rcheckin":checkin, "rcheckout":checkout},
			type:"post",
			dataType:"json",
			success:function(data){
				$(data.list)
			}
		})
	}),
	*/
	$("#searchHotel").autocomplete({
		source:function(request,response){
			let aname=$("#searchHotel").val();
			$.ajax({
				type:'get',
				url:"/lhjcjy/ajax/auto",
				data:{"aname":aname},
				dataType:"json",
				success:function(data){
					response(
						$.map(data,function(i){
							return{
								label:i.aname,
								value:i.aname
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
		classes:{
			"ui-autocomplete":"highlight"
		},
		delay:500, //검색창에 글자 쓰고 autocomplete되기까지 딜레이 시간ms)
		//disabled:true, //자동완성기능 끄기
		position:{my:"right top", at:"right bottom"},
		close:function(event){
			console.log(event);
		}
	});
});
</script>
</head>
<body>
<h1>숙소이름</h1>
<div>
<h3>호텔 검색</h3>
검색
<input type="text" id="searchHotel"><br>

체크인
<input type="date" name="checkin"><br>
체크아웃
<input type="date" name="checkout"><br>
<input type="button" value="검색" id="search">

</div>
</body>
</html>