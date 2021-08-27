// Call the dataTables jQuery plugin
$(document).ready(function(){
  $('#dataTable').dataTable({
  		ajax:{
  		"url":"/project/admin/cjy/searchmem",
  		"dataType":"json",
  		"dataSrc":"list"
  		 },
         columns:[
         	{"data": "mid"},
         	{"data": "mname"},
         	{"data": "mphone"},
         	{"data": "memail"},
         	{"data": "mrdate"},
         	{"data": "mbirth"},
         	{"data": "mprofile", render: getImg},
         	{"data": "mdrop"}
         	],
         	dom: 'Bfrtip',
         	buttons: [
            {
				extend: 'copy'
				,text: 'copy'
				,filename: '호텔별 예약률'
				,title: '호텔별 예약률'
				,className: 'btn btn-outline-primary'
			},
	     	{
				extend: 'excel'
				,text: 'excel'
				,filename: '호텔별 예약률'
				,title: '호텔별 예약률'
				,className: 'btn btn-outline-primary'
			},
			{
				extend: 'pdf'
				,text: 'pdf'
				,filename: '호텔별 예약률'
				,title: '호텔별 예약률'
				,className: 'btn btn-outline-primary'
			},
			{
				extend: 'print'
				,text: 'print'
				,filename: '호텔별 예약률'
				,title: '호텔별 예약률'
				,className: 'btn btn-outline-primary'
			},
        ],
         });
     function getImg(list, type, full, meta) {
	     if(list!=null){
	            return "<img src='/project/resources/images/members/"+list+"' width='150' height='150'>";
	     }else{
	     	return "";
	     }
	 }
});