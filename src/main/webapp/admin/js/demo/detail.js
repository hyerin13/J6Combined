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
    		let aid = data.vo.aid;
			let aname = data.vo.aname;
			let aaddress = data.vo.aaddress;
			let aphone = data.vo.aphone;
			let atotalroom = data.vo.atotalroom;
			let agrade =  data.vo.agrade;
			let amainimg =  data.vo.amainimg;
			let adetail =  data.vo.adetail;
			let aregdate =  data.vo.aregdate;
			let aisdel =  data.vo.aisdel;
			let html = `
				<form method="post" action="/project/admin/lhj/accommUpdate?aid=${aid}" enctype="multipart/form-data">
				<input type='hidden' name='aid' value='${aid}'>
				<input type='hidden' name='acate' value='${ data.vo.acate}'>
        		<input type='hidden' name='axcoordi' value='${ data.vo.axcoordi}'>
       	 		<input type='hidden' name='aycoordi' value='${ data.vo.aycoordi}'>
       	 		<input type='hidden' name='aisdel' value='${ data.vo.aisdel}'>
				<label>숙소명</label>
            	<input type="text" name="aname" value="${aname}"><br>
            	<label>위치</label>
            	<input type="text" name="aaddress" value="${aaddress}"><br>
            	<label>전화번호</label>
            	<input type="text" name="aphone" value="${aphone}"><br>
            	<label>방갯수</label>
            	<input type="text" name="atotalroom" value="${atotalroom}"><br>
            	<label>성급</label>
            	<input type="text" name="agrade" value="${agrade}"><br>
            	<label>메인사진</label>
            	<input type="file" name="amainimg" value="${amainimg}"><br>
            	<label>추가사진</label>
            	<input type="file" name="adetail" value="${adetail}"><br>
            	<label>등록일</label>
            	<input type="text" name="aregdate" value="${aregdate}"><br>
            	<input type="submit" value="수정"><br>
            	</form>
            	`
		$("#accommUpdate").append(html);
    	}
	});
});
