<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#room_info{
		position:relative;
		width:600px;
		height: 400px;
		border: 1px solid red;
	}
	#smallimg1{
		position:absolute;
		top:20px;
		left:20px;
		width: 150px;
		height: 100px;
	}
	#smallimg2{
		position:absolute;
		top:125px;
		left:21px;
		width: 72px;
		height: 50px;
	}
	#smallimg3{
		position:absolute;
		top:125px;
		left:96px;
		width: 72px;
		height: 50px;
	}
	#room_info h3{
		position: absolute;
		top:0px;
		left:200px;
	}
</style>
<body>
<!-- 이미지 크게 일단 하나 -->
<div id="content">
<img src="${pageContext.request.contextPath }/resources/images/room_info/1.jpg"
style="width:800px; height: 400px;">
	<c:forEach var="vo" items="${list }">
		<div id="room_info">
			<img src="${pageContext.request.contextPath }/resources/images/room_info/${vo.RIMAINIMG}" id="smallimg1">
			<img src="${pageContext.request.contextPath }/resources/images/room_info/${vo.RIEXTRAIMG1}" id="smallimg2">
			<img src="${pageContext.request.contextPath }/resources/images/room_info/${vo.RIEXTRAIMG2}" id="smallimg3">
			<h3>${vo.RIROOMTYPE}</h3>
		</div>
	</c:forEach>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var scrollValue=0;
		$(window).scroll(function () { 
			scrollValue = $(document).scrollTop(); 
		});
		$("#room_info img").hover(function(){
			var top=$(this).offset().top;
			var left=$(this).offset().left;
			var height=$(this).height();
			var img=$(this).attr("src");
			let str="<img src="+img+" id='addimg'>";
			if(top/2>scrollValue){
				$(str).appendTo("#content").css({
					border: '3px solid black',
					position:'absolute',
					top:top-303+'px',
					left:left+'px',
					width:'400px',
					height:'300px'
				});
			}else{
				$(str).appendTo("#content").css({
					border: '3px solid black',
					position:'absolute',
					top:top+height+'px',
					left:left+'px',
					width:'400px',
					height:'300px'
				});
			}
		},function(){
			$("#addimg").remove();
		});
	});
</script>
</html>