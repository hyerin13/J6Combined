// Set new default font family and font color to mimic Bootstrap's default styling

<!-- html에서 파라미터 받아오는방법 -->
var Request = function() {  
    this.getParameter = function(name) {  
        var rtnval = '';  
        var nowAddress = unescape(location.href);  
        var parameters = (nowAddress.slice(nowAddress.indexOf('?') + 1,  
                nowAddress.length)).split('&');  
        for (var i = 0; i < parameters.length; i++) {  
            var varName = parameters[i].split('=')[0];  
            if (varName.toUpperCase() == name.toUpperCase()) {  
                rtnval = parameters[i].split('=')[1];  
                break;  
            }  
        }  
        return rtnval;  
    }  
}  
var request = new Request();  

var paramValue = request.getParameter('aid'); 
	
$(document).ready(function(){
  	$.ajax ({
		url : "/project/admin/lhj/detail?aid="+paramValue,
    	type : "GET",
    	success : function(data) {
    		let aid = data.list[0].aid;
			let aname = data.list[0].aname;
			let aaddress = data.list[0].aaddress;
			let aphone =data.list[0].aphone;
			let atotalroom =  data.list[0].atotalroom;
			let agrade =  data.list[0].agrade;
			let amainimg =  data.list[0].amainimg;
			let adetail =  data.list[0].adetail;
			let aregdate =  data.list[0].aregdate;
			let aisdel =  data.list[0].aisdel;
			let html = `
				<input type='hidden' id='aid' value='${aid}'>";
        		<input type='hidden' id='axcoordi' value='${ data.list[0].axcoordi}'>"
       	 		<input type='hidden' id='aycoordi' value='${ data.list[0].aycoordi}'>"
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
