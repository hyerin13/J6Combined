<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>게시판</title>
<style type="text/css">
.ulcss {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #333;
}
.ulcss:after{
    content:'';
    display: block;
    clear:both;
}
.licss {
    float: left;
}
.licss a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.licss a:hover:not(.active) {
    background-color: #111;
}
.active {
    background-color: #00AEF0;
    margin:0px;
}
</style>
<div class="board_header">
	<ul class="ulcss">
      <li class="licss"><a class="active" href="/project/phj/home">MyPage</a></li>
      <li class="licss"><a href="/project/hjy/all">자유게시판</a></li>
      <li class="licss"><a href="/project/hjy/review">공유게시판</a></li>
      <li class="licss"><a href="/project/hjy/matching">매칭게시판</a></li>
    </ul>
</div>
