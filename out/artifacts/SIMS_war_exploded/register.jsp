<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 6/10/15
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
<div class="reg-container container">
  <div class="box reg-box"  style="display: none">
    <div class="box-title">Registration</div>
    <form class="register-submit-form form-horizontal login-form" method="post" action="">
      <div class="login-row">
        <label class="login-label">用户名</label>
        <input class="form-control login-info" name="reg-username" id="reg-username"placeholder="username"/>
      </div>
      <div class="login-row">
        <label class="login-label">密码</label>
        <input class="form-control login-info"  name="reg-password" id="reg-password" type="password" placeholder="password"/>
      </div>
      <div class="login-row">
        <label class="login-label">确认密码</label>
        <input class="form-control login-info"  name="repassword" id="repassword" type="password"placeholder="re-enter the password"/>
      </div>
      <div class="login-row">
        <label class="login-label">全名</label>
        <input class="form-control login-info"  name="fullname" id="fullname" placeholder="fullname"/>
      </div>
      <div class="login-row">
        <label class="login-label">地址</label>
        <input class="form-control login-info"  name="address" id="address" placeholder="address"/>
      </div>
      <div class="login-row">
        <label class="login-label">电话</label>
        <input class="form-control login-info"  name="phonenumber" id="phonenumber" placeholder="phone number"/>
      </div>
      <div class="login-row">
        <input type="submit" class="btn btn-primary reg-btn-submit" value="提交">
      </div>
    </form>
  </div>
</div>
</body>

