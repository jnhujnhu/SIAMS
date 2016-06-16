<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String fid = request.getParameter("fid");

    ULogic uLogic = (ULogic) session.getAttribute("ulogic");

    String url = "\"" + uLogic.download(Integer.parseInt(fid))+"\"";

%>
{"url":<%=url%>}