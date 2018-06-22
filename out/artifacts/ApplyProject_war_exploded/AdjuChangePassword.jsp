<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <br><center><h3>修改密码</h3></center><br><hr/><br>
</head>
<body>
<center><h3>
<form method="post" action="/AdjuChangePasswordServlet">
    请输入新密码：<input type="password" name="NewAdjuPassword"><br><br>
    请确认输入：&nbsp;&nbsp;<input type="password" name="NewAdjuPasswordConfirm"><br><br>
    <input type="submit" value="确认更改">&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></h3>
</form>
</center>
</body>
</html>
