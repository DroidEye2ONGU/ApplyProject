<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员注册</title>
    <style>
        body{
            marrgin:0;
            padding:0;
            overflow-x: hidden;
            overflow-y: hidden;

        }
        #inner{
            width:100%;
            height:100%;
            background-color:#fff;
            padding-top: 140px;
            /*background-image: url("zbdx2.png");*/
            background-image: url("NUCRed2.jpg");
            background-repeat: no-repeat;
            background-size:200px 70px;
        }
        #inner2 {
            width: 100%;
            height: 500px;
            /*background-color:#fff;*/
            /*background-attachment: fixed;*/

            background-repeat: no-repeat;
            background-image: url("denglu7.png");

            background-size: 100% 500px;
            padding-top: 50px;

        }
        #inner3{
            border:10px inset #8dbdd2;
            width: 350px;
            height: 400px;
            /*background-color: #fff;*/
            background-image: url("LoginInner3BackGround.jpg");
            margin-left: 70%;
        }
        input.in{
            border:0;
            color: #FFF;
            font-size: 12pt;
            font-style: normal;
            font-variant: normal;
            font-weight: bold;
            height: 40px;
            width: 210px;
            line-height: normal;
            background-image: url(blue.png);
            cursor:pointer;
        }
        .a{
            text-decoration:none;
        }


    </style>
</head>
<div id="inner">
    <div id="inner2">
        <div id="inner3">
            <form method="post" action="/CreateAccountServlet">
                <br><br>&nbsp;&nbsp;<b>管理员注册</b>
                <br><br><br>&nbsp;&nbsp;注&nbsp;&nbsp;册&nbsp;&nbsp;密&nbsp;&nbsp;钥：<input type="text" name="secretKey"><br><br>
                &nbsp;&nbsp;管&nbsp;理&nbsp;员&nbsp;号&nbsp;码：<input type="text" name="adminID"><br><br>
                &nbsp;&nbsp;管&nbsp;理&nbsp;员&nbsp;密&nbsp;码：<input type="password" name="adminPassword"><br><br>
                &nbsp;&nbsp;确认管理员密码：<input type="password" name="adminPassword2"><br><br>
                &nbsp;&nbsp;管&nbsp;理&nbsp;员&nbsp;姓&nbsp;名：<input type="text" name="adminName"><br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="登录">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
            </form>

            </form>
        </div>
    </div>
</div>
</body>


</html>
