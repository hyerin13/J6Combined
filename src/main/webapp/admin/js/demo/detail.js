// Set new default font family and font color to mimic Bootstrap's default styling

$(document).ready(function(){
  	$.ajax ({
		url : "/project/admin/lhj/detail",
		data: "{aid : ${list.aid}}",
    	type : "GET",
    	success : function(data) {
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
			let html = `
				<input type='hidden' id='aid' value='${aid}'>";
        		<input type='hidden' id='axcoordi' value='${axcoordi}'>"
       	 		<input type='hidden' id='aycoordi' value='${aycoordi}'>"
				<label>숙소명</label>"
            	<input type="text" id="aname" value="${aname}">
            	<label>위치</label>
            	<input type="text" id="aaddress" value="${aaddress}">
            	<label>전화번호</label>
            	<input type="text" id="aphone" value="${aphone}">
            	<label>방갯수</label>
            	<input type="text" id="atotalroom" value="${atotalroom}">
            	<label>성급</label>
            	<input type="text" id="agrade" value="${agrade}">
            	<label>메인사진</label>
            	<input type="text" id="amainimg" value="${amainimg}">
            	<label>추가사진</label>
            	<input type="text" id="adetail" value="${adetail}">
            	<label>등록일</label>
            	<input type="text" id="aregdate" value="${aregdate}">
            	`
		$("#accommUpdate").append(html);
    	}
	});
});