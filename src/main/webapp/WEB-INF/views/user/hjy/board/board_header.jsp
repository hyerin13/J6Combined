<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>게시판</title>
<style type="text/css">
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #333;
}
ul:after{
    content:'';
    display: block;
    clear:both;
}
li {
    float: left;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover:not(.active) {
    background-color: #111;
}
.active {
    background-color: #4CAF50;
}
</style>
<div class="board_header">
	<ul>
      <li><a class="active" href="#home">Home</a></li>
      <li><a href="/project/hjy/all">자유게시판</a></li>
      <li><a href="/project/hjy/review">공유게시판</a></li>
      <li><a href="/project/hjy/matching">매칭게시판</a></li>
    </ul>
</div>
