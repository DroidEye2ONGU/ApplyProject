<%@ page import="java.util.List" %>
<%@ page import="DroidEye.JavaBean.ProjectBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DroidEye.DAO.TeacherDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: S
  Date: 2017/6/14
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String teacherID = (String) session.getAttribute("ThisTeacherID");


%>

<% List<ProjectBean> projectBeanList;
    projectBeanList = TeacherDAO.getTeacherDAOInstance().searchProjectGroupbyTeacher(teacherID);
    String teacherName = TeacherDAO.getTeacherDAOInstance().queryTeacherAccount(teacherID).getTeacherName();
%>

<h1><br><br><br><br>
    <center>欢迎<%=teacherID%>号教师！</center>
    <%--<a href="LogoutTest.jsp">退出登录</a>--%>
</h1>

<br>
<%--<a href="TeacherChangePassword.jsp">修改密码</a><br>--%>
<center>
    <h1>
        <%
            if (projectBeanList.isEmpty()) {
                out.print("您暂未创建项目，请先");
        %>

        <a href="TeacherPasswordCheck.jsp?URL=TeacherAddProjectTest.jsp">添加项目</a>
    </h1>
    <%
    } else {
    %>
    <h1>
        <%=teacherName%>老师，您创建的项目如下:<br>

    </h1>
    <table width="500" border="1" align="center" id="tab2">
        <tr>
            <td align="center" valign="middle">项目号</td>
            <td align="center" valign="middle">项目名</td>
        </tr>
        <tr></tr>
        <h2>
                <%
            for (ProjectBean project : projectBeanList) {

        %>
            <tr>
                <td align="center" valign="middle">
                    <a href="TeacherPasswordCheck.jsp?&URL=TeacherQueryProject.jsp">
                        <%=project.getProjectID()%>
                    </a></td>
                <td align="center" valign="middle"><%=project.getProjectName() + ""%>
                </td>
            </tr>

                <%
            }


        %>
    </table>
    <%--<h1>点此继续--%>
    <%--<a href="TeacherPasswordCheck.jsp?URL=TeacherAddProjectTest.jsp">添加项目</a>--%>
    <%--</h1>--%>
    <br><br><br>
    (点击项目号可查看选择该项目的学生)
    <%
        }
    %>

    </h2>
</center>
</body>
</html>
