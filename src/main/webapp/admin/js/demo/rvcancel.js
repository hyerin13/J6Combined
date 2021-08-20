// Call the dataTables jQuery plugin
$(document).ready(function(){
   var table =$('#dataTable').dataTable({
  		ajax:{
  		"url":"/project/admin/cjy/rvcancel",
  		"dataType":"json",
  		"dataSrc":"data"
  		 },
         columns:[
         	{targets: 0,
             data: null,
             className: 'text-center',
             searchable: false,
             orderable: false,
             render: function (data, type, full, meta) {
         	    return '<input type="checkbox" id="check_' + data.id + '" class="check" name="check" value="' + data.id + '">';
             },
             width: "5%"},
         	{"data": "rid"},
         	{"data": "rordernum"},
         	{"data": "ramount"},
         	{"data": "rcheckin"},
         	{"data": "rcheckout"},
         	{"data": "rresname"},
         	{"data": "rresphone"},
         	{"data": "rresemail"},
         	{"data": "rexbreaknum"},
         	{"data": "rexbed"},
         	{"data": "rexperson"},
         	{"data": "rcancel"},
         	{"data": "mid"},
         	{"data": "riid"},
         ],
         	dom: 'Bfrtip',
         	buttons: [
            'copy', 'excel', 'pdf', 'print'
        ]
   });
   $('input[name=selectall]').on('change', function(){
	  	if($('input[name=selectall]').prop("checked")){
	  		$('input[type=checkbox]').prop('checked', true);
	  		console.log($('input[type=checkbox]').prop('checked', true));
	  	}else{
	  		$('input[type=checkbox]').prop('checked', false);
	  	}
	});
	
	$('#okbtn').click(function(){
		var checkbox = $("input[name='check']:checked");
		console.log(checkbox);
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			var rid = td.eq(1).text();
		$.ajax({
	  		url:"/project/admin/cjy/rvcancelapproval",
	  		dataType:"json",
	  		data:{rid:rid},
	  		dataSrc:"data",
	  		success:function(d){
	  			alert(d.msg) //여러개 처리시 메세지 1번뜨게 해야함
	  		}
	  		});
	  	});
	  	if(checkbox.length==0){
	  		alert("선택된 체크박스가 존재하지 않습니다")
	  	}
  	});
  
});