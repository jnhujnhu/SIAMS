<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 5/12/16
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  if(session.getAttribute("userid") != null) {
    response.sendRedirect(request.getContextPath() + "/user");
  }
%>
<html>
  <head>
    <title>SIAMS</title>
    <script src="mdl/material.min.js"></script>
    <script src="js/jquery-2.2.3.min-2.js"></script>
    <link href="mdl/material.min.css" rel="stylesheet">
    <link href="css/welcome_page_style.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/login_registerbox_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script>
      $(document).ready(function() {
        setTimeout(function() {
          $(".welcome-main-content").fadeIn(300);
        } ,700);
        var f = true;
        var df = true;
        var dclick = true;
        var timeout;
        function showloginbox() {
          if(f == true&& dclick == true) {
            dclick = false;
            $(".welcome-main-content").fadeOut(300)
            clearTimeout(timeout);
            timeout = setTimeout(function () {
              $(".login-box").fadeIn(300);
              $(".reg-box").fadeOut(300);
            }, 300);
            setTimeout(function () {
              f = false;
              df = false;
              dclick = true;
            }, 600);
          }
          else if(df == false) {
            $(".reg-box").fadeOut(300);
            clearTimeout(timeout);
            timeout = setTimeout(function () {
              $(".login-box").fadeIn(300);
            }, 300);
          }
        }
        $("#login-button2").click(function () {
            showloginbox();
        })
        $("#login-button").click(function() {
            showloginbox();
        });
        $("#register-button").click(function() {
          if(f == true && dclick == true) {
            dclick = false;
            $(".welcome-main-content").fadeOut(300);
            clearTimeout(timeout);
            timeout = setTimeout(function () {
              $(".login-box").fadeOut(300);
              $(".reg-box").fadeIn(300);
            }, 300);
            setTimeout(function () {
              f = false;
              df = false;
              dclick = true;
            }, 600);
          }
          else if(df == false)
          {
            $(".login-box").fadeOut(300);
            clearTimeout(timeout);
            timeout = setTimeout(function () {
              $(".reg-box").fadeIn(300);
            }, 300);
          }
        });
      });
    </script>
  </head>
  <body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="welcome-header mdl-layout__header">
        <div class="mdl-layout__header-row">
          <svg class="welcome-header-logo" xmlns="http://www.w3.org/2000/svg" version="1.1" id="Capa_1" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 101.87 101.871" style="enable-background:new 0 0 101.87 101.871;" xml:space="preserve">
            <g>
              <g>
                <path d="M59.982,52.064H48.094l4.649-7.262h8.933c6.375,0,10.115-2.36,12.399-6.322l11.313-18.045h-41.18    c-4.852,0-8.827,2.97-10.99,6.72L0,81.435h10.638l29.517-48.132c1.184-2.053,4.371-3.831,7.287-3.831h22.167l-2.774,4.672    c-0.655,1.136-1.978,2.105-3.103,2.105H51.191c-2.13,0-3.912,1.09-4.719,2.49L34.771,57.25c-1.117,1.938-0.466,3.205,1.358,3.205    h15.057l-12.824,20.98h10.639l14.796-24.25C65.62,54.024,64.062,52.064,59.982,52.064z" fill="rebeccapurple"/>
                <polygon points="91.232,52.387 73.824,81.435 84.462,81.435 101.87,52.387   " fill="cadetblue"/>
                <polygon points="73.501,52.387 56.094,81.435 66.73,81.435 84.141,52.387   " fill="darkmagenta"/>
              </g>
            </g>
          </svg>
          <span class="mdl-layout-title" style="color: #455a64">SIAMS</span>
          <div class="mdl-layout-spacer"></div>
            <nav class="mdl-navigation">
              <button id="login-button" class="welcome-header-login-button mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                现在就登录
              </button>
              <button id="register-button" class="mdl-button mdl-js-button" style="color: gray; margin-right: 200px; margin-left: 5px">注册</button>
            </nav>
        </div>
      </header>
    </div>
    <div class="welcome-main-background">
    </div>
    <div class="welcome-main-content">了不起的先进学生信息辅助系统,<br/>以更先进的形态呈现.<br/>
      <button id="login-button2" class="welcome-main-content-login-button mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
        现在就登录
      </button>
    </div>
    <%@include file="login.jsp"%>
    <%@include file="register.jsp"%>`
  </body>
</html>
