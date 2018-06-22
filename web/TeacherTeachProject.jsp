<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
    <br><center><h3>辅导项目</h3></center><br><hr/><br>
</head>
<body>

<%
    String thisStudentID = request.getParameter("message");
%>
<center>
    <h1>
        为学号为<%=thisStudentID%>的同学辅导：<br>
    </h1>
    <h2>

        <form action="/TeacherTeachServlet" method="post">
            <textarea name="projectTeach" cols="100" rows="50"></textarea><br>
            <input type="hidden" name="thisStudentID" VALUE="<%=thisStudentID%>"><br>
            <input type="submit" value="确认辅导提交">
        </form>
    </h2>
</center>


</body>
</html>
