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

var paramValue = request.getParameter('riid'); 
	
$(document).ready(function(){
  	$.ajax ({
		url : "/project/admin/lhj/roomDetail?riid=" + paramValue,
    	type : "GET",
    	success : function(data) {
    		let riid = data.vo.riid;
			let riroomtype = data.vo.riroomtype;
			let riroom = data.vo.riroom;
			let riservice = data.vo.riservice;
			let risize = data.vo.risize;
			let riminper =  data.vo.riminper;
			let rimaxper =  data.vo.rimaxper;
			let ripeak =  data.vo.ripeak;
			let risemipeak =  data.vo.risemipeak;
			let rioff =  data.vo.rioff;
			let rimainimg =  data.vo.rimainimg;
			let riextraimg1 =  data.vo.riextraimg1;
			let riextraimg2 =  data.vo.riextraimg2;
			let html = `
				<form method="post" id="multiform" enctype="multipart/form-data">
					<input type='hidden' name='aid' value='${data.vo.aid}'>
					<input type='hidden' name='riid' value='${riid}'>
					<label>객실종류</label>
		        	<input type="text" name="riroomtype" value="${riroomtype}"><br>
		        	<label>총객실수</label>
		        	<input type="text" name="riroom" value="${riroom}"><br>
		        	<label>부가서서비스</label>
		        	<input type="text" name="riservice" value="${riservice}"><br>
		        	<label>방갯수</label>
		        	<input type="text" name="risize" value="${risize}"><br>
		        	<label>기준인원</label>
		        	<input type="text" name="riminper" value="${riminper}"><br>
		        	<label>최대인원</label>
		        	<input type="text" name="rimaxper" value="${rimaxper}"><br>
		        	<label>성수기요금</label>
		        	<input type="text" name="ripeak" value="${ripeak}"><br>
		        	<label>준성수기요금</label>
		        	<input type="text" name="risemipeak" value="${risemipeak}"><br>
		        	<label>비성수기요금</label>
		        	<input type="text" name="rioff" value="${rioff}"><br>
		        	<label>메인사진</label>
		        	<input type="file" name="file" value="${rimainimg}"><br>
		        	<label>추가사진1</label>
		        	<input type="file" name="file" value="${riextraimg1}"><br>
		        	<label>추가사진2</label>
		        	<input type="file" name="file" value="${riextraimg2}"><br>
		        	<div>
				     <input type="button" value="수정" onclick="updatesubmit(); return false;">
				</div>
            	</form>
            	`
		$("#roomUpdate").append(html);
    	}
	});
});

function updatesubmit(){
	event.preventDefault();  
	var form =  $("#roomUpdate form");
 	var formData = new FormData(form[0]);  
 	console.log(form)
    $.ajax({
        type: "post",
        enctype: 'multipart/form-data', 
        url: "/project/admin/lhj/roomUpdate",
        data: formData,
	    dataType:'json',
	    processData: false,
        contentType: false,
		cache:false,
        success: function (data) {
            alert(data.msg);
        	window.location.href='roomlist.html'
        }
    });
}