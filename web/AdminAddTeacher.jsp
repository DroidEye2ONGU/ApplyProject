<%@ page import="DroidEye.DAO.AdminDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<br><center><h3>添加教师信息</h3></center><br><hr/><br>
<center>
    <h3>

        <%
            int teacherNumber = AdminDAO.getAdminDAOInstance().teacherNumber();
        %>

        <form action="/AddTeacherServlet" method="post">
            请输入教师号：&nbsp;&nbsp;<input type="text" name="teacherID"><br><br>
            请输入教师姓名：<input type="text" name="teacherName"><br><br>
            <input type="submit" value="添加"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现在共有<%= teacherNumber%>位教师信息
        </form>
    </h3>
</center>
</body>
</html>
