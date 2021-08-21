// Set new default font family and font color to mimic Bootstrap's default styling

$(document).ready(function(){
	$('#dataTable').DataTable( {
	    ajax:{
	    	url :"/project/admin/lhj/accommlist",
    		type : "GET",
        	dataSrc: 'list'
        },
        columns:[
        	{data:"aid"},
			{data:"aname",
				"render":function(data,type,row){
					if(type==='display'){
						data="<a href='"+path+"admin/detail.html?aname="+data+"'>"+data+"</a>"
					}
					return data;
				}
			},
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
			}
        ]
	} );
});