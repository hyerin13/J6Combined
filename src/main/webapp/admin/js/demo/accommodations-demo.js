// Set new default font family and font color to mimic Bootstrap's default styling


$.ajax({
	url : path + "/admin/lhj/accommSearch",
	type : "get",
	dataType : "json",
	success: function(data){
		$(data.list).each(function(i,d){
			$("#aname").html(d.aname);
			$("#aaddress").html(d.aaddress);
			$("#aphone").html(d.aphone);
			$("#aregdate").html(d.aregdate);
		});
	}	
});