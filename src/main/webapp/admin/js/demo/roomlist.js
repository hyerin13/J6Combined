// Set new default font family and font color to mimic Bootstrap's default styling
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
	$('#dataTable').DataTable( {
	    ajax:{
	    	url :"/project/admin/lhj/roomlist?aid=" + paramValue,
    		type : "GET",
        	dataSrc: 'list'
        },
        columns:[
        	{data:"riid"},
			{data:"riroomtype"},
			{data:"riroom"},
			{data:"riservice"},
			{data:"risize"},
			{data:"riminper"},
			{data:"rimaxper"},
			{data:"ripeak"},
			{data:"risemipeak"},
			{data:"rioff"},
			{data:"rimainimg"},
			{data:"riextraimg1"},
			{data:"riextraimg2"},
			{data:"riid",
				"render":function(data,type,row){
					if(type==='display'){
						data="<a href='" + path + "admin/roomDetail.html?riid=" + data + "'>수정</a>"
					}
					return data;
				}
			}
        ]
	} );
});
