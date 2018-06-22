<%@ page import="java.util.List" %>
<%@ page import="DroidEye.JavaBean.ProjectBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DroidEye.DAO.TeacherDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/10
  Time: 5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师界面</title>
</head>
<frameset cols="20%,*" border="1" frameborder="1" framecolor="bule">

    <frame src="TeacherHasLoginTestLeft.jsp" name="left"/>
    <frame src="TeacherHasLoginTestRight.jsp" name="right"/>

</frameset>

<%--<body>--%>

<%--<%--%>
    <%--String teacherID = (String) session.getAttribute("ThisTeacherID");--%>
    <%--out.print(teacherID);--%>

<%--%>--%>

<%--<% List<ProjectBean> projectBeanList;--%>
    <%--projectBeanList = TeacherDAO.getTeacherDAOInstance().searchProjectGroupbyTeacher(teacherID);--%>
    <%--String teacherName = TeacherDAO.getTeacherDAOInstance().queryTeacherAccount(teacherID).getTeacherName();--%>
<%--%>--%>

<%--<h1>--%>
    <%--欢迎<%=teacherID%>号教师！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <%--<a href="LogoutTest.jsp">退出登录</a>--%>
<%--</h1>--%>

<%--<br>--%>
<%--<a href="TeacherChangePassword.jsp">修改密码</a><br>--%>
<%--<center>--%>

    <%--<%--%>
        <%--if (projectBeanList.isEmpty()) {--%>
    <%--%>--%>
    <%--<h1>--%>
        <%--暂无创建项目，请--%>
        <%--<a href="TeacherPasswordCheck.jsp?URL=TeacherAddProjectTest.jsp">添加项目！</a>--%>
    <%--</h1>--%>
    <%--<%--%>
    <%--} else {--%>
    <%--%>--%>
    <%--<h1>--%>
        <%--<%=teacherName%>老师，您创建的项目如下<br>--%>
        <%--点击项目号可查看选择该项目的学生<br>--%>
    <%--</h1><br>--%>
    <%--<h2>--%>
        <%--<%--%>
            <%--for (ProjectBean project : projectBeanList) {--%>

        <%--%>--%>
        <%--<a href="TeacherPasswordCheck.jsp?&URL=TeacherQueryProject.jsp">--%>
            <%--<%="项目号：" + project.getProjectID()%>--%>
        <%--</a>--%>
        <%--<%="  项目名：" + project.getProjectName() + ""%><br>--%>
        <%--<%--%>
            <%--}--%>

        <%--%>--%>
        <%--<h1>点此继续--%>
            <%--<a href="TeacherPasswordCheck.jsp?URL=TeacherAddProjectTest.jsp">添加项目</a>--%>
        <%--</h1>--%>
        <%--<%--%>
            <%--}--%>
        <%--%>--%>
    <%--</h2>--%>
<%--</center>--%>
<%--</body>--%>
</html>
