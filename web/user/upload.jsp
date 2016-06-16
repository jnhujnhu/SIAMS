<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page import="SEPJ.Helper.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getParameter("filepath");
    String desc = request.getParameter("desc");
    long size = Long.parseLong(request.getParameter("size"));


    double filesize = (double)size/(double)1024;
    ULogic uLogic = (ULogic) session.getAttribute("ulogic");

    uLogic.upload(path, filesize, desc);

%>
{"result":<%=true%>}