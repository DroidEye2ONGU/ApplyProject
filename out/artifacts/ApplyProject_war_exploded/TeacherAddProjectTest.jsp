<%@ page import="DroidEye.DAO.TeacherDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/10
  Time: 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>教师添加项目</title>
    <br><center><h3>添加项目</h3></center><br><hr/><br>
    <style>
        .textarea{
            resize:none;
        }
    </style>
</head>
<body>
<center>
<h3>

<form action="/TeacherAddProjectServlet" method="post">
    项目号：&nbsp;&nbsp;<input type="text" name="projectID"><br><br>
    项目名：&nbsp;&nbsp;<input type="text" name="projectName"><br><br>
    项目介绍：<br><textarea rows="35" cols="120" name="projectInfo"></textarea><br><br>
    <input type="submit" value="添加">&nbsp;&nbsp;<input type="button" onclick="location='TeacherHasLoginTestRight.jsp'" value="返回">&nbsp;&nbsp;已添加<%=TeacherDAO.getTeacherDAOInstance().projectNumber()%>个项目
</form>

    </h3>
</center>
</body>
</html>
