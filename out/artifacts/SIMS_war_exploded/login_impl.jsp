<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="SEPJ.UserInterface.ULogic" %>
<%
    String username = new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");
    String password = request.getParameter("password");
    int userid;
    if ((userid = ULogic.login(username,password))!= -1) {
        session.setAttribute("username", username);
        session.setAttribute("userid", userid);
        ULogic uLogic = new ULogic(userid);
        session.setAttribute("ulogic", uLogic);
        response.sendRedirect(request.getContextPath() + "/user/");
    }
    else {
        session.setAttribute("username", null);
        session.setAttribute("userid", null);
        response.sendRedirect(request.getContextPath() + "/");
    }

%>