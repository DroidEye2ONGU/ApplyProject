<%@ page import="DroidEye.DAO.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: S
  Date: 2017/6/14
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>left</title>
    <style>
        a{
            text-decoration:none;
            text-align:center;
            line-height:50px;

        }

        #menu2_2{
            width:235;
            height:150;

        }

        #menu2_1{
            width:150;
            height:150;
            background-image: url("touxiang.png");
            background-repeat: no-repeat;
            background-size:150px 150px;
            margin-left:55;
            padding-bottom:30;

        }

        #menu1{
            width:100%;
            height:97.3%;
            background-image: url("LeftBackGround.png");
            background-repeat: no-repeat;
            padding-top:26px;

        }
        *{
            margin:0;
            padding:0;
        }
    </style>

</head>
<body>
<%
    String studentID = (String) session.getAttribute("ThisStudentID");
%>
<div id="menu1">
    <div id="menu2_1">
    </div>
    <div id="menu2_2">
        <h3><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentChangePassword.jsp" target="right">修改密码</a><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentChangAttributeTest.jsp" target="right">修改个人信息</a><br>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentPasswordCheck.jsp?URL=StudentSelectedProject.jsp" target="right">申报项目</a><br><br><br>--%>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentSelectedProjectMoreInfo.jsp" target="right">查看申报项目</a><br><br><br>--%>
            <%
                if (StudentDAO.getStudentDAOInstance().querySelectedProjectApplyInfo(studentID) == null){
            %>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentPasswordCheck.jsp?URL=StudentSelectedProject.jsp" target="right">申报项目</a><br><br><br>
            <%
                } else {
            %>
            <br><br><br>
            <%
                }
            %>

            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentHasLoginTestRight.jsp" target="right">返回首页</a></h4>
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="LogoutTest.jsp" target="_top">注销</a></h4>
        </h3>
    </div>


</div>
</body>
</html>
