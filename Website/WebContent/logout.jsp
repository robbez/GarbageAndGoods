<%

session.setAttribute("userid", null);
session.setAttribute("adminid", null);
session.invalidate();
String referer = request.getHeader("Referer");
response.sendRedirect(referer);

%>