<%@ page import="DroidEye.DAO.StudentDAO" %>
<%@ page import="DroidEye.DAO.JudgeDAO" %>
<%@ page import="DroidEye.JavaBean.JudgeBean" %>
<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>
        <%
            //String thisAdjuID = (String) session.getAttribute("ThisAdjuID");
            String thisStudentID = request.getParameter("message");
            String thisAdjuID = request.getParameter("message2");
            StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
            String thisProjectID = studentDAO.querySelectedProjectApplyInfo(thisStudentID).getProjectID();
            JudgeDAO judgeDAO = JudgeDAO.getJudgeDAOInstance();
            JudgeBean judgeBean = new JudgeBean(thisStudentID, thisProjectID, thisAdjuID);
            int adjuNumber = Integer.parseInt(studentDAO.getSelectedProjectAdjuNumber(thisStudentID));
        %>

        <%
            if (judgeDAO.isRepetitive(thisAdjuID,thisStudentID,thisProjectID)){
        %>
        <script language='javascript'>alert('已经是这个项目的评审员！')</script>
        <%
            //session.invalidate();
            response.setHeader("refresh", "0;URL=AdminSetProjectAdju.jsp");
            }else {
        %>

        <%
            if (judgeDAO.setAdju(judgeBean)) {
        %>
        <script language='javascript'>alert('设置评审员成功')</script>
        <%
            adjuNumber++;
            studentDAO.setSelectedProjectAdjuNumber(thisStudentID,Integer.toString(adjuNumber));
            //session.invalidate();
            response.setHeader("refresh", "0;URL=AdminSetProjectAdju.jsp");
        } else {
        %>
        <script language='javascript'>alert('设置评审员失败')</script>
        <%
            //session.invalidate();
            response.setHeader("refresh", "0;URL=AdminSetProjectAdju.jsp");
            }}
        %>
    </h1>
</center>


</body>
</html>
