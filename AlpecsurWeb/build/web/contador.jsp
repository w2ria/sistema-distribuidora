
<%
    // Incluir una llamada al servlet ContadorVisitas
    RequestDispatcher dispatcher = request.getRequestDispatcher("/ContadorVisitas");
    dispatcher.include(request, response);
%>

