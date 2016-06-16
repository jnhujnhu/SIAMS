<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page import="SEPJ.Helper.Message"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ULogic uLogic = (ULogic) session.getAttribute("ulogic");
    ArrayList<Message> messagelist;
    if(request.getParameter("keyword") == null) {
        messagelist = uLogic.getDefaultMsgList();
    }
    else if(request.getParameter("mode").equals("1")) {
        messagelist = uLogic.getMsgListByKeys(request.getParameter("keyword"), "");
    }
    else {
        messagelist = uLogic.getMsgListByKeys("", request.getParameter("keyword"));
    }
    String[] bgcolorlist = new String[]{"#4fc3f7","#7e57c2","#FF9292", "#57C2B3","#57C264","#C29C57","#C25757"};
    Random r = new Random();
    for(int i = messagelist.size()-1; i>=0 ;i--) {
        Message m = messagelist.get(i);
%>
<div class="message-container mdl-grid">
    <div class="mdl-card mdl-shadow--2dp mdl-cell mdl-cell--12-col">
        <div class="message-title mdl-card__media mdl-color-text--grey-50" style="background-color: <%=bgcolorlist[r.nextInt(7)]%>">
            <h3><a style="text-decoration: none; color: white; font-size: 27px" href="#"><%=m.title%></a></h3>
        </div>
        <div class="mdl-color-text--grey-600 mdl-card__supporting-text">
            <%=m.content%>
        </div>
        <div class="message-detail mdl-card__supporting-text mdl-color-text--grey-600">
            <div class="user-portrait"></div>
            <div style="display: flex; flex-direction: column; margin-left: 10px;">
                <strong><%=m.userName%></strong>
                <span><%=m.time%></span>
            </div>
        </div>
    </div>
</div>
<%}%>