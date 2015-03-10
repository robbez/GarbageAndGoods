$(document).ready(function() {
	retrieveHelper("featuredMovies.jsp", function(data) {

		var featuredItems = data.split("|||");

		var latestMovies = $.parseJSON(featuredItems[0]);
		var topMovies = jQuery.parseJSON(featuredItems[1]);

		$("#latestMovies .col-md-4 a").each(function(index) {
			if(latestMovies[index] != undefined){
				//console.log(index + " " + latestMovies[index] + " " + $(this).children("p"));
				$(this).attr({href: "movieItem.jsp?movieID=" + latestMovies[index].movieID});
				$(this).children("p").html(latestMovies[index].movieTitle);
				$(this).children("img").attr({src : "res/img/movies/" + latestMovies[index].coverURL + ".jpg", alt : latestMovies[index].movieTitle});
				
			}
		});
		
		$("#topSellerMovies .col-md-4 a").each(function(index) {
			if(topMovies[index] != undefined){
				//console.log(topMovies[index].movieID);
				$(this).attr({href: "movieItem.jsp?movieID=" + topMovies[index].movieID});
				$(this).children("p").html(topMovies[index].movieTitle);
				$(this).children("img").attr({src : "res/img/movies/" + topMovies[index].coverURL + ".jpg", alt : topMovies[index].movieTitle});
			}
		});
		


	});
});
