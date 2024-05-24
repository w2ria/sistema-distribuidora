
<%@ page session="true" %>
<%
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>
