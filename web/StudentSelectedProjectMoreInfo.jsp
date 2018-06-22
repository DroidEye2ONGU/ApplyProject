<%@ page import="DroidEye.JavaBean.ApplyBean" %>
<%@ page import="DroidEye.DAO.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
    <br><center><h3>查看申报项目</h3></center><br><hr/><br>
</head>
<body>

<%
    String thisStudentID = (String) session.getAttribute("ThisStudentID");
    ApplyBean apply = StudentDAO.getStudentDAOInstance().querySelectedProjectApplyInfo(thisStudentID);

%>

<center>
    <h3>
        <%=apply.getStudentName()%>
        您已选择的项目信息如下：<br>
        项目号：<%=apply.getProjectID()%><br>
        项目名：<%=apply.getProjectName()%><br>
        辅导教师号：<%=apply.getTeacherID()%><br>
        辅导教师姓名：<%=apply.getTeacherName()%><br>
        申报进度：<%=apply.getProjectProgress()%><br>
        通过状态：<%=apply.getPassStatus()%><br>
        申报内容：<%=apply.getProjectContent()%><br>
        辅导内容：<%=apply.getProjectTeach()%><br>
        目前评审员数：<%=apply.getAdjuNumber()%><br>
        目前评审总分：<%=apply.getProjectTotalScore()%>
    </h3>

    <h2>
        <a href="StudentHasLoginTestRight.jsp">返回</a>
    </h2>
</center>



</body>
</html>
