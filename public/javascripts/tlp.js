function loadGamesList(id) {
	$.ajax({
		type: "GET",
		url: "/games/index/" + id,
		async: true,
		datatype: "html",
		error: function(request, status, error) {
			alert("Oh no! Request: " + request + "\nStatus: " + status + "\nError: " + error);
		},
		success: function(data, success) {
			$("#game_select_list").html('');
			$("#game_select_list").html(data);
			$("#generate_button").show();
		}
	});
}

function loadNumbers(id) {
	$.ajax({
		type: "GET",
		url: "/generators/show/" + id,
		async: true,
		datatype: "html",
		error: function(request, status, error) {
			alert("Oh no! Request: " + request + "\nStatus: " + status + "\nError: " + error);
		},
		success: function(data, success) {
			$(".numbers").html('');
			$(".numbers").html(data);
			$(".numbers").show();
		}
	});
}