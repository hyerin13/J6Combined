<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>J6 Homes | 숙소를 등록해 추가 수익을 올려보세요!</title>
<meta name="description"
	content="아시아를 선도하는 휴가용 숙소 렌탈 플랫폼에서 무료 호스팅을 즐겨 보세요. 쉽고 간편하게 숙소를 등록하고 타 예약 사이트의 예약을 동기화해 양질의 예약을 받아 보세요!">
<link href="//cdn5.agoda.net/ycs/dist/vendor-78af6b08c69dfc86ad1c-p.css"
	rel="stylesheet">

<link
	href="//cdn5.agoda.net/ycs/dist/propertyWizard-818194971d9fc251c7c3-p.css"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/images/logo/j6.jpg">


<script>
	(function() {
		if (window.BOOMR && window.BOOMR.version) {
			return;
		}
		if (!window.BOOMR) {
			window.BOOMR = {};
		}
		var pageName = "PropertyWizard";
		var baseUrl = "//hostmanage.agoda.com";
		var cultureCode = "ko-kr";
		// Defining the record critical time count per page;
		window.BOOMR.recordCriticalTimeCount = {
			"basic" : 1,
			"amenties" : 1,
			"photos" : 1
		}
		window.BOOMR.recordCriticalTimeNumber = window.BOOMR.recordCriticalTimeCount[window.BOOMR.pageName] || 0;
		window.BOOMR.recordCriticalTime = function() {
			if (!window.performance || !window.performance.mark)
				return;
			window.performance.mark("mark_critical_load");
			if (window.BOOMR && window.BOOMR.sendBeacon) {
				window.BOOMR.sendBeacon();
			}
		}
		var dom, doc, where, iframe = document.createElement('iframe');
		iframe.src = "javascript:void(0)";
		(iframe.frameElement || iframe).style.cssText = "display:none;";
		var where = document.getElementsByTagName('script')[0];
		where.parentNode.insertBefore(iframe, where);
		try {
			doc = iframe.contentWindow.document;
		} catch (e) {
			dom = document.domain;
			iframe.src = "javascript:var d=document.open();d.domain='" + dom
					+ "';void(0);";
			doc = iframe.contentWindow.document;
		}
		if (pageName.toLowerCase() === "hostconnect") {
			var currentPage = window.location.href.match(/([^\/]*)\/*$/)[1];
			if (currentPage.indexOf('?') > -1) {
				currentPage = currentPage.split('?')[0];
			}
			if (currentPage.toLowerCase() === "hostconnect") {
				currentPage = "basic";
			}
		} else {
			currentPage = pageName;
		}
		window.BOOMR.pageName = currentPage.toLowerCase();
		var initBoom = function() {
			window.BOOMR.init({
				beacon_url : "/homes/" + cultureCode
						+ "/api/data/PerformanceApi/store",
				beacon_type : "POST",
				autorun : false
			});
			window.BOOMR.addVar('page', window.BOOMR.pageName);
		};
		if (document.addEventListener) {
			document.addEventListener("onBoomerangLoaded", function(e) {
				initBoom();
			});
		} else if (document.attachEvent) {
			document.attachEvent("onpropertychange", function(e) {
				if (!e)
					e = event;
				if (e.propertyName === "onBoomerangLoaded") {
					initBoom();
				}
			});
		}

		doc.open()._l = function() {
			var bootstrapJs = this.createElement("script");
			bootstrapJs.src = "//cdn5.agoda.net/ycs/dist/manifest-b3eaeae06926be4dbec2-p.js";

			var js = this.createElement("script");
			if (dom)
				this.domain = dom;
			js.id = "boomr-if-as";
			js.src = "//cdn5.agoda.net/ycs/dist/boomerang-lazy-4a6c9e2357f6527cbfe9.js";

			this.body.appendChild(bootstrapJs);
			this.body.appendChild(js);
		};
		doc.write('<bod');
		doc.write('y onload="document._l();">');
		doc.close();
		window.onload = function() {
			setTimeout(function() {
				window.BOOMR.page_ready();
			}, 100);
		};
	}());
</script>

<script type="text/javascript">
	var isInternalUser = 'False' === 'True' ? true : false;
	var agodahomes = agodahomes || {};
	agodahomes = {
		webServerName : 'HK-HOSTM-2011',
		sessionId : 'avpe2xiqumwgwkbnvw2tetjp',
		isInternalUser : isInternalUser,
		authUserId : '',
		currency : '',
		memberId : 0,
		propertyId : 0
	};
</script>
<link rel="stylesheet" type="text/css"
	href="//cdn5.agoda.net/ycs/dist/pw-property-type-f6c12dffd2458883ab82-p.css">
<script charset="utf-8"
	src="//cdn5.agoda.net/ycs/dist/pw-property-type-lazy-73925cc1f0e6e29a5168.js"></script>
<script type="text/javascript" async=""
	src="//tags.tiqcdn.com/utag/agoda/main/prod/utag.333.js?utv=201801030902"
	id="utag_agoda.main_333"></script>
<script type="text/javascript" async=""
	src="//tags.tiqcdn.com/utag/agoda/main/prod/utag.658.js?utv=201612070226"
	id="utag_agoda.main_658"></script>
<script type="text/javascript" async=""
	src="//tags.tiqcdn.com/utag/agoda/main/prod/utag.670.js?utv=201701201029"
	id="utag_agoda.main_670"></script>
<script type="text/javascript" async=""
	src="//tags.tiqcdn.com/utag/agoda/main/prod/utag.672.js?utv=201703030442"
	id="utag_agoda.main_672"></script>
<script type="text/javascript" async=""
	src="//tags.tiqcdn.com/utag/agoda/main/prod/utag.738.js?utv=201707081604"
	id="utag_agoda.main_738"></script>
<script charset="utf-8"
	src="//cdn5.agoda.net/ycs/dist/vendors~facilities~onboarding-basics~photos~pw-property-category~pw-property-unit~room-setup-lazy-2fc01756ec2f046e5bf2.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn5.agoda.net/ycs/dist/pw-property-category-958349a872ffa415d24d-p.css">
<script charset="utf-8"
	src="//cdn5.agoda.net/ycs/dist/pw-property-category-lazy-421b16e3d6e17af4a561.js"></script>
</head>

<body class="ko-kr">
	<div id="root">
		<div class="property-wizard">
			<nav class="agoda-header navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<div class="navbar-brand">
							<a target="_blank" href="//www.agoda.com"> <img
								class="agoda-logo"
								src="${pageContext.request.contextPath }/resources/images/logo/j6.jpg"
								width="auto" height="37" title="J6" alt="J6">
							</a>
						</div>
					</div>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="row-no-margin row">
					<div class="main-content">
						<div>
							<form action="#" class="inner-property-category-form">
								<div class="m-t-6 m-b-8">
									<h2>숙소 종류 선택</h2>
									<p class="m-b-4">아래 해당하는 숙소 종류 한 가지를 선택해 주세요</p>
									<div class="m-b-8 panel panel-default">
										<div class="panel-body">
											<p>
												<strong>숙소 종류</strong>
											</p>
											<div class="w-100">
												<div class="category m-b-0 form-group">
													<div
														class="regular-radio panel panel-body rounded-0 m-r-3 radio">
														<label title=""><input
															data-element-name="property-wizard-property-category-selector"
															name="propertyCategoryId" type="radio" value="32">
															<div class="p-l-2">
																<span class="regular-radio-title">게스트하우스 / 비앤비</span>임대
																가능한 별도 공간이 내부에 있는, 호스트와 투숙객이 함께 사용하는 프라이빗 하우스/주택
															</div></label>
													</div>
													<div
														class="regular-radio panel panel-body rounded-0 m-r-3 radio">
														<label title=""><input
															data-element-name="property-wizard-property-category-selector"
															name="propertyCategoryId" type="radio" value="33">
															<div class="p-l-2">
																<span class="regular-radio-title">호스텔</span>도미토리형 침대 배열과
																공용 욕실을 갖춘 저가/경제형 숙박 시설
															</div></label>
													</div>
													<div
														class="regular-radio panel panel-body rounded-0 m-r-3 radio">
														<label title=""><input
															data-element-name="property-wizard-property-category-selector"
															name="propertyCategoryId" type="radio" value="34">
															<div class="p-l-2">
																<span class="regular-radio-title">호텔</span>공용 편의 시설,
																레스토랑 및 서비스 이용이 가능한, 숙소 유닛 여러 개가 있는 건물
															</div></label>
													</div>
													<div
														class="regular-radio panel panel-body rounded-0 m-r-3 radio">
														<label title=""><input
															data-element-name="property-wizard-property-category-selector"
															name="propertyCategoryId" type="radio" value="35">
															<div class="p-l-2">
																<span class="regular-radio-title">모텔</span>최소 서비스가 제공되는,
																자동차 여행객용 저가/경제형 도로변 호텔
															</div></label>
													</div>
													<div
														class="regular-radio panel panel-body rounded-0 m-r-3 radio">
														<label title=""><input
															data-element-name="property-wizard-property-category-selector"
															name="propertyCategoryId" type="radio" value="37">
															<div class="p-l-2">
																<span class="regular-radio-title">리조트</span>현지 환경/지형과
																어우러진 휴가용 호텔
															</div></label>
													</div>
													<div
														class="regular-radio panel panel-body rounded-0 m-r-3 radio">
														<label title=""><input
															data-element-name="property-wizard-property-category-selector"
															name="propertyCategoryId" type="radio" value="38">
															<div class="p-l-2">
																<span class="regular-radio-title">료칸</span>식사 서비스가 제공되는
																일본 전통 여관
															</div></label>
													</div>
												</div>
											</div>
											<p data-element-name="property-wizard-see-more-options-link"
												class="see-more m-t-2 text-uppercase cursor-pointer">숙소
												종류 더 보기</p>
										</div>
									</div>
								</div>
								<div class="action-panel-container row">
									<div class="action-panel-messages-outside col-lg-6 col-md-5"></div>
									<div
										class="text-right action-panel-buttons-container hidden-xs col-lg-6 col-md-7">
										<button type="button"
											data-element-name="property-wizard-previous-button"
											class="btn-min-width-160 btn-outline-primary text-uppercase cancel-btn btn btn-primary">이전</button>
										<button type="submit"
											data-element-name="property-wizard-next-button"
											class="ladda-btn btn-min-width-160 text-uppercase submit-btn btn btn-primary">다음</button>
									</div>
									<div
										class="text-right action-panel-buttons-container visible-xs col-lg-6 col-md-7">
										<button type="submit"
											data-element-name="property-wizard-next-button"
											class="ladda-btn btn-min-width-160 text-uppercase submit-btn btn btn-primary">다음</button>
										<button type="button"
											data-element-name="property-wizard-previous-button"
											class="btn-min-width-160 btn-outline-primary text-uppercase cancel-btn btn btn-primary">이전</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="json-island" type="application/json">
        {"pageTitle":"J6 Homes | 숙소를 등록해 추가 수익을 올려보세요!",
"pageDescription":"아시아를 선도하는 휴가용 숙소 렌탈 플랫폼에서 무료 호스팅을 즐겨 보세요. 쉽고 간편하게 숙소를 등록하고 타 예약 사이트의 예약을 동기화해 양질의 예약을 받아 보세요!","signInText":"로그인","youHaveUnsavedChangesText":"저장하지 않은 변경 사항이 있습니다. 변경 사항을 저장하지 않고 계속 진행하시겠습니까?","saveAndExitText":"저장하고 나가기","nextText":"다음","previousText":"이전","nextButtonVerifiedAllFieldsText":"저장하려면 모든 미입력 항목을 정확하게 입력해 주세요.","comeBackLaterText":"There is an error right now, please come back later","defaultServerErrorMessage":"정보를 저장하던 중에 오류가 발생했습니다. 다시 시도해 주세요. 문제가 지속되는 경우 J4 고객 지원 센터로 연락해 주시기 바랍니다.","actionPanelComponentViewModel":{"submitBtnText":"저장","cancelBtnText":"취소","successMessageText":"저장됨","yourChangesHaveBeenSavedText":"Your changes have been saved! Updated content will appear on the website within 6 hours.","errorMessageText":"정보를 저장하던 중에 오류가 발생했습니다. 다시 시도해 주세요. 문제가 지속되는 경우 J4 고객 지원 센터로 연락해 주시기 바랍니다.","accommodationChangeSuccessMessage":"변경 사항이 저장되었습니다. {0}으로 이동해 추가 투숙객에 대한 요금이 제대로 설정되어 있는지 확인하시기 바랍니다.","calenderInSuccessMessage":"Calendar","pricingSettingText":"요금 설정","nextBtnText":"다음","previousBtnText":"이전"},"allMaterialHereinText":"All material herein © 2005 – 2021 J6 Company Pte. Ltd., All Rights Reserved.","J6IsPartOfBookingHoldingText":"아고다는 온라인 여행 및 관련 서비스 분야의 세계적인 선도 기업인 Booking Holdings Inc.의 일부입니다.","needHelpText":"도움말 센터","listNowText":"숙소 등록","J6WebsiteUrl":"//www.J6.com"}
    </script>
	<span id="cultureCode" class="hidden">ko-kr</span>
	<span id="propertyId" class="hidden">0</span>
	<span id="environment" class="hidden">prod</span>
	<script type="text/javascript"
		src="//cdn5.agoda.net/ycs/dist/vendor-lazy-f89877c203bfcc17704a.js"></script>
	<script type="text/javascript"
		src="//cdn5.agoda.net/ycs/dist/propertyWizard-lazy-d75bafbfd5febb4137d4.js"></script>
	<script type="text/javascript"
		src="//cdn5.agoda.net/ycs/dist/90ecb6adbb75231906cc87a879f30d79.js"></script>
	<script type="text/javascript">
		window.utag_cfg_ovrd = {
			noview : true
		};
		var utag_data = {
			NHA_event : "propertywizard"
		};

		(function(a, b, c, d) {
			a = '//tags.tiqcdn.com/utag/agoda/main/prod/utag.js';
			b = document;
			c = 'script';
			d = b.createElement(c);
			d.src = a;
			d.type = 'text/java' + c;
			d.async = true;
			a = b.getElementsByTagName(c)[0];
			a.parentNode.insertBefore(d, a);
			if (window.tealium_callback) {
				d.addEventListener('load', function() {
					window.tealium_callback();
				}, false);
			}
		})();
	</script>

</body>
</html>