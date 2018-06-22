<%--
  Created by IntelliJ IDEA.
  User: S
  Date: 2017/6/14
  Time: 20:19
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
                width:235px;
                height:150px;

            }

            #menu2_1{
                width:150px;
                height:150px;
                background-image: url("touxiang.png");
                background-repeat: no-repeat;
                background-size:150px 150px;
                margin-left: 55px;
                padding-bottom:30px;

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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdjuChangePassword.jsp" target="right">修改密码</a><br><br><br>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentChangAttributeTest.jsp" target="right">评审项目</a><br>--%>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentPasswordCheck.jsp?URL=StudentSelectedProject.jsp" target="right">查看项目</a><br>--%>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="StudentSelectedProjectMoreInfo.jsp" target="right">查看申报项目</a><br>--%>
            <%--&lt;%&ndash;&lt;%&ndash;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdminSetProjectAdju.jsp" target="right">为项目分配管理员</a>&ndash;%&gt;&ndash;%&gt;--%>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdjuHasLoginRight.jsp" target="right">返回首页</a></h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="LogoutTest.jsp" target="_top">注销</a></h4>
        </h3>
    </div>


</div>
</body>
</html>
