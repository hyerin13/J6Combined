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
		url : "/project/admin/lhj/accommUpdate?aid" + paramValue,
    	type : "POST",
    	dataSrc: "data",
    	success : function(data) {
    		console.log(data.msg);
    		$("#result").append(data.msg);
    	}
	});
});
