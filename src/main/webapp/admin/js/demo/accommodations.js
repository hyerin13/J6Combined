// Set new default font family and font color to mimic Bootstrap's default styling

$(document).ready(function(){
	$('#dataTable').DataTable( {
	    ajax:{
	    	url :"/project/admin/lhj/accommlist",
    		type : "GET",
        	dataSrc: 'list'
        },
        columns:[
        	{data:"aid",
        		"render":function(data,type,row){
					if(type==='display'){
						data="<a href='"+path+"admin/roomlist.html?aid="+data+"'>"+data+"</a>"
					}
					return data;
				}
        	},
			{data:"aname"},
			{data:"aaddress"},
			{data:"aphone"},
			{data:"atotalroom"},
			{data:"agrade"},
			{data:"amainimg"},
			{data:"adetail"},
			{data:"aregdate"},
			{data:"aisdel"},
			{data:"aid",
				"render":function(data,type,row){
					if(type==='display'){
						data="<a href='"+path+"admin/detail.html?aid=" + data + "'>수정</a>"
					}
					return data;
				}
			},
			{data:"aid",
				"render":function(data,type,row){
					if(type==='display'){
						data="<a href='" + path + "admin/delUpate?aid=" + data + "'>삭제</a>"
					}
					return data;
				}
			}
        ]
	} );
	
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
	
	$.ajax ({
		url : "/project/admin/lhj/delUpdate?aid" + paramValue,
    	type : "get",
    	success : function(data) {
    		alert(data.msg);
    	}
	});
	
	table.fnDestroy();
	
	$('#dataTable').DataTable( {
	    ajax:{
	    	url :"/project/admin/lhj/accommlist",
    		type : "GET",
        	dataSrc: 'list'
        },
        columns:[
        	{data:"aid",
        		"render":function(data,type,row){
					if(type==='display'){
						data="<a href='"+path+"admin/roomlist.html?aid="+data+"'>"+data+"</a>"
					}
					return data;
				}
        	},
			{data:"aname"},
			{data:"aaddress"},
			{data:"aphone"},
			{data:"atotalroom"},
			{data:"agrade"},
			{data:"amainimg"},
			{data:"adetail"},
			{data:"aregdate"},
			{data:"aisdel"},
			{data:"aid",
				"render":function(data,type,row){
					if(type==='display'){
						data="<a href='"+path+"admin/detail.html?aid="+data+"'>수정</a>"
					}
					return data;
				}
			},
			{data:"aid",
				"render":function(data,type,row){
					if(type==='display'){
						data="<a href='"+path+"admin/delUpate?aid="+data+"'>삭제</a>"
					}
					return data;
				}
			}
        ]
	});
});
