<%@ page import="DroidEye.JavaBean.ApplyBean" %>
<%@ page import="java.util.List" %>
<%@ page import="DroidEye.DAO.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 6:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
    <br><center><h3>为项目分配管理员</h3></center><br><hr/><br>
</head>
<body>

<%
    String thisAdjuID = request.getParameter("message");
    //session.setAttribute("ThisAdjuID",thisAdjuID);
    List<ApplyBean> projectList;
    StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
    projectList = studentDAO.queryAllSelectedProject();
%>
<center>
    <h1>
        <%
            if (projectList.isEmpty()) {

        %>
        暂无申报项目信息，请督促教师添加。<a href="AdminHasLoginTest.jsp">返回</a>
        <%
        } else {
        %>
        可分配评审员的项目如下<br>
        <h3>
            点击学生学号可为其设置评审员<br>
        </h3>
    </h1>
    <table width="2000" border="1" align="center" id="tab2">
        <tr>
            <td align="center" valign="middle">学生学号</td>
            <td align="center" valign="middle">学生姓名</td>
            <td align="center" valign="middle">负责教师号</td>
            <td align="center" valign="middle">负责教师姓名</td>
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
                if (apply.getProjectProgress().equals("已辅导，并通过，待评分")&&
                        apply.getPassStatus().equals("通过")) {
        %>
        <tr>
            <td align="center" valign="middle">
                <a href="AdminMakeProjectAdju.jsp?message=<%=apply.getStudentID()%>&message2=<%=thisAdjuID%>">
                    <%=apply.getStudentID()%>
                </a>
            </td>
            <td align="center" valign="middle"><%=apply.getStudentName()%>
            </td>
            <td align="center" valign="middle"><%=apply.getTeacherID()%>
            </td>
            <td align="center" valign="middle"><%=apply.getTeacherName()%>
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
            }
        %>

    </table><br><a href="AdminSetProjectAdju.jsp">返回</a>
    </h1>
</center>
</body>
</html>
