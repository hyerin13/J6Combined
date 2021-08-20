// Call the dataTables jQuery plugin
$(document).ready(function(){
 // $('#dataTable').empty();
  $('#dataTable').dataTable({
  		ajax:{
  		"url":"/project/admin/cjy/rvcancel",
  		"dataType":"json",
  		"dataSrc":"data"
  		 },
         columns:[
         	{"data": "rid"},
         	{"data": "rordernum"},
         	{"data": "ramount"},
         	{"data": "rcheckin"},
         	{"data": "rcheckout"},
         	{"data": "rresname"},
         	{"data": "rresphone"},
         	{"data": "rresemail"},
         	{"data": "rexbreaknum"},
         	{"data": "rexbed"},
         	{"data": "rexperson"},
         	{"data": "rcancel"},
         	{"data": "mid"},
         	{"data": "riid"},
         	]
  		/*
  		function(data) {
  		let tb=""
  		console.log(data)
  		 for ( var i=0, ien=data.data.length ; i<ien ; i++ ) {
  		 	let rid=data.data[i].rid
  		 	let rordernum=data.data[i].rordernum
  		 	let ramount=data.data[i].ramount
  		 	let rcheckin=data.data[i].rcheckin
  		 	let rcheckout=data.data[i].rcheckout
  		 	let rresname=data.data[i].rresname
  		 	let rresphone=data.data[i].rresphone
  		 	let rresemail=data.data[i].rresemail
  		 	let rexbreaknum=data.data[i].rexbreaknum
  		 	let rexbed=data.data[i].rexbed
  		 		let rexperson=data.data[i].rexperson
  		 			let rcancel=data.data[i].rcancel
  		 				let mid=data.data[i].mid
  		 					let riid=data.data[i].riid
        	console.log("test"+data.data[i].rid);
              tb+="<tr>";
				tb+="<td>" + rid + "</td>";
				tb+="<td>" + rordernum + "</td>";
				tb+="<td>" + ramount + "</td>";
				tb+="<td>" + rcheckin + "</td>";
				tb+="<td>" + rcheckout + "</td>";
				tb+="<td>" + rresname + "</td>";
				tb+="<td>" + rresphone + "</td>";
				tb+="<td>" + rresemail + "</td>";
				tb+="<td>" + rexbreaknum+ "</td>";
				tb+="<td>" + rexbed+ "</td>";
				tb+="<td>" + rexperson+ "</td>";
				tb+="<td>" + rcancel+ "</td>";
				tb+="<td>" + mid+ "</td>";
				tb+="<td>" + riid+ "</td>";
				tb+="</tr>";
			};
				$('#dataTable').append(tb)
  		},
  		},
  		*/
  		/*
  		$(data.data).each(function(i,d){
				let rid=d.rid;
				let rordernum=d.rordernum;
				let ramount=d.ramount;
				let rcheckin=d.rcheckin;
				let rcheckout=d.rcheckout;
				let rresname=d.rresname;
				let rresphone=d.rresphone;
				let rresemail=d.rresemail;
				let rexbreaknum=d.rexbreaknum;
				let rexbed=d.rexbed;
				let rexperson=d.rexperson;
				let rcancel=d.rcancel;
				let mid=d.mid;
				let riid=d.riid;
				console.log(rid);
				tb+="<tr>";
				tb+="<td>" + rid + "</td>";
				tb+="<td>" + rordernum + "</td>";
				tb+="<td>" + ramount + "</td>";
				tb+="<td>" + rcheckin + "</td>";
				tb+="<td>" + rcheckout + "</td>";
				tb+="<td>" + rresname + "</td>";
				tb+="<td>" + rresphone + "</td>";
				tb+="<td>" + rresemail + "</td>";
				tb+="<td>" + rexbreaknum+ "</td>";
				tb+="<td>" + rexbed+ "</td>";
				tb+="<td>" + rexperson+ "</td>";
				tb+="<td>" + rcancel+ "</td>";
				tb+="<td>" + mid+ "</td>";
				tb+="<td>" + riid+ "</td>";
				tb+="</tr>";
			});
				$('#dataTable').append(tb)
  		},
         },
         columns:[
         	{"data": "예약번호"},
         	{"data": "예약순서"},
         	{"data": "인원"},
         	{"data": "체크인날짜"},
         	{"data": "체크아웃날짜"},
         	{"data": "예약자이름"},
         	{"data": "예약자전화번호"},
         	{"data": "예약자이메일"},
         	{"data": "조식추가인원"},
         	{"data": "침대추가"},
         	{"data": "인원추가"},
         	{"data": "취소여부"},
         	{"data": "아이디"},
         	{"data": "객실아이디"},
         	]
         	*/
  		/*
  		let tb="<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>";
				tb+="<thead>";
				tb+="<tr>";
				tb+="<th>예약번호</th>";
				tb+="<th>예약순서</th>";
				tb+="<th>인원</th>";
				tb+="<th>체크인날짜</th>";
				tb+="<th>체크아웃날짜</th>";
				tb+="<th>예약자이름</th>";
				tb+="<th>예약자전화번호</th>";
				tb+="<th>예약자이메일</th>";
				tb+="<th>조식추가인원</th>";
				tb+="<th>침대추가</th>";
				tb+="<th>인원추가</th>";
				tb+="<th>취소여부</th>";
				tb+="<th>아이디</th>";
				tb+="<th>객실아이디</th>";
				tb+="</tr>";
				tb+="</thead>";
				tb+="<tfoot>";
				tb+="<tr>";
				tb+="<th>예약번호</th>";
				tb+="<th>예약순서</th>";
				tb+="<th>인원</th>";
				tb+="<th>체크인날짜</th>";
				tb+="<th>체크아웃날짜</th>";
				tb+="<th>예약자이름</th>";
				tb+="<th>예약자전화번호</th>";
				tb+="<th>예약자이메일</th>";
				tb+="<th>조식추가인원</th>";
				tb+="<th>침대추가</th>";
				tb+="<th>인원추가</th>";
				tb+="<th>취소여부</th>";
				tb+="<th>아이디</th>";
				tb+="<th>객실아이디</th>";
				tb+="</tr>";
				tb+="</tfoot>";
				tb+="<tbody>";
			$(data.list).each(function(i,d){
				let rid=d.rid;
				let rordernum=d.rordernum;
				let ramount=d.ramount;
				let rcheckin=d.rcheckin;
				let rcheckout=d.rcheckout;
				let rresname=d.rresname;
				let rresphone=d.rresphone;
				let rresemail=d.rresemail;
				let rexbreaknum=d.rexbreaknum;
				let rexbed=d.rexbed;
				let rexperson=d.rexperson;
				let rcancel=d.rcancel;
				let mid=d.mid;
				let riid=d.riid;
				tb+="<tr>";
				tb+="<td>" + rid + "</td>";
				tb+="<td>" + rordernum + "</td>";
				tb+="<td>" + ramount + "</td>";
				tb+="<td>" + rcheckin + "</td>";
				tb+="<td>" + rcheckout + "</td>";
				tb+="<td>" + rresname + "</td>";
				tb+="<td>" + rresphone + "</td>";
				tb+="<td>" + rresemail + "</td>";
				tb+="<td>" + rexbreaknum+ "</td>";
				tb+="<td>" + rexbed+ "</td>";
				tb+="<td>" + rexperson+ "</td>";
				tb+="<td>" + rcancel+ "</td>";
				tb+="<td>" + mid+ "</td>";
				tb+="<td>" + riid+ "</td>";
				tb+="</tr>";
			});
				tb+="</tbody>";
				tb+="</table>";
				$('#dataTable').append(tb)
  		},
  	}
  });
});
*/

/*
  	$.ajax({
		type:'get',
		url:"/project/admin/cjy/rvcancel",
		dataType:"json",
		success:function(data){
			console.log(data)
			let tb="<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>";
				tb+="<thead>";
				tb+="<tr>";
				tb+="<th>예약번호</th>";
				tb+="<th>예약순서</th>";
				tb+="<th>인원</th>";
				tb+="<th>체크인날짜</th>";
				tb+="<th>체크아웃날짜</th>";
				tb+="<th>예약자이름</th>";
				tb+="<th>예약자전화번호</th>";
				tb+="<th>예약자이메일</th>";
				tb+="<th>조식추가인원</th>";
				tb+="<th>침대추가</th>";
				tb+="<th>인원추가</th>";
				tb+="<th>취소여부</th>";
				tb+="<th>아이디</th>";
				tb+="<th>객실아이디</th>";
				tb+="</tr>";
				tb+="</thead>";
				tb+="<tfoot>";
				tb+="<tr>";
				tb+="<th>예약번호</th>";
				tb+="<th>예약순서</th>";
				tb+="<th>인원</th>";
				tb+="<th>체크인날짜</th>";
				tb+="<th>체크아웃날짜</th>";
				tb+="<th>예약자이름</th>";
				tb+="<th>예약자전화번호</th>";
				tb+="<th>예약자이메일</th>";
				tb+="<th>조식추가인원</th>";
				tb+="<th>침대추가</th>";
				tb+="<th>인원추가</th>";
				tb+="<th>취소여부</th>";
				tb+="<th>아이디</th>";
				tb+="<th>객실아이디</th>";
				tb+="</tr>";
				tb+="</tfoot>";
				tb+="<tbody>";
			$(data.list).each(function(i,d){
				let rid=d.rid;
				let rordernum=d.rordernum;
				let ramount=d.ramount;
				let rcheckin=d.rcheckin;
				let rcheckout=d.rcheckout;
				let rresname=d.rresname;
				let rresphone=d.rresphone;
				let rresemail=d.rresemail;
				let rexbreaknum=d.rexbreaknum;
				let rexbed=d.rexbed;
				let rexperson=d.rexperson;
				let rcancel=d.rcancel;
				let mid=d.mid;
				let riid=d.riid;
				tb+="<tr>";
				tb+="<td>" + rid + "</td>";
				tb+="<td>" + rordernum + "</td>";
				tb+="<td>" + ramount + "</td>";
				tb+="<td>" + rcheckin + "</td>";
				tb+="<td>" + rcheckout + "</td>";
				tb+="<td>" + rresname + "</td>";
				tb+="<td>" + rresphone + "</td>";
				tb+="<td>" + rresemail + "</td>";
				tb+="<td>" + rexbreaknum+ "</td>";
				tb+="<td>" + rexbed+ "</td>";
				tb+="<td>" + rexperson+ "</td>";
				tb+="<td>" + rcancel+ "</td>";
				tb+="<td>" + mid+ "</td>";
				tb+="<td>" + riid+ "</td>";
				tb+="</tr>";
			});
				tb+="</tbody>";
				tb+="</table>";
				$('#dataTable').append(tb)
		},
	});
	$('#dataTable').DataTable();
	*/
	});
});