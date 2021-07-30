<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Google Tag Manager -->
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script async=""
	src="//www.googletagmanager.com/gtm.js?id=GTM-WGD2KX&amp;gtm_auth=tNWdwrBSQ3HlG4hXjrfEog&amp;gtm_preview=env-707&amp;gtm_cookies_win=x"></script>
<script>
	(function(w, d, s, l, i, a, p) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl + '&gtm_auth='
				+ a + '&gtm_preview=' + p + '&gtm_cookies_win=x';
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-WGD2KX',
			'tNWdwrBSQ3HlG4hXjrfEog', 'env-707');
</script>
<!-- End Google Tag Manager -->

<title>YCS - 파트너 엑스트라넷</title>
<meta name="description"
	content="Register your property on Asia’s global hotel booking site. Manage your rates, availability and hotel content">
<meta name="keywords"
	content="lodging, accommodation, manage your hotel, Agoda Extranet, manage your rates, availability, hotel content, register your hotel, list your hotel, sign up your property">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<link rel="canonical" href="https://ycs.agoda.com">
<meta http-equiv="content-language" content="en">
<meta property="og:site_name" content="Agoda YCS">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="robots" content="index, follow">


<script type="text/javascript"
	src="//cdn5.agoda.net/ycs/Scripts/libs/boomerang/1.0.0/boomerang_nav.min.js"
	async=""></script>
<script>

	// Modern browsers
	if (document.addEventListener) {
		document.addEventListener("onBoomerangLoaded", function(e) {
			// e.detail.BOOMR is a reference to the BOOMR global object
			e.detail.BOOMR.init({
				//set beacon to project's BoomController
				beacon_url : "/ko-kr/Boom/boomerangLog/0",
				beacon_type : "POST"
			});
		});
	}
	// IE 6, 7, 8 we use onPropertyChange and look for propertyName === "onBoomerangLoaded"
	else if (document.attachEvent) {
		document.attachEvent("onpropertychange", function(e) {
			if (!e)
				e = event;
			if (e.propertyName === "onBoomerangLoaded") {
				// e.detail.BOOMR is a reference to the BOOMR global object
				e.detail.BOOMR.init({
					//set beacon to project's BoomController
					beacon_url : "/ko-kr/Boom/boomerangLog/0",
					beacon_type : "POST"
				});
			}
		});
	}
</script>
<!-- Content from Master Layout -->


<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/images/logo/j6.jpg">
<link rel="icon" href="/Content/img/icons/Agoda/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="/Content/img/icons/Agoda/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/Content/img/icons/Agoda/apple-touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/Content/img/icons/Agoda/apple-touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="/Content/img/icons/Agoda/apple-touch-icon-ipad-retina.png">

<!-- End Content from Master Layout -->

<link
	href="//cdn5.agoda.net/ycs/Assets/Content/ycsold-4.0.4.af8c6482.min.css"
	rel="stylesheet" type="text/css">
<link href="//cdn5.agoda.net/ycs/Content/regis/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="//cdn5.agoda.net/ycs/Assets/Content/regis/jumbotron.3c342cba.min.css"
	rel="stylesheet" type="text/css">
<link href="//cdn5.agoda.net/ycs/Content/regis/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="//cdn5.agoda.net/ycs/Assets/Content/ycs_flags_sprite.13a4b177.min.css"
	rel="stylesheet" type="text/css">
<link href="//cdn5.agoda.net/ycs/Content/regis/select2.min.css"
	rel="stylesheet" type="text/css">
<!--[if lte IE 9]> No longer support
        <link rel='stylesheet' type='text/css' href='/Content/regis/jumbotron-ie.min.css'>
    <![endif]-->
<!--[if IE 8]>
        <style type="text/css">
            body {
                padding-top: 0px;
            }
        </style>
    <![endif]-->

<style type="text/css">
.paddingTopZero {
	padding-top: 0px !important;
}

button.ui-datepicker-close {
	display: none;
}

.modal-title {
	color: black;
	text-shadow: none;
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(enabled = false)";
	filter: none;
}

.ui-autocomplete {
	z-index: 999;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
}

.loginContinue {
	color: #F0AD4E;
	font-size: 1.0em;
}

input:invalid, textarea:invalid {
	outline-color: red;
	outline-width: thin;
}

.select2-container .select2-choice>.select2-chosen {
	font-size: 14px;
}

.select2-container .select2-choice {
	padding: 3px 0px 0px 8px;
	height: 35px !important;
}

.select2-container .select2-choice .select2-arrow b {
	background: url(//cdn5.agoda.net/ycs/Content/img/select2.png) no-repeat
		scroll 0px 4px transparent;
}

.contact-us {
	font-style: normal;
	font-weight: bold;
	line-height: 18px;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 50px;
	width: 100%;
	color: #3A74D1;
}

.contact-us a {
	font-size: 14px !important;
}
</style>



<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700"
	rel="stylesheet" type="text/css">

<!--[if lte IE 9]>
        <link href='/Content/regis/jumbotron-ie.css' rel="stylesheet" type="text/css">
    <![endif]-->
<link rel="stylesheet" type="text/css"
	href="//cdn5.agoda.net/ycs/Content/regis/star-rating.min.css">
<link rel="stylesheet" type="text/css"
	href="//cdn5.agoda.net/ycs/Content/regis/jumbotron.css">
<link rel="stylesheet" type="text/css"
	href="//cdn5.agoda.net/ycs/Content/tipsy.css">

<!--[if IE 8]>
        <style type="text/css">
            body {
                padding-top: 0px;
            }

            #map-container{
                width:100% !important;
            }
        </style>
    <![endif]-->

<style>
.select-option-check-button {
	padding: 13px;
	background: #F8F8F8;
	border: 1px solid #EFEFEF;
	margin-bottom: 3px !important;
}

.select-option-panel {
	border: none !important;
}

.select-option-panel>.panel-heading {
	background: none !important;
}

.select-button-option>label {
	padding: 8px !important;
	background: #F8F8F8 !important;
	border: 1px solid #EFEFEF !important;
	margin-bottom: 3px !important;
}

.select-button-option .active {
	color: #ffffff !important;
	background: #428BCA !important;
	border: 1px solid #3073AF;
}

.tt-query, .tt-hint {
	width: 396px;
	height: 30px;
	padding: 8px 12px;
	font-size: 24px;
	line-height: 30px;
	border: 2px solid #ccc;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	outline: none;
}

.typeahead {
	background-color: #fff;
}

.typeahead:focus {
	border: 2px solid #0097cf;
}

.tt-query {
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.tt-hint {
	color: #999;
}

.tt-dropdown-menu {
	max-height: 150px;
	overflow-y: auto;
	width: 100%;
	margin-top: 12px;
	padding: 8px 0;
	background-color: #fff;
	border: 1px solid #ccc;
	border: 1px solid rgba(0, 0, 0, 0.2);
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
}

.tt-suggestion {
	padding: 3px 20px;
	font-size: 18px;
	line-height: 24px;
}

.tt-suggestion.tt-cursor {
	color: #fff;
	background-color: #0097cf;
}

.tt-suggestion p {
	margin: 0;
}

.gist {
	font-size: 14px;
}
</style>

<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/14/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/14/util.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="main-header text-center">간단한 2단계 절차로 J6에 숙소 등록하기</h3>
		</div>
	</div>
	<div class="panel panel-default form-signup">
		<div class="panel-heading">
			<div class="row-centered marginFifteen">
				<p
					class="col-lg-4 col-md-4 col-sm-6 col-xs-11 col-centered step-text">
					<span
						class="step-number step-number-active col-lg-2 col-md-2 col-sm-1 col-xs-1">1</span>
					<span class="fontBasic">1단계: 기본 정보 작성</span>
				</p>
				<p
					class="col-lg-4 col-md-4 col-sm-6 col-xs-11 col-centered step-text">
					<span class="step-number col-lg-2 col-md-2 col-sm-1 col-xs-1">2</span>
					<span class="fontBasic"> 2단계: 등록 절차 완료 </span>
				</p>
			</div>
		</div>
		<form id="basicForm" class="form-horizontal" role="form"
			data-toggle="validator" novalidate="true">
			<div class="panel-body">
				<div class="form-group"></div>
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3 col-sm-3"
						title="호텔, 리조트, 아파트먼트와 같은 숙소의 유형을 말합니다.">숙소 유형:</label>
					<div class="col-lg-4 col-md-8 col-sm-8 col-xs-12">
						<div class="required-field-block">
							<button type="button"
								class="btn btn-default dropdown-toggle col-lg-12 col-md-12 col-sm-12 col-xs-12 ga_PType"
								data-toggle="modal" data-target="#property" id="propertyButton"
								onclick="adjustModalView();">
								<span id="propertyText">료칸</span><span class="caret"></span>
								<div class="required-icon">
									<div class="text">*</div>
								</div>
							</button>
							<input id="propertyValue" type="hidden" value="38">
						</div>
					</div>
				</div>
				<!-- Modal view property type -->
				<div id="property" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content" style="margin-top: 60px;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">팝업창을
										닫습니다.</span>
								</button>
								<h4 class="modal-title" id="myPropertyTypeLabel">정확한 숙소의
									형태를 선택해 주세요.</h4>
							</div>
							<div class="modal-body ativa-scroll">
								<!-- Default hotel type-->
								<div class="radio select-option-check-button">
									<label class="property_type_tooltip"
										original-title="레스토랑과 회의 공간을 갖추고 있으며 다양한 투숙객 서비스를 제공하는 여행자들을 위한 표준 숙소 형태">
										<input type="radio" class="pull-right" value="34" name="호텔"
										unitname="객실 수"
										onclick="_registration.SelectRadioButton('property', this);">
										호텔
									</label>
								</div>
								<hr>
								<div class="radio select-option-check-button">
									<label class="property_type_tooltip"
										original-title="장/단기 임대 가능한 개별적이며 독립적인 숙소 형태"> <input
										type="radio" class="pull-right" value="29" name="아파트먼트"
										unitname="아파트먼트 수"
										onclick="_registration.SelectRadioButton('property', this);">
										아파트먼트
									</label>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									id="propertyCancelBtn" data-dismiss="modal"
									onclick="_registration.CancelModal('property')">
									<span aria-hidden="true">취소</span>
								</button>
								<button type="button" class="btn btn-primary"
									id="propertyApplyBtn" data-dismiss="modal"
									onclick="_registration.ApplyModal('property');" disabled="">
									<span aria-hidden="true">확인</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" id="lblNoOfRooms"
						title="숙소의 총 객실 수를 입력해 주세요.">객실 수: </label>
					<div class="col-lg-4 col-md-8 col-sm-8">
						<div class="required-field-block">
							<input type="text" class="form-control form-control ga_NoRooms"
								id="txtNoOfRoom" placeholder="예) 100" required="" pattern="\d*"
								value="1">
							<div class="required-icon">
								<div class="text">*</div>
								<input type="hidden" id="isNHA"> <input type="hidden"
									id="isNHALastSelection">
							</div>
						</div>
					</div>
				</div>
				<div class="form-group ">
					<label class="control-label col-lg-3 col-md-3 col-sm-3"
						title="숙소 연락을 담당하는 관리자입니다.">담당자 이름 (영문): </label>
					<div class="col-lg-4 col-md-8 col-sm-8 col-xs-12">
						<div class="required-field-block">
							<input type="text" required=""
								class="form-control form-control ga_Name" id="txtContactName"
								placeholder="예) Gildong Hong" value="" pattern="[^@]+"
								data-error="담당자 이름에는 특수 문자가 포함될 수 없습니다.">
							<div class="help-block with-errors"></div>
							<div class="required-icon">
								<div class="text">*</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group ">
					<label for="inputEmail3" class="col-sm-3 control-label"
						title="숙소의 이메일 주소를 입력해 주세요.">이메일 주소: </label>
					<div class="col-sm-10 col-lg-4 col-md-8 col-sm-8">
						<div class="required-field-block">
							<input type="text" required=""
								class="form-control form-control ga_Email" id="txtEmailAddress"
								placeholder="예) gildonghong@myhotel.com">
							<div class="required-icon">
								<div class="text">*</div>
							</div>
						</div>
					</div>
				</div>
				<div id="pwd-container" class="form-group ">
					<label class="col-sm-3 control-label" id="lblPassword" title="비밀번호">비밀번호:
					</label>
					<div class="col-lg-4 col-md-8 col-sm-8">
						<div class="required-field-block">

							<input type="text" class="form-control" id="txtPassword"
								maxlength="20" required="">
							<ul class="error-list"></ul>
							<div class="required-icon">
								<div class="text">*</div>
							</div>
							<div class="show-password">비밀번호 표시</div>
							<div class="pwstrength_viewport_progress"
								style="margin-top: 10px;">
								<div class="progress ">
									<div class="progress-bar progress-bar-danger"
										style="width: 1%;">
										<span class="password-verdict"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-lg-12 col-md-12 col-sm-12">비밀번호는 최소 8자 이상이어야
						합니다.</div>
				</div>
				<div class="form-group"
					style="margin-top: -15px; margin-bottom: 0px;">
					<div class="col-sm-offset-3 col-sm-10 col-lg-4 col-md-8 col-sm-8"
						style="display: block">
						<label
							class="col-sm-12 col-lg-12 col-md-12 col-sm-12 agreement-text">
							회원 가입함으로써 J6의 <a class="privacy_link" target="_blank"
							href="https://cdn6.agoda.net/images/YCS/Agoda_YCS_Privacy_Policy_2021-04-29.pdf"
							rel="noreferrer">개인정보 처리방침</a>에 동의합니다.
						</label>
					</div>
				</div>
			</div>
			<div class="panel-footer clearfix"
				style="visibility: inherit; height: inherit">
				<div class="">
					<div class=" col-lg-4 col-md-12 col-sm-12 col-lg-offset-3"
						style="padding-right: 3px">
						<button id="btnContinue" type="button"
							class="btn btn-primary button_blue col-lg-12 col-md-6 col-sm-12 col-xs-12 pull-right ga_FstStepContinue">다음</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>