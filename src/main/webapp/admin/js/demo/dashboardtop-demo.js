// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
//이번달 매출액
$.ajax({
		url:path+"hjy/admin/monthlySales",
		traditional :true,
		type:"get",
		dataType:"json",
		success:function(data){
			$("#monthlySales").html(data.monthlySales)
		}
	});
//이번년 매출액
$.ajax({
		url:path+"hjy/admin/annualSales",
		traditional :true,
		type:"get",
		dataType:"json",
		success:function(data){
			$("#annualSales").html(data.annualsales)
		}
	});
//현재 달 구하기
$.ajax({
		url:path+"hjy/admin/month",
		traditional :true,
		type:"get",
		dataType:"json",
		success:function(data){
			let month =data.month
			$("div[name=month]").eq(0).html(month+$("div[name=month]").eq(0).html())
			$("div[name=month]").eq(1).html(month+$("div[name=month]").eq(1).html())
		}
	});
//현재 년도 구하기
$.ajax({
		url:path+"hjy/admin/year",
		traditional :true,
		type:"get",
		dataType:"json",
		success:function(data){
			let year = data.year
			year += $("#year").html()
			$("#year").html(year)
		}
	});
//전체 회원수
$.ajax({
		url:path+"hjy/admin/allMembers",
		traditional :true,
		type:"get",
		dataType:"json",
		success:function(data){
			$("#allMembers").html(data.allMembers)
		}
	});
//이번달 회원 유입수
$.ajax({
		url:path+"hjy/admin/monthMembers",
		traditional :true,
		type:"get",
		dataType:"json",
		success:function(data){
			$("#monthMembers").html(data.monthMembers)
			$("#monthMembersBar").attr('style','width:'+data.monthMembers*10+'%')
		}
	});
	
