<%@ page import="DroidEye.DAO.TeacherDAO" %>
<%@ page import="DroidEye.JavaBean.ApplyBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 3:30
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
    String thisTeacherID = (String) session.getAttribute("ThisTeacherID");
    TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();
    List<ApplyBean> projectList;
    projectList = teacherDAO.queryProjectGroupByTeacherID(thisTeacherID);
%>

<center>
    <h1><center>
        <%
            if (projectList.isEmpty()) {
        %>
        暂时没有学生申报此项目，<a href="TeacherHasLoginTestRight.jsp">返回</a></center>

        <%
        } else {
        %>
        申报此项目学生如下<br>

    </h1>
    <table width="2000" border="1" align="center" id="tab2">
        <tr>
            <td align="center" valign="middle">学生学号</td>
            <td align="center" valign="middle">学生姓名</td>
            <td align="center" valign="middle">项目号</td>
            <td align="center" valign="middle">项目名</td>
            <td align="center" valign="middle">申报内容</td>
            <td align="center" valign="middle">指导内容</td>
            <td align="center" valign="middle">申报进度</td>
            <td align="center" valign="middle">通过状态</td>
            <td align="center" valign="middle">目前总分</td>
            <td align="center" valign="middle">目前评审员数</td>
        </tr>
        <%
            for (ApplyBean apply : projectList
                    ) {
        %>
        <tr>
            <td align="center" valign="middle">
                <a href="TeacherTeachProject.jsp?message=<%=apply.getStudentID()%>"><%=apply.getStudentID()%>
                </a>
            </td>
            <td align="center" valign="middle"><%=apply.getStudentName()%>
            </td>
            <td align="center" valign="middle"><%=apply.getProjectID()%>
            </td>
            <td align="center" valign="middle"><%=apply.getProjectName()%>
            </td>
            <td align="center" valign="middle"><%=apply.getProjectContent()%>
            </td>
            <td align="center" valign="middle"><%=apply.getProjectTeach()%>
            </td>
            <td align="center" valign="middle"><%=apply.getProjectProgress()%>
            </td>
            <td align="center" valign="middle"><%=apply.getPassStatus()%>
            </td>
            <td align="center" valign="middle"><%=apply.getProjectTotalScore()%>
            </td>
            <td align="center" valign="middle"><%=apply.getAdjuNumber()%>
            </td>
        </tr>
        <%
                }
            }
        %>

    </table>
    <br><h3>
        （点击学生学号可为其添加辅导内容）
    </h3>
</center>

</body>
</html>
