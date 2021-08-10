<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bg-orange {
	background: #d8622b;
	color: #fff !important;
}

body {
	background: #f4f4f4;
}

img {
	width: 100%;
	max-height: 560px;
}

a {
	color: #696969;
}

/*별점 칠하기 css*/
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 0px;
	justify-content: space-around;
	padding: 0 0.2em;
	width: 100px;
}

/*기존 라디오 버튼 사라짐*/
.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}
/*클릭시 변경*/
.star-rating :checked ~ label {
	-webkit-text-fill-color: red;
}
/*호버시 변경*/
.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: pink;
}
</style>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<!--banner section-->
	<section class="title-banner py-4 bg-orange" id="title-banner">
		<div class="container py-5">
			<div class="row">
				<h4>About Us</h4>
			</div>
		</div>
	</section>
	<!--filter section-->
	<div class="container">
		<div class="row ">
			<div class="col-md-12">
				<div class="bg-secondary">
					<div class="card-body">
						<div class="row">
							<div class="col-md-3">
								<form method="post"
									action="${pageContext.request.contextPath }/hjy/firstsearch">
									<div class="form-group">
										<div class="form-control">
											호텔명 or 지역 <input type="text" id="searchHotel"
												name="searchHotel" value="${aaddress }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											체크인 <input type="date" name="checkin" value="${rcheckin }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											체크아웃 <input type="date" name="checkout" value="${rcheckout }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											<label for="filter">객실수</label> <input type="number" min="1"
												id="countRoom" name="countRoom" value="${countRoom }">
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											<label for="contain">인원수</label> <input type="number" min="1"
												id="countPeople" name="countPeople" value="${rimaxper }">
										</div>
									</div>
									<input type="submit" value="검색" id="search" class="btn bg-orange secondary btn-block">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--main content section-->
	<section class="mb-5">
		<div class="container">
			<div class="row title py-3">
				<div class="col-md-12">
					<h5>
						<strong>검색결과</strong>
					</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="row mb-3">
						<div class="col-md-12">
								<div class="card">
									<div id="accordion">
									    <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#map" aria-expanded="true">
									          지도
									        </button>
									      </h2>
									    </div>
									    <div id="map" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														시간되면 지도 넣기
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#favorite" aria-expanded="true">
									          즐겨찾기
									        </button>
									      </h2>
									    </div>
									    <div id="favorite" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
								      		<ul class="list-unstyled">
									      		<li>
													<input type="checkbox">즐겨찾기 선호호텔체인
												</li>
											</ul>
									      </div>
									   </div>
									   <script type="text/javascript">
									   function list(facilities){
										   $.ajax({
												url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
												traditional :true,
												data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}","facilities":facilities},
												type:"post",
												dataType:"json",
												success:function(data){
													if(data.code=='success'){
													   $("#list").empty();
													   let html = "";
													   for (var i = 0; i < data.list.length; i++) {
															html+="<div class='row mb-3'>";
															html+="<div class='col-md-12'>";
															html+="<div class='card'>";
															html+="<div class='card-body'>";
															html+="<div class='row'>";
															html+="<div class='col-md-3'>";
															if(data.list[i].amainimg==null){
																html+="<img src='${pageContext.request.contextPath }/resources/img/220i0z000000mulfw433F_Z_1080_808_R5_D.jsp' width='300' height='250'>";
															}else{
																html+="<img src='${pageContext.request.contextPath }/resources/hjy/hotelmain/"+data.list[i].amainimg+"'width='300' height='250'>";
															}
															html+="</div>";
															html+="<div class='col-md-7'>";
															html+="<h3>"+data.list[i].aname+"</h3>";
															html+="<small>"+data.list[i].aaddress+"</small>";
															html+="<p>";
															html+="<small>지도보기?뭐든추가</small>";
															html+="</p>";
															html+="</div>";
															html+="<div class='col-md-2'>";
															html+="<h5>"+data.list[i].sum+"원</h5>";
															html+="<button class='btn' onclick=\"";
															html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID="+data.list[i].aid;
															html+="&person="+${rimaxper}+"&roomnum="+${countRoom}+"&startday="+${rcheckin}+"&endday="+${rcheckout}
															html+="'\">예약하기</button>";
															html+="</div>";
															html+="</div>";
															html+="</div>";
															html+="</div>";
															html+="</div>";
															html+="</div>";
														}
													   $("#list").append(html);
													}else{
														alert("fail")
													}
												}
											})
									   }
											$(document).ready(function() {
												$("#accordion button").click(function() {
													if($($(this).attr('data-target')).attr('class')=='collapse show'){
														$($(this).attr('data-target')).attr('class','collapse')
													}else{
														$($(this).attr('data-target')).attr('class','collapse show')
													}
												});
												
												//편의시설 ajax 준비
												$("#facilities input").click(function() {
													alert('짖입')
													let templist= new Array(); 
													$("#facilities input").each(function(){
												    	if( $(this).is(":checked") == true ){
													      	var temId = $(this).attr('id');
													      	templist.push(temId);
												    	}
												  	});
													list(templist);
												})
											});
										</script>
									    <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#hotelGrades" aria-expanded="true">
									          호텔등급
									        </button>
									      </h2>
									    </div>
									    <div id="hotelGrades" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<div class="star-rating space-x-4 mx-auto">
															<input type="radio" id="5-stars" name="agrade" value="5"
																v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
															<input type="radio" id="4-stars" name="agrade" value="4"
																v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
																type="radio" id="3-stars" name="agrade" value="3" v-model="ratings" />
															<label for="3-stars" class="star">★</label> <input type="radio"
																id="2-stars" name="agrade" value="2" v-model="ratings" /> <label
																for="2-stars" class="star">★</label> <input type="radio"
																id="1-star" name="agrade" value="1" v-model="ratings" /> <label
																for="1-star" class="star">★</label>
														</div>
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#costomgrade" aria-expanded="true">
									          고객평점
									        </button>
									      </h2>
									    </div>
									    <div id="costomgrade" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<div class="star-rating space-x-4 mx-auto">
															<input type="radio" id="5-stars" name="agrade" value="5"
																v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
															<input type="radio" id="4-stars" name="agrade" value="4"
																v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
																type="radio" id="3-stars" name="agrade" value="3" v-model="ratings" />
															<label for="3-stars" class="star">★</label> <input type="radio"
																id="2-stars" name="agrade" value="2" v-model="ratings" /> <label
																for="2-stars" class="star">★</label> <input type="radio"
																id="1-star" name="agrade" value="1" v-model="ratings" /> <label
																for="1-star" class="star">★</label>
														</div>
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#price" aria-expanded="true">
									          가격
									        </button>
									      </h2>
									    </div>
									    <div id="price" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#forFree" aria-expanded="true">
									          무료제공
									        </button>
									      </h2>
									    </div>
									    <div id="forFree" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="checkbox">조식포함
													</li>
													<li>
														<input type="checkbox">무료주차
													</li>
													<li>
														<input type="checkbox">무료인터넷
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#AccommodationName" aria-expanded="true">
									          숙소명
									        </button>
									      </h2>
									    </div>
									    <div id="AccommodationName" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="text" placeholder="숙소명">
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#location" aria-expanded="true">
									          위치
									        </button>
									      </h2>
									    </div>
									    <div id="location" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="text" placeholder="랜드마크 혹은 도로명주소"><br>
													</li>
													<li>
														인근반경
													</li>
													<li>
														<select>
															<option>거리 상관없음</option>
															<option>0.5km</option>
															<option>1km</option>
															<option>2km</option>
															<option>5km</option>
															<option>10km</option>
														</select>
													</li>
												</ul>
									      </div>
									   </div>
									   <div class="card-header">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#facilities" aria-expanded="true">
									          편의시설
									        </button>
									      </h2>
									    </div>
									    <div id="facilities" class="collapse show" aria-labelledby="headingOne">
									      <div class="card-body">
									      		<ul class="list-unstyled">
													<li>
														<input type="checkbox" id="금연">금연
													</li>
													<li>
														<input type="checkbox" id="수영장">수영장
													</li>
													<li>
														<input type="checkbox" id="스파">스파
													</li>
													<li>
														<input type="checkbox" id="욕조">욕조
													</li>
													<li>
														<input type="checkbox" id="wifi">wifi
													</li>
													<li>
														<input type="checkbox" id="피트니스">피트니스
													</li>
												</ul>
									      </div>
									   </div>
									</div>
								</div>
							</div>
						</div>
					</div>
			<div class="col-md-9" id="list">
				<c:forEach var="vo" items="${list }">
					<div class="row mb-3">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-3">
											<c:choose>
												<c:when test="${vo.amainimg eq null}">
													<!-- 
														src="${pageContext.request.contextPath }/resources/img/220i0z000000mulfw433F_Z_1080_808_R5_D.jsp"
													 -->
													<img
														src=""
														width="300" height="250">
												</c:when>
												<c:otherwise>
													<!-- 
														src="${pageContext.request.contextPath }/resources/hjy/hotelmain/${vo.amainimg }"
													 -->
													<img src=""
														width="300" height="250">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-md-7">
											<h3>${vo.aname }</h3>
											<small>${vo.aaddress }</small>
											<p>
												<small>지도보기?뭐든추가</small>
											</p>
										</div>
										<div class="col-md-2">
											<h5>${vo.SUM}원</h5>
											<button class="btn"
												onclick="location.href='${pageContext.request.contextPath }/user/kjy/room_info?AID=${vo.aid}&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}'">예약하기</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
	</section>
	<!--cta section-->
	<section class="py-4 bg-orange">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h2>Best Place to Find information</h2>
				</div>
				<div class="col-md-4">
					<buttton type="button" class="btn btn-outline-light">Find
					Out Now</buttton>
				</div>

			</div>
		</div>
	</section>
	<!--footer section-->
	<section class="py-5 bg-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h5>About Us</h5>
					<p>Lorem Ipsum Generator. With our simple and useful tool you
						can generate a standard text which you can place in your web
						design to look more realistic.</p>
				</div>
				<div class="col-md-3">footer two</div>
				<div class="col-md-3">footer three</div>
				<div class="col-md-3">footer four</div>
			</div>
		</div>
	</section>

	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</body>
</html>