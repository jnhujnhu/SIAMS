<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 6/10/15
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function CheckPassword(submit) {
        var username = $("#username").val();
        var password = $("#password").val();

        var res = false;
        $.getJSON("checkpassword.jsp?username=" + username + "&password=" + password, function(data) {
            if(data.result == 0) {
                $(".warning1").slideDown(300);
                res = false;
            }
            else if(data.result == 2) {
                $(".warning2").slideDown(300);
                res = false;
            }
            else {
                $(".password-incorrect-warning").slideUp(300);
                res = true;
                if (submit) {
                    $(".login-submit-form").submit();
                }
            }
        });
        return res;
    }

    $(document).ready(function () {
        $(".login-btn-submit").click(function () {
            CheckPassword(true);
            return false;
        });
    });
</script>
<body>
<div class="container">
    <div class="box login-box"  style="display: none">
        <div class="box-title">Login</div>
        <form class="login-submit-form form-horizontal login-form" method="post" action="login_impl.jsp">
            <div class="login-row">
                <label class="login-label">用户名</label>
                <input class="form-control login-info login-username" id="username" name="username" placeholder="username"/>
                <div class="warning user-exist-warning"></div>
                <div class="warning user-empty-warning">User name cannot be empty.</div>
            </div>
            <div class="login-row">
                <label class="login-label">密码</label>
                <input class="form-control login-info" type="password" id="password" name="password" placeholder="password" onblur="CheckPassword()"/>
                <div class="warning1 warning password-incorrect-warning">Username not exist or Password error.</div>
                <div class="warning2 warning password-incorrect-warning">Password invalid.</div>
            </div>
            <div class="login-row">
                <input type="submit" class="btn btn-primary login-btn-submit" value="登录" />
            </div>
        </form>
    </div>
</div>
</body>

