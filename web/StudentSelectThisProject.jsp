<%@ page import="DroidEye.JavaBean.ProjectBean" %>
<%@ page import="DroidEye.DAO.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
    <br><center><h3>申报项目</h3></center><br><hr/><br>
</head>
<script type="text/javascript">
    function back() {
        var back=document.getElementById("thisForm");
        back.action="StudentSelectedProject.jsp";
        back.submit();

    }
</script>
<body>

<%
    String selectedProjectID = request.getParameter("message");
    ProjectBean selectedProject;
    StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
    selectedProject = studentDAO.querySelectedProject(selectedProjectID);
%>

<center>
    <br><br><h1>
        您选择了项目号为<%=selectedProjectID%>的项目，名称为<%=selectedProject.getProjectName()%><br><br>
        <form action="/StudentApplyProjectServlet" id="thisForm">
            请添加您的申报内容：<br>
            <textarea rows="50" cols="100" name="projectContent"></textarea><br><br>
            <input type="submit" value="确认申报"> &nbsp;&nbsp;
            <input type="reset" value="重新添加"><br><br>
            <input type="hidden" name="selectedProjectID" value=<%=selectedProjectID%>
            <input type="button" onclick="back()" value="返回申报界面" >
        </form>
    </h1>
</center>


</body>
</html>
