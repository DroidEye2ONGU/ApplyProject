<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 0:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评审员登录</title>
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
<body>
<div id="inner">
    <div id="inner2">
        <div id="inner3">
            <form method="post" action="/AdjuLoginServlet">
                <br><br>&nbsp;&nbsp;<b>评审员登录</b>
                <br><br><br>&nbsp;&nbsp;评审员号：<input type="text" name="adjuID"><br>
                <br>&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="adjuPassword"><br>
                <br> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="登录">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">


            </form>
        </div>
    </div>
</div>


</body>
</html>
