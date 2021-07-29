<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Agoda Homes | 숙소를 등록해 추가 수익을 올려보세요!</title>
<meta name="description"
	content="아시아를 선도하는 휴가용 숙소 렌탈 플랫폼에서 무료 호스팅을 즐겨 보세요. 쉽고 간편하게 숙소를 등록하고 타 예약 사이트의 예약을 동기화해 양질의 예약을 받아 보세요!">
<link href="//cdn5.agoda.net/ycs/dist/vendor-78af6b08c69dfc86ad1c-p.css"
	rel="stylesheet">

<link
	href="//cdn5.agoda.net/ycs/dist/propertyWizard-818194971d9fc251c7c3-p.css"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/images/logo/j6.jpg">
<iframe src="javascript:void(0)" style="display: none;"></iframe>
<script src="//tags.tiqcdn.com/utag/agoda/main/prod/utag.js"
	type="text/javascript" async=""></script>
<script type="text/javascript"
	src="//cdn5.agoda.net/ycs/dist/manifest-b3eaeae06926be4dbec2-p.js"></script>


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
		webServerName : 'HK-HOSTM-2013',
		sessionId : 'qdbiyyq2mjn3ttzlke22ojlh',
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
<script charset="utf-8"
	src="//cdn5.agoda.net/ycs/dist/vendors~pw-property-unit~room-setup-lazy-3b75e97a27fefdca8825.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn5.agoda.net/ycs/dist/pw-property-unit-c122b2ad821c3e7fc784-p.css">
<script charset="utf-8"
	src="//cdn5.agoda.net/ycs/dist/pw-property-unit-lazy-5526a4ac5979b12c373a.js"></script>
</head>
<body class="ko-kr">
	<div id="root">
		<div class="property-wizard">
			<nav class="agoda-header navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<div class="navbar-brand">
							<div data-element-name="navbar-brand">
								<a target="_blank" href="//www.agoda.com"><img
									class="agoda-logo"
									src="//cdn6.agoda.net/images/MVC/default/agoda-logo-booking-page.png"
									srcset="//cdn6.agoda.net/images/MVC/default/agoda-logo-booking-page.png 1x, //cdn6.agoda.net/images/MVC/default/agoda-logo-booking-page@2x.png 2x"
									width="89" height="37" title="Agoda" alt="Agoda"></a>
							</div>
						</div>
						<div class="pull-right">
							<li class="navbar-menu-item"><a class="language anchor"
								data-element-name="property-wizard-language-flag" title="ko-kr"><i
									class="flag flag-18 flag-18-kr"></i></a></li>
						</div>
					</div>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="row-no-margin row">
					<div class="main-content">
						<div>
							<div class="m-t-6 m-b-8">
								<h2>숙소 종류 확인</h2>
								<div class="m-b-8 panel panel-default">
									<div class="panel-body">
										<div class="property-type-box p-3 p-x-7">
											<i class="ficon ficon-36 ficon-villa"></i>
											<div>
												<strong>프라이빗 하우스</strong>
											</div>
											<div class="text-small m-t-1">숙소 1개</div>
										</div>
									</div>
								</div>
							</div>
							<div class="action-panel m-t-6">
								<div class="action-panel-container row">
									<div class="action-panel-messages-outside col-lg-6 col-md-5"></div>
									<div
										class="text-right action-panel-buttons-container hidden-xs col-lg-6 col-md-7">
										<button type="button"
											data-element-name="property-wizard-previous-button"
											class="btn-min-width-160 btn-outline-primary text-uppercase cancel-btn btn btn-primary">이전</button>
										<button type="submit" data-property-type="1"
											data-accommodation-type="106" data-number-of-unit="1"
											data-element-name="property-wizard-confirm-button"
											class="ladda-btn btn-min-width-160 text-uppercase submit-btn btn btn-primary">확인</button>
									</div>
									<div
										class="text-right action-panel-buttons-container visible-xs col-lg-6 col-md-7">
										<button type="submit" data-property-type="1"
											data-accommodation-type="106" data-number-of-unit="1"
											data-element-name="property-wizard-confirm-button"
											class="ladda-btn btn-min-width-160 text-uppercase submit-btn btn btn-primary">확인</button>
										<button type="button"
											data-element-name="property-wizard-previous-button"
											class="btn-min-width-160 btn-outline-primary text-uppercase cancel-btn btn btn-primary">이전</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="json-island" type="application/json">
        {"pageTitle":"Agoda Homes | 숙소를 등록해 추가 수익을 올려보세요!","pageDescription":"아시아를 선도하는 휴가용 숙소 렌탈 플랫폼에서 무료 호스팅을 즐겨 보세요. 쉽고 간편하게 숙소를 등록하고 타 예약 사이트의 예약을 동기화해 양질의 예약을 받아 보세요!","alternateLanguages":{"en-us":"English","fr-fr":"Français","de-de":"Deutsch","it-it":"Italiano","es-es":"Español","ja-jp":"日本語","zh-hk":"繁體中文 (香港)","zh-cn":"简体中文","ko-kr":"한국어","el-gr":"Ελληνικά","ru-ru":"Русский","pt-pt":"Português","nl-nl":"Nederlands","zh-tw":"繁體中文 (台灣)","th-th":"ภาษาไทย","ms-my":"Bahasa Malaysia","vi-vn":"Tiếng Việt","sv-se":"Svenska","id-id":"Bahasa Indonesia","pl-pl":"Język polski","nb-no":"Norsk","da-dk":"Dansk","fi-fi":"Suomi","cs-cz":"Čeština","tr-tr":"Türkçe","ca-es":"Català","hu-hu":"Magyar","bg-bg":"Български език","sl-si":"Slovenski jezik","ar-ae":"العربية","pt-br":"Português "},"languageSwitcherViewModel":{"allLanguagesText":"언어 설정","languageItems":[{"cultureCode":"en-us","title":"English","isSelected":false,"flagIconCssClass":"us","language":1},{"cultureCode":"fr-fr","title":"Français","isSelected":false,"flagIconCssClass":"fr","language":2},{"cultureCode":"de-de","title":"Deutsch","isSelected":false,"flagIconCssClass":"de","language":3},{"cultureCode":"it-it","title":"Italiano","isSelected":false,"flagIconCssClass":"it","language":4},{"cultureCode":"es-es","title":"Español","isSelected":false,"flagIconCssClass":"es","language":5},{"cultureCode":"ja-jp","title":"日本語","isSelected":false,"flagIconCssClass":"jp","language":6},{"cultureCode":"zh-hk","title":"繁體中文 (香港)","isSelected":false,"flagIconCssClass":"hk","language":7},{"cultureCode":"zh-cn","title":"简体中文","isSelected":false,"flagIconCssClass":"cn","language":8},{"cultureCode":"ko-kr","title":"한국어","isSelected":true,"flagIconCssClass":"kr","language":9},{"cultureCode":"el-gr","title":"Ελληνικά","isSelected":false,"flagIconCssClass":"gr","language":10},{"cultureCode":"ru-ru","title":"Русский","isSelected":false,"flagIconCssClass":"ru","language":11},{"cultureCode":"pt-pt","title":"Português","isSelected":false,"flagIconCssClass":"pt","language":12},{"cultureCode":"nl-nl","title":"Nederlands","isSelected":false,"flagIconCssClass":"nl","language":13},{"cultureCode":"zh-tw","title":"繁體中文 (台灣)","isSelected":false,"flagIconCssClass":"tw","language":20},{"cultureCode":"th-th","title":"ภาษาไทย","isSelected":false,"flagIconCssClass":"th","language":22},{"cultureCode":"ms-my","title":"Bahasa Malaysia","isSelected":false,"flagIconCssClass":"my","language":23},{"cultureCode":"vi-vn","title":"Tiếng Việt","isSelected":false,"flagIconCssClass":"vn","language":24},{"cultureCode":"sv-se","title":"Svenska","isSelected":false,"flagIconCssClass":"se","language":25},{"cultureCode":"id-id","title":"Bahasa Indonesia","isSelected":false,"flagIconCssClass":"id","language":26},{"cultureCode":"pl-pl","title":"Język polski","isSelected":false,"flagIconCssClass":"pl","language":27},{"cultureCode":"nb-no","title":"Norsk","isSelected":false,"flagIconCssClass":"no","language":28},{"cultureCode":"da-dk","title":"Dansk","isSelected":false,"flagIconCssClass":"dk","language":29},{"cultureCode":"fi-fi","title":"Suomi","isSelected":false,"flagIconCssClass":"fi","language":30},{"cultureCode":"cs-cz","title":"Čeština","isSelected":false,"flagIconCssClass":"cz","language":31},{"cultureCode":"tr-tr","title":"Türkçe","isSelected":false,"flagIconCssClass":"tr","language":32},{"cultureCode":"ca-es","title":"Català","isSelected":false,"flagIconCssClass":"ca-es","language":33},{"cultureCode":"hu-hu","title":"Magyar","isSelected":false,"flagIconCssClass":"hu","language":34},{"cultureCode":"bg-bg","title":"Български език","isSelected":false,"flagIconCssClass":"bg","language":36},{"cultureCode":"sl-si","title":"Slovenski jezik","isSelected":false,"flagIconCssClass":"si","language":38},{"cultureCode":"ar-ae","title":"العربية","isSelected":false,"flagIconCssClass":"ae","language":40},{"cultureCode":"pt-br","title":"Português ","isSelected":false,"flagIconCssClass":"br","language":43}],"selectedLanguageItem":{"cultureCode":"ko-kr","title":"한국어","isSelected":true,"flagIconCssClass":"kr","language":9},"suggestedLanguagesText":"추천 언어"},"signInText":"로그인","youHaveUnsavedChangesText":"저장하지 않은 변경 사항이 있습니다. 변경 사항을 저장하지 않고 계속 진행하시겠습니까?","saveAndExitText":"저장하고 나가기","nextText":"다음","previousText":"이전","nextButtonVerifiedAllFieldsText":"저장하려면 모든 미입력 항목을 정확하게 입력해 주세요.","comeBackLaterText":"There is an error right now, please come back later","defaultServerErrorMessage":"정보를 저장하던 중에 오류가 발생했습니다. 다시 시도해 주세요. 문제가 지속되는 경우 아고다 고객 지원 센터로 연락해 주시기 바랍니다.","actionPanelComponentViewModel":{"submitBtnText":"저장","cancelBtnText":"취소","successMessageText":"저장됨","yourChangesHaveBeenSavedText":"Your changes have been saved! Updated content will appear on the website within 6 hours.","errorMessageText":"정보를 저장하던 중에 오류가 발생했습니다. 다시 시도해 주세요. 문제가 지속되는 경우 아고다 고객 지원 센터로 연락해 주시기 바랍니다.","accommodationChangeSuccessMessage":"변경 사항이 저장되었습니다. {0}으로 이동해 추가 투숙객에 대한 요금이 제대로 설정되어 있는지 확인하시기 바랍니다.","calenderInSuccessMessage":"Calendar","pricingSettingText":"요금 설정","nextBtnText":"다음","previousBtnText":"이전"},"allMaterialHereinText":"All material herein © 2005 – 2021 Agoda Company Pte. Ltd., All Rights Reserved.","agodaIsPartOfBookingHoldingText":"아고다는 온라인 여행 및 관련 서비스 분야의 세계적인 선도 기업인 Booking Holdings Inc.의 일부입니다.","needHelpText":"도움말 센터","listNowText":"숙소 등록","agodaWebsiteUrl":"//www.agoda.com"}
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