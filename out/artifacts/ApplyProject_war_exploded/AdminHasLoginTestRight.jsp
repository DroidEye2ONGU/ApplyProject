<%--
  Created by IntelliJ IDEA.
  User: S
  Date: 2017/6/14
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>left</title>
</head>
<body>
<%
    String adminID = (String) session.getAttribute("ThisAdminID");
%>
<br><br><br><br><br><br><br>
<center><h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎<%=adminID%>号管理员！

        <%--<a href="LogoutTest.jsp">退出登录</a>--%>
    </h1></center>


</body>
</html>