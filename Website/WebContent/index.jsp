<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!public static int factorial(int n) {

		if (n <= 0)
			return 1;

		int fact = 1;

		for (int i = 2; i <= n; i++) {
			fact *= i;
		}

		return fact;
	}%>

	<h1>
		1 + 2 + 3 + .. + 10 =
		<%=factorial(3)%></h1>
</body>
</html>