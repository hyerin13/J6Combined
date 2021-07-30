<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.jsp</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=hznya2qvqk&submodules=geocoder"></script>
<script type="text/javascript">
var map = new naver.maps.Map("map", {
  center: new naver.maps.LatLng(37.3595316, 127.1052133),
  zoom: 15,
  mapTypeControl: true
});

var infoWindow = new naver.maps.InfoWindow({
  anchorSkew: true
});

map.setCursor('pointer');

function searchCoordinateToAddress(latlng) {

  infoWindow.close();

  naver.maps.Service.reverseGeocode({
    coords: latlng,
    orders: [
      naver.maps.Service.OrderType.ADDR,
      naver.maps.Service.OrderType.ROAD_ADDR
    ].join(',')
  }, function(status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      if (!latlng) {
        return alert('ReverseGeocode Error, Please check latlng');
      }
      if (latlng.toString) {
        return alert('ReverseGeocode Error, latlng:' + latlng.toString());
      }
      if (latlng.x && latlng.y) {
        return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
      }
      return alert('ReverseGeocode Error, Please check latlng');
    }

    var address = response.v2.address,
        htmlAddresses = [];

    if (address.jibunAddress !== '') {
        htmlAddresses.push('[지번 주소] ' + address.jibunAddress);
    }

    if (address.roadAddress !== '') {
        htmlAddresses.push('[도로명 주소] ' + address.roadAddress);
    }

    infoWindow.setContent([
      '<div style="padding:10px;min-width:200px;line-height:150%;">',
      '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
      htmlAddresses.join('<br />'),
      '</div>'
    ].join('\n'));

    infoWindow.open(map, latlng);
  });
}

function searchAddressToCoordinate(address) {
  naver.maps.Service.geocode({
    query: address
  }, function(status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      if (!address) {
        return alert('Geocode Error, Please check address');
      }
      return alert('Geocode Error, address:' + address);
    }

    if (response.v2.meta.totalCount === 0) {
      return alert('No result.');
    }

    var htmlAddresses = [],
      item = response.v2.addresses[0],
      point = new naver.maps.Point(item.x, item.y);

    if (item.roadAddress) {
      htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
    }

    if (item.jibunAddress) {
      htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
    }

    if (item.englishAddress) {
      htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
    }

    infoWindow.setContent([
      '<div style="padding:10px;min-width:200px;line-height:150%;">',
      '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
      htmlAddresses.join('<br />'),
      '</div>'
    ].join('\n'));

    map.setCenter(point);
    infoWindow.open(map, point);
  });
}

function initGeocoder() {
  if (!map.isStyleMapReady) {
    return;
  }

  map.addListener('click', function(e) {
    searchCoordinateToAddress(e.coord);
  });

  $('#address').on('keydown', function(e) {
    var keyCode = e.which;

    if (keyCode === 13) { // Enter Key
      searchAddressToCoordinate($('#address').val());
    }
  });

  $('#submit').on('click', function(e) {
    e.preventDefault();

    searchAddressToCoordinate($('#address').val());
  });

  searchAddressToCoordinate('정자동 178-1');
}

naver.maps.onJSContentLoaded = initGeocoder;
naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>
</head>
<body>
<h1>숙소정보</h1>
<form method="post" action="${pageContext.request.contextPath }/hjy/hotelreq">
카테고리
<input type="text" name="acate"><br>
<!-- 
<select name="acate">
	<option value="hotel">호텔</option>
</select><br>
 -->
숙박업소명
<input type="text" name="aname"><br>
주소
<input type="text" name="aaddress"><br>
전화번호
<input type="text" name="aphone"><br>
<h2>지도 핀 찍기</h2>
<div id="map" style="width: 100%; height:480px;"></div>
x좌표
<input type="text" name="axcoordi"><br>
y좌표
<input type="text" name="aycoordi"><br>
총객실수
<input type="number" name="atotalroom"><br>
숙소성급
<input type="text" name="agrade"><br>
대표소개
<input type="text" name="adetail"><br>
대표이미지
<input type="text" name="amainimg"><br>

<h1>객실세부정보</h1>

객실종류
<input type="text" name="riroomtype"><br>
객실수
<input type="number" name="riroom">개<br>
부가서비스
<input type="text" name="riservice"><br>
객실크기
<input type="text" name="risize"><br>
숙박가능인원
<input type="number" name="riminper">명<br>
숙박최대인원
<input type="number" name="rimaxper">명<br>
성수기 1박 기본요금
<input type="number" name="ripeak">원<br>
준성수기 1박 기본요금
<input type="number" name="risemipeak">원<br>
비수기 1박 기본요금
<input type="number" name="rioff">원<br>
대표이미지
<input type="text" name="rimainimg"><br>
추가이미지1
<input type="text" name="riextraimg1"><br>
추가이미지2
<input type="text" name="riextraimg2"><br>

<h1>추가요금설정</h1>
인원추가비용
<input type="number" name="riextraimg2"><br>
조식추가비용
<input type="number" name="riextraimg2"><br>
침대추가비용
<input type="number" name="riextraimg2"><br>

<h1>기간정보</h1>
시즌
<input type="text" name="peseason"><br>
시즌시작날짜
<input type="date" name="pestart"><br>
시즌끝날짜
<input type="date" name="peend"><br>
<input type="submit" value="신청하기">
</form>
</body>
</html>