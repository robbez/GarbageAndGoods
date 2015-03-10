function retrieveHelper(requestUrl, fn) {
	
	$.ajax({
		url : requestUrl,
		success : function(data) {
			fn(data);
		}
	});
}

