<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int userid = (int)session.getAttribute("userid");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    ULogic uLogic = (ULogic) session.getAttribute("ulogic");

    uLogic.sendMsg(title, content, userid);

%>
{"result":<%=true%>}