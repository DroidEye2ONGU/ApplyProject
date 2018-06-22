<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="DroidEye.JavaBean.JudgeBean" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page import="DroidEye.DAO.AdjuDAO" %>--%>
<%--<%@ page import="DroidEye.DAO.StudentDAO" %>--%>
<%--<%@ page import="DroidEye.JavaBean.ApplyBean" %>--%>
<%--<%@ page import="DroidEye.JavaBean.ProjectBean" %>--%>
<%--<%@ page import="DroidEye.DAO.JudgeDAO" %>&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: DroidEye--%>
  <%--Date: 2017/6/11--%>
  <%--Time: 0:41--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评审员界面</title>
</head>
<frameset cols="20%,*" border="1" frameborder="1" framecolor="bule">

    <frame src="AdjuHasLoginLeft.jsp" name="left"/>
    <frame src="AdjuHasLoginRight.jsp" name="right"/>

</frameset>
<%--<body>--%>

<%--<%--%>
    <%--String adjuID = (String) session.getAttribute("ThisAdjuID");--%>
    <%--String adjuPassword = AdjuDAO.getAdjuDAOInstance().queryAdjuAccount(adjuID).getAdjuPassword();--%>
    <%--String adjuName = AdjuDAO.getAdjuDAOInstance().queryAdjuAccount(adjuID).getAdjuName();--%>
<%--%>--%>


<%--<h1>--%>
    <%--欢迎<%=adjuID%>号评审员！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <%--<a href="LogoutTest.jsp">退出登录</a>--%>
<%--</h1>--%>
<%--<br>--%>
<%--<a href="AdjuChangePassword.jsp">修改密码</a><br>--%>

<%--<%--%>

    <%--List<JudgeBean> judgeList;--%>
    <%--StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();--%>
    <%--judgeList = JudgeDAO.getJudgeDAOInstance().queryAllNonAdju(adjuID);--%>

<%--%>--%>
<%--<center>--%>
    <%--<h1>--%>
        <%--欢迎<%=adjuName%><br>--%>
        <%--<%--%>
            <%--if (adjuPassword.equals("123456")) {--%>
        <%--%>--%>
        <%--您未修改密码，修改密码后方可查看和评审--%>
        <%--<%--%>
        <%--} else {--%>
            <%--if (judgeList.isEmpty()) {--%>
        <%--%>--%>
        <%--目前没有需要评审的项目,请等待管理员添加。<br>--%>
        <%--<%--%>
        <%--} else {--%>
        <%--%>--%>
        <%--<table width="2300" border="1" align="center">--%>
            <%--<tr>--%>
                <%--<td align="center" valign="middle">项目号</td>--%>
                <%--<td align="center" valign="middle">项目名</td>--%>
                <%--<td align="center" valign="middle">申报学生号</td>--%>
                <%--<td align="center" valign="middle">申报学生名</td>--%>
                <%--<td align="center" valign="middle">项目介绍</td>--%>
                <%--<td align="center" valign="middle">申报内容</td>--%>
                <%--<td align="center" valign="middle">请打分</td>--%>
            <%--</tr>--%>

            <%--<%--%>
                <%--for (JudgeBean judge : judgeList--%>
                        <%--) {--%>
                    <%--String projectID = judge.getProjectID();--%>
                    <%--String studentID = judge.getStudentID();--%>
                    <%--ApplyBean thisApplyProject = studentDAO.querySelectedProjectApplyInfo(studentID);--%>
                    <%--String projectName = thisApplyProject.getProjectName();--%>
                    <%--String studentName = thisApplyProject.getStudentName();--%>
                    <%--//项目介绍--%>
                    <%--String projectInfo = studentDAO.querySelectedProject(projectID).getProjectInfo();--%>
                    <%--//申报内容--%>
                    <%--String projectContent = thisApplyProject.getProjectContent();--%>
                    <%--//该项目总评审员数--%>
                    <%--String adjuNumber = thisApplyProject.getAdjuNumber();--%>
                    <%--//已经为该项目打了分的评审员数--%>
                    <%--String hasScoredAdjuNumber = thisApplyProject.getHasScoredAdjuNumber();--%>
            <%--%>--%>


            <%--<tr>--%>
                <%--<form action="/AdjuScoreServlet" method="post">--%>
                    <%--<td align="center" valign="middle"><%=projectID%>--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle"><%=projectName%>--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle"><%=studentID%>--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle"><%=studentName%>--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle"><%=projectInfo%>--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle"><%=projectContent%>--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle">--%>
                        <%--请打分：<input type="text" name="adjuScore">--%>
                    <%--</td>--%>
                    <%--<td align="center" valign="middle">--%>
                        <%--<input type="submit" value="提交打分">--%>
                        <%--<input type="hidden" value="<%=studentID%>" name="studentID">--%>
                        <%--<input type="hidden" value="<%=adjuID%>" name="adjuID">--%>
                        <%--<input type="hidden" value="<%=projectID%>" name="projectID">--%>
                        <%--<input type="hidden" value="<%=adjuNumber%>" name="adjuNumber">--%>
                        <%--<input type="hidden" value="<%=hasScoredAdjuNumber%>" name="hasScoredAdjuNumber">--%>
                    <%--</td>--%>
                <%--</form>--%>
            <%--</tr>--%>
            <%--<%--%>
                        <%--}--%>
                    <%--}--%>
                <%--}--%>
            <%--%>--%>
        <%--</table>--%>

    <%--</h1>--%>
<%--</center>--%>


<%--</body>--%>
</html>
