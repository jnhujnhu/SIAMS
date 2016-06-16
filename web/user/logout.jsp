<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("username", null);
    session.setAttribute("userid", null);
    session.setAttribute("ulogic", null);
    response.sendRedirect(request.getContextPath() + "/");
%>