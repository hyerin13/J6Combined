// Call the dataTables jQuery plugin
$(document).ready(function() {
	//호텔별 예약율
	$('#hotelTable').DataTable( {
	    ajax:{
        	url:path+"hjy/admin/hotelReservationRate",
        	type:"GET",
        	dataSrc: 'list'
        },
        columns:[
        	{data:"aname"},
        	{data:"per"}
        ]
	} );
	//객실별 예약율
	$('#roomTable').DataTable( {
	    ajax:{
        	url:path+"hjy/admin/roomReservationRate",
        	type:"GET",
        	dataSrc: 'list'
        },
        columns:[
        	{data:"aname"},
			{data:"riroomtype"},
			{data:"per"}
        ]
	} );
});
$("#changtime").change(function() {
//호텔별 예약율
$('#hotelTable').DataTable( {
	ajax:{
		url:path+"hjy/admin/hotelReservationRate?time="+$("#changtime").val(),
		type:"GET",
		dataSrc: 'list'
	},
	columns:[
		{data:"aname"},
		{data:"per"}
	]
} );

//객실별 예약율
$('#roomTable').DataTable( {
	ajax:{
		url:path+"hjy/admin/roomReservationRate?time="+$("#changtime").val(),
		type:"GET",
		dataSrc: 'list'
	},
	columns:[
		{data:"aname"},
		{data:"riroomtype"},
		{data:"per"},
		{data:"year"},
		{data:"month"}
	]
} );
});