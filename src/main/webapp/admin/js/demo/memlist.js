// Call the dataTables jQuery plugin
$(document).ready(function(){

  $('#dataTable').empty();
  	$.ajax({
		type:'get',
		url:"/project/admin/cjy/searchmem",
		dataType:"json",
		success:function(data){
				let tb="<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>";
				tb+="<thead>";
				tb+="<tr>";
				tb+="<th>아이디</th>";
				tb+="<th>비밀번호</th>";
				tb+="<th>이름</th>";
				tb+="<th>전화번호</th>";
				tb+="<th>이메일</th>";
				tb+="<th>등록일</th>";
				tb+="<th>생일</th>";
				tb+="<th>프로필사진</th>";
				tb+="<th>탈퇴여부</th>";
				tb+="</tr>";
				tb+="</thead>";
				tb+="<tfoot>";
				tb+="<tr>";
				tb+="<th>아이디</th>";
				tb+="<th>비밀번호</th>";
				tb+="<th>이름</th>";
				tb+="<th>전화번호</th>";
				tb+="<th>이메일</th>";
				tb+="<th>등록일</th>";
				tb+="<th>생일</th>";
				tb+="<th>프로필사진</th>";
				tb+="<th>탈퇴여부</th>";
				tb+="</tr>";
				tb+="</tfoot>";
				tb+="<tbody>";
			$(data.list).each(function(i,d){
				let mid=d.mid;
				let mpw=d.mpw;
				let mname=d.mname;
				let mphone=d.mphone;
				let memail=d.memail;
				let mrdate=d.mrdate;
				let mbirth=d.mbirth;
				let mprofile=d.mprofile;
				let mdrop=d.mdrop;
				tb+="<tr>";
				tb+="<td>" + mid + "</td>";
				tb+="<td>" + mpw + "</td>";
				tb+="<td>" + mname + "</td>";
				tb+="<td>" + mphone + "</td>";
				tb+="<td>" + memail + "</td>";
				tb+="<td>" + mrdate + "</td>";
				tb+="<td>" + mbirth + "</td>";
				tb+="<td>" + mprofile + "</td>";
				tb+="<td>" + mdrop+ "</td>";
				tb+="</tr>";
				tb+="</tbody>";
				tb+="</table>";
				$('#dataTable').append(tb)
			});
		},
	});
	  $('#dataTable').DataTable();
});

