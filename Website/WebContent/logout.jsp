<%

session.setAttribute("userid", null);
session.invalidate();
String referer = request.getHeader("Referer");
response.sendRedirect(referer);

%>