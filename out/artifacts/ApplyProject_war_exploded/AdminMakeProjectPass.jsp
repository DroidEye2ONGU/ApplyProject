<%@ page import="DroidEye.DAO.StudentDAO" %>
<%@ page import="DroidEye.JavaBean.ApplyBean" %>
<%@ page import="DroidEye.DAO.TeacherDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <%
        String thisStudentID = request.getParameter("message");
        StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
        TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();
        ApplyBean applyBean = studentDAO.querySelectedProjectApplyInfo(thisStudentID);
    %>

    <%
        if (applyBean.getProjectTeach().equals("未指导")){
    %>

    <script language='javascript'>alert('该学生申报的项目尚未被教师辅导，不予通过。')</script>
    <%
        response.setHeader("refresh", "0;URL=AdminPassProject.jsp");
        } else if (applyBean.getPassStatus().equals("通过")){
    %>
    <script language='javascript'>alert('该学生申报的项目已经通过！')</script>
    <%
        response.setHeader("refresh", "0;URL=AdminPassProject.jsp");
        } else {
    %>

    <%
        if (studentDAO.setSelectedProjectPass(thisStudentID) &&
                teacherDAO.changeProjectProgress(thisStudentID,"已辅导，并通过，待评分")) {

    %>
    <script language='javascript'>alert('通过了该项目！')</script>
    <%
        response.setHeader("refresh", "0;URL=AdminPassProject.jsp");
        } else {
    %>
    <script language='javascript'>alert('通过该项目操作失败！')</script>
    <%
        response.setHeader("refresh", "0;URL=AdminPassProject.jsp");
        }
        }
    %>

</body>
</html>
