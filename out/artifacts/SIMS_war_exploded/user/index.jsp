<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 5/12/16
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("userid") == null) {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
<html>
<head>
    <title>SIAMS</title>
    <script src="../mdl/material.min.js"></script>
    <script src="../js/jquery-2.2.3.min-2.js"></script>
    <link href="../mdl/material.min.css" rel="stylesheet">
    <link href="../css/mainframe_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script type="text/javascript">
        $(document).ready(function() {
            $('.mainframe-test').load("welcome.jsp");

            $(".mdl-navigation > a").click(function() {
                $('.mainframe-test').load($(this).attr('href'));
                if(document.querySelector("dialog").hasAttribute('open')) {
                    document.querySelector("dialog").close();
                }
                return false;
            });
        });
    </script>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer
            mdl-layout--fixed-header" style="height: 120%;">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <a class="mdl-navigation__link" href="">欢迎, <%=session.getAttribute("username")%>!</a>
            </nav>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <div class="user-information">
            <img src="../assets/user.jpeg" class="demo-avatar">
            <div class="demo-avatar-dropdown" style="margin-top: 10px;margin-left: 5px;">
                <span><%=session.getAttribute("username")%></span>
                <div class="mdl-layout-spacer"></div>
                <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                    <svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7 10l5 5 5-5z"/>
                        <path d="M0 0h24v24H0z" fill="none"/>
                    </svg>
                    <span class="visuallyhidden">Accounts</span>
                </button>
                <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
                    <li class="mdl-menu__item">个人资料</li>
                    <li class="mdl-menu__item" onclick="location.href='logout.jsp'">注销...</li>
                </ul>
            </div>
        </div>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="schedule.jsp">日程表</a>
            <a class="mdl-navigation__link"  href="filemanagement.jsp">学习资料管理</a>
            <a class="mdl-navigation__link" href="message.jsp">留言墙</a>
            <a class="mdl-navigation__link" href="about.jsp">关于</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="mainframe-test" style="padding-bottom: 20px"></div>
    </main>
    <div id="add-course-toast" class="mdl-js-snackbar mdl-snackbar" style="z-index: 21">
        <div class="mdl-snackbar__text"></div>
        <button class="mdl-snackbar__action" type="button"></button>
    </div>
    <div id="add-news-toast" class="mdl-js-snackbar mdl-snackbar" style="z-index: 21">
        <div class="mdl-snackbar__text"></div>
        <button class="mdl-snackbar__action" type="button"></button>
    </div>
    <footer class="mdl-mini-footer" style="z-index: 20">
        <div class="mdl-mini-footer__left-section">
            <div class="mdl-logo">SIAMS1.0.0 </div>
            <ul class="mdl-mini-footer__link-list">
                <li><a href="#">Help</a></li>
                <li><a href="#">Privacy & Terms</a></li>
            </ul>
        </div>
    </footer>
</div>
<dialog class="mdl-dialog" style="z-index: 10;margin-top: 150px;">
    <h4 class="mdl-dialog__title">添加文件描述</h4>
    <div class="mdl-dialog__content">
        <div class="mdl-textfield mdl-js-textfield">
            <input class="mdl-textfield__input" type="text" id="file-description">
            <label class="mdl-textfield__label" style="margin-bottom: -1px" for="file-description">文件描述...</label>
        </div>
    </div>
    <div class="mdl-dialog__actions">
        <button type="button" id="confirm-upload" class="mdl-button">上传</button>
        <button type="button" id="cancel-upload" class="mdl-button">取消</button>
    </div>
</dialog>
</body>
</html>
