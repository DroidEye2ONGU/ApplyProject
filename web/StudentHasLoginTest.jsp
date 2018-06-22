<%--<%@ page import="DroidEye.JavaBean.ApplyBean" %>--%>
<%--<%@ page import="DroidEye.DAO.StudentDAO" %>&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: DroidEye--%>
  <%--Date: 2017/6/10--%>
  <%--Time: 18:22--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生界面</title>
</head>
<frameset cols="20%,*" border="1" frameborder="1" framecolor="bule">

    <frame src="StudentHasLoginTestLeft.jsp" name="left"/>
    <frame src="StudentHasLoginTestRight.jsp" name="right"/>

</frameset>
<%--<body>--%>

<%--<%--%>
    <%--String studentID = (String) session.getAttribute("ThisStudentID");--%>
    <%--out.print(studentID);--%>
<%--%>--%>
<%--<%--%>
    <%--ApplyBean applyBean = null;--%>
    <%--StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();--%>
    <%--applyBean = studentDAO.querySelectedProjectApplyInfo(studentID);--%>
    <%--String studentName = studentDAO.querySingleStudent(studentID).getStudentName();--%>
<%--%>--%>


<%--<h1>--%>
    <%--欢迎<%=studentID%>号学生！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <%--<a href="LogoutTest.jsp">退出登录</a>--%>
    <%--<a href="StudentChangAttributeTest.jsp">修改个人资料</a>--%>
<%--</h1>--%>

<%--<br>--%>
<%--<a href="StudentChangePassword.jsp">修改密码</a><br>--%>

<%--<center>--%>

    <%--<h1>--%>
        <%--<%--%>
            <%--if (applyBean == null) {--%>
                <%--out.print("您暂未选择项目，请先");--%>
        <%--%>--%>
        <%--<a href="StudentPasswordCheck.jsp?URL=StudentSelectedProject.jsp">申报项目</a>--%>
        <%--<%--%>
            <%--} else {--%>
                <%--session.setAttribute("ThisStudentSelectedProject",applyBean);--%>

        <%--%>--%>
        <%--<%=studentName%>--%>
        <%--您已选择的项目信息如下：<br>--%>
        <%--项目号：<%=applyBean.getProjectID()%><br>--%>
        <%--项目名：<%=applyBean.getProjectName()%><br>--%>
        <%--辅导教师号：<%=applyBean.getTeacherID()%><br>--%>
        <%--辅导教师姓名：<%=applyBean.getTeacherName()%><br>--%>
        <%--申报进度：<%=applyBean.getProjectProgress()%><br>--%>
        <%--通过状态：<%=applyBean.getPassStatus()%><br>--%>
        <%--点击<a href="StudentPasswordCheck.jsp?URL=StudentSelectedProjectMoreInfo.jsp">更多信息</a>以查看其它内容--%>
        <%--<%--%>
            <%--}--%>
        <%--%>--%>
    <%--</h1>--%>


<%--</center>--%>


<%--</body>--%>
<%--</html>--%>
