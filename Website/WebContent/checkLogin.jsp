	<%
	String loggedDropDown = "";
	boolean signedIn;
	
		if (session.getAttribute("userid") != null) {
			 signedIn = true;
			 loggedDropDown = "<li class=\"dropdown\" id=\"accountDropdown\"><a href=\"#\"" +
					"class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\"" +
					"aria-expanded=\"false\">Dropdown <span class=\"caret\"></span>" +
				"</a>"+
					"<ul class=\"dropdown-menu\" role=\"menu\">" +
						"<li><a href=\"#\">Action</a></li>" +
						"<li><a href=\"#\">Another action</a></li>" +
						"<li><a href=\"#\">Something else here</a></li>" +
						"<li class=\"divider\"></li>" +
						"<li><a href=\"logout.jsp\">Logout</a></li>"+
					"</ul></li>";
		} else {
			signedIn = false;
			loggedDropDown = "<li>" +
					"<form method=\"post\" action=\"login.jsp\"" +
					"class=\"navbar-form navbar-nav navbar-right\" name=\"loginForm\"" +
					"id=\"loginForm\">" +
					"<div class=\"form-group\">" +
						"<span class=\"glyphicon glyphicon-remove-sign\" aria-hidden=\"true\"></span>\"" +
						"<input type=\"text\" placeholder=\"Username\" name=\"userame\"" +
							"id=\"username\" class=\"form-control\">" +
					"</div>" +
					"<div class=\"form-group\">" +
						"<span class=\"glyphicon glyphicon-remove-sign\" aria-hidden=\"true\"></span>" +
						"<input type=\"password\" placeholder=\"Password\" name=\"password\"" +
							"id=\"password\" class=\"form-control\">" +
					"</div>" +
					"<button type=\"submit\" class=\"btn btn-success\" id=\"signInBtn\">Sign" +
						"In</button>" +
					"<button type=\"button\" class=\"btn btn-danger\" id=\"signUpBtn\">Sign" +
						"Up</button>" +
				"</form>" +
			"</li>";
		}
	%>