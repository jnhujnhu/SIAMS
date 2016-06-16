<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    int result, ans;
    ans = ULogic.login(username, password);
    if(ans >=0) {
        result = 1;
    }
    else if(ans == -2) {
        result = 2;
    }
    else {
        result = 0;
    }
%>
{"result":<%=result%>}