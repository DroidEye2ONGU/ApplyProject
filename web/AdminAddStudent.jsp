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
<br><center><h3>添加学生信息</h3></center><br><hr/><br>
<center>
    <h3>
        <%
            int studentNumber = AdminDAO.getAdminDAOInstance().studentNumber();
        %>
        <form action="/AddStudentServlet" method="post">
            请输入学生学号：<input type="text" name="studentID"><br><br>
            请输入学生姓名：<input type="text" name="studentName"><br><br>
            <input type="submit" value="添加"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现在共有<%= studentNumber%>位学生信息
        </form>
    </h3>
</center>
</body>
</html>
