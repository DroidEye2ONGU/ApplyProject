<%--
  Created by IntelliJ IDEA.
  User: S
  Date: 2017/6/14
  Time: 14:13
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
<div id="menu1">
    <div id="menu2_1">
    </div>
    <div id="menu2_2">
        <h3><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="TeacherChangePassword.jsp" target="right">修改密码</a><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="TeacherPasswordCheck.jsp?URL=TeacherAddProjectTest.jsp" target="right">添加项目</a><br><br><br>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="TeacherTeachProject.jsp" target="right">辅导项目</a><br><br><br>--%>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdminPassProject.jsp" target="right">管理项目通过</a><br>--%>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdminSetProjectAdju.jsp" target="right">为项目分配管理员</a>--%>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="TeacherHasLoginTestRight.jsp" target="right">返回首页</a></h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="LogoutTest.jsp" target="_top">注销</a></h4>
        </h3>
    </div>


</div>
</body>
</html>
