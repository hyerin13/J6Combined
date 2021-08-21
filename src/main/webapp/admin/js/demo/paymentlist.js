// Call the dataTables jQuery plugin

$(document).ready(function(){
	$('#dataTable').dataTable({
  		ajax:{
  			url : "/project/admin/lhj/paymentlist",
  			dataType : "json",
  		 	dataSrc : "list"
  		 },
         columns:[
         	{"data": "pid"},
         	{"data": "pmethod"},
         	{"data": "pdate"},
         	{"data": "ptotal"},
         	{"data": "prefund"},
         	{"data": "rid"},
         	{"data": "mid"}
         	],
         	dom: 'Bfrtip',
         	buttons: [
            'copy', 'excel', 'pdf', 'print'
        ]
	});
});