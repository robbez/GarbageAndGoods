$(document).ready(function(){
	$("#searchBtn").click(function(){
		if($("#searchInput").val() != ""){
			$(this).parent().submit();
		}
	});
});
