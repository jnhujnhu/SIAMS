<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 5/12/16
  Time: 10:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String)session.getAttribute("username");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date d = new Date();
    String time = df.format(d);
%>
<html>
<head>
    <script src="../mdl/material.min.js"></script>
    <script src="../js/jquery-2.2.3.min-2.js"></script>
    <link href="../mdl/material.min.css" rel="stylesheet">
    <link href="../css/message_style.css" rel="stylesheet">
</head>
<script>
    function search() {
        $(".message-system").load("messagesystem.jsp?keyword=" + $(".search-keyword").val() + "&mode=" + $(".selector").val());
    }
    $(document).ready(function() {
        var clickcount = 1;
        $(".message-system").load("messagesystem.jsp");
        $(".add-message-btn").click(function(){
            if(clickcount % 2) {
                $(".new-message-container").slideDown(300);
            }
            else {
                $(".new-message-container").slideUp(300);
            }
            clickcount++;
        });
        $(".submit-msg-btn").click(function(){
           $.getJSON("sendmessage.jsp?title=" + $(".new-message-title").val() + "&content=" + $(".new-message-content").val(), function(data) {
               $(".message-system").load("messagesystem.jsp");
               $(".new-message-container").slideUp(300);
               $(".new-message-title").val("");
               $(".new-message-content").val("");
               clickcount++;
           });
        });
    });
</script>
<body>
    <div class="message-operation-container">
        <svg fill="#757575" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" style="margin-right: 8px;">
            <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
            <path d="M0 0h24v24H0z" fill="none"/>
        </svg>
        <select  class="selector form-control" style="width: 62px;height: 30px;border: 0px;margin-top: 20px;margin-right: 10px;">
            <option value="1">内容</option>
            <option value="2">用户名</option>
        </select>
        <div class="mdl-textfield mdl-js-textfield">
            <input class="search-keyword mdl-textfield__input" type="text" id="sample1" oninput="search()">
            <label class="mdl-textfield__label" for="sample1">搜索...</label>
        </div>
        <button class="add-message-btn mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
            <svg fill="#FFFFFF" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" style="position: absolute;top: 50%;left: 50%;transform: translate(-12px, -12px);">
                <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
                <path d="M0 0h24v24H0z" fill="none"/>
            </svg>
        </button>
    </div>
    <div class="new-message-container message-container mdl-grid" style="display: none">
        <div class="mdl-card mdl-shadow--2dp mdl-cell mdl-cell--12-col">
            <div class="message-title mdl-card__media mdl-color-text--grey-50" >
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="new-message-title mdl-textfield__input" style="color: white; font-size: 27px;border-bottom: 1px solid #FFFFFF;" type="text" id="sample2" oninput="search()">
                    <label class="msg-input-title_label mdl-textfield__label" style="color: white;font-size: 27px;" for="sample2">标题...</label>
                </div>
            </div>
            <div class="mdl-color-text--grey-600 mdl-card__supporting-text" >
                <div class="mdl-textfield mdl-js-textfield" style="width: 100%">
                    <textarea class="new-message-content mdl-textfield__input" type="text" id="sample3" oninput="search()"></textarea>
                    <label class="msg-input_label mdl-textfield__label" for="sample3">内容...</label>
                </div>
            </div>
            <div class="message-detail mdl-card__supporting-text mdl-color-text--grey-600">
                <div class="user-portrait"></div>
                <div style="display: flex; flex-direction: column; margin-left: 10px;">
                    <strong><%=username%></strong>
                    <span><%=time%></span>
                </div>
                <button class="submit-msg-btn mdl-button mdl-js-button mdl-button--raised" style="right: 20px;position: absolute;color: white;background-color: #FF9292">
                    上传
                </button>
            </div>
        </div>
    </div>

    <div class="message-system" ></div>

</body>
<script>
    $(".mdl-textfield").each(function() {
        componentHandler.upgradeElement($(this)[0]);
    });
    componentHandler.upgradeElement($(".add-message-btn")[0]);
    componentHandler.upgradeElement($(".submit-msg-btn")[0]);
</script>
</html>
