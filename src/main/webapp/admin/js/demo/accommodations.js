// Set new default font family and font color to mimic Bootstrap's default styling

$(document).ready(function(){
  	$.ajax ({
		url :"/project/admin/lhj/accommlist",
    	type : "GET",
    	dataType : "json",
    	success : function(data) {
    		$(data.list).each(function(i,d){
    			let aid = d.aid;
    			let aname = d.aname;
    			let aaddress = d.aaddress;
    			let aphone = d.aphone;
    			let atotalroom = d.atotalroom;
    			let agrade = d.agrade;
    			let amainimg = d.amainimg;
    			let adetail = d.adetail;
    			let aregdate = d.aregdate;
    			let aisdel = d.aisdel;
    			let html = "<tr>";
    			html += "<td>" + aname + "</td>";
    			html += "<td>" + aaddress + "</td>";
    			html += "<td>" + aphone + "</td>";
    			html += "<td>" + atotalroom + "</td>";
    			html += "<td>" + agrade + "</td>";
    			html += "<td>" + amainimg + "</td>";
    			html += "<td>" + adetail + "</td>";
    			html += "<td>" + aregdate + "</td>";
    			html += "<td>" + aisdel  + "</td>";
    			html += "<td><a href= '/project/admin/lhj/detail?aid=" + aid + "'>수정</td>";
    			$("#accommlist").append(html);
    		});
    		
    	}
	});
});