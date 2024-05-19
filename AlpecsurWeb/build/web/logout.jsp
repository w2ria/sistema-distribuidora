

<%@ page session="false" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NADA OHHH</title>
    </head>
    <body>
    </body>
</html>
