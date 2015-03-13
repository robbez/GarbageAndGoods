
<%
	String loggedDropDown = "";
	String userid = (String) session.getAttribute("userid");
	String adminid = (String) session.getAttribute("adminid");
	boolean signedIn = false;

	if (userid != null || adminid != null) {
		signedIn = true;

		if (adminid != null) {

			loggedDropDown = "<li class=\"dropdown\" id=\"accountDropdown\"><a href=\"#\""
					+ "class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\""
					+ "aria-expanded=\"false\">Dropdown <span class=\"caret\"></span>"
					+ "</a>"
					+ "<ul class=\"dropdown-menu\" role=\"menu\">"
					+ "<li><a href=\"addMovie.jsp\">Add Movie</a></li>"
					+ "<li class=\"divider\"></li>"
					+ "<li><a href=\"logout.jsp\">Logout</a></li>"
					+ "</ul></li>";
		} else {
			loggedDropDown = "<li class=\"dropdown\" id=\"accountDropdown\"><a href=\"#\""
					+ "class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\""
					+ "aria-expanded=\"false\">Dropdown <span class=\"caret\"></span>"
					+ "</a>"
					+ "<ul class=\"dropdown-menu\" role=\"menu\">"
					+ "<li class=\"divider\"></li>"
					+ "<li><a href=\"logout.jsp\">Logout</a></li>"
					+ "</ul></li>";
		}
	} else {
		signedIn = false;
		loggedDropDown = "<li>"
				+ "<form method=\"post\" action=\"login.jsp\""
				+ "class=\"navbar-form navbar-nav navbar-right\" name=\"loginForm\""
				+ "id=\"loginForm\">"
				+ "<div class=\"form-group\">"
				+ "<span class=\"glyphicon glyphicon-remove-sign\" aria-hidden=\"true\"></span>\""
				+ "<input type=\"text\" placeholder=\"Username\" name=\"userame\""
				+ "id=\"username\" class=\"form-control\">"
				+ "</div>"
				+ "<div class=\"form-group\">"
				+ "<span class=\"glyphicon glyphicon-remove-sign\" aria-hidden=\"true\"></span>"
				+ "<input type=\"password\" placeholder=\"Password\" name=\"password\""
				+ "id=\"password\" class=\"form-control\">"
				+ "</div>"
				+ "<button type=\"submit\" class=\"btn btn-success\" id=\"signInBtn\">Sign"
				+ "In</button>"
				+ "<button type=\"button\" class=\"btn btn-danger\" id=\"signUpBtn\">Sign"
				+ "Up</button>" + "</form>" + "</li>";
	}
%>