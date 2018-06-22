<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/10
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销页面</title>
</head>
<body>
<script language='javascript'>alert('注销成功！')</script>

<%
    session.invalidate();
    response.setHeader("refresh","1;URL=index.jsp");

%>




</body>
</html>