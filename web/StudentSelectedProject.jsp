<%@ page import="java.util.List" %>
<%@ page import="DroidEye.JavaBean.ProjectBean" %>
<%@ page import="DroidEye.DAO.StudentDAO" %>
<%@ page import="DroidEye.DAO.TeacherDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
    <br>
    <center><h3>申报项目</h3></center>
    <br>
    <hr/>
    <br>
</head>
<body>

<%
    String studentID = (String) session.getAttribute("ThisStudentID");
    List<ProjectBean> projectList = null;
    StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
    projectList = studentDAO.queryAllProject();
%>
<center>
    <h2>
            <%
            if (projectList == null) {

        %>
        暂无可选申报信息，请等待教师添加。<a href="StudentHasLoginTest.jsp">返回</a>
            <%
        } else {
        %>
        以下为可选申报项目，点击项目号进一步申报</center>
<table width="1500" height="500" border="1" align="center" id="tab2">
    <tr>
        <td align="center" valign="middle">项目号</td>
        <%--<td><a href="StudentSelectThisProject.jsp?message=<%=project.getProjectID()%>" ><%=project.getProjectID()%>--%>
        </td>
        <td align="center" valign="middle">项目名</td>
        <td align="center" valign="middle">负责教师号</td>
        <td align="center" valign="middle">负责教师姓名</td>
        <td align="center" valign="middle">项目介绍</td>
    </tr>
    <%
        for (ProjectBean project : projectList) {
    %>
    <br>
    <%--<form action="/StudentChangeAttributeServlet" method="post">--%>

        <tr>
            <td><a href="StudentSelectThisProject.jsp?message=<%=project.getProjectID()%>"><%=project.getProjectID()%>
            </td>
            <td><%=project.getProjectName()%>
            </td>
            <td><%=project.getTeacherID()%>
            </td>
            <td><%=TeacherDAO.getTeacherDAOInstance().queryTeacherAccount(project.getTeacherID()).getTeacherName()%>
            </td>
            <td><%=project.getProjectInfo()%>
            </td>
    <%--</form>--%>
    </tr>
    <%--<a href="StudentSelectThisProject.jsp?message=<%=project.getProjectID()%>" >--%>
    <%--项目号：<%=project.getProjectID()%>--%>
    <%--</a> &nbsp;&nbsp;&nbsp;--%>
    <%--项目名：<%=project.getProjectName()%>&nbsp;&nbsp;&nbsp;--%>
    <%--负责教师号：<%=project.getTeacherID()%>&nbsp;&nbsp;&nbsp;--%>
    <%--负责教师姓名：<%=TeacherDAO.getTeacherDAOInstance().--%>
    <%--queryTeacherAccount(project.getTeacherID()).getTeacherName()%>&nbsp;&nbsp;&nbsp;--%>
    <%--项目介绍：<%=project.getProjectInfo()%><br>--%>
    <%
        }

    %>
</table>
<%}%>
</h2>
</center>
</body>
</html>
