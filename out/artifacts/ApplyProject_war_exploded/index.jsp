<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>创新创业项目申报管理系统</title>
    <link href="" type="image/x-icon" rel="SHORTCUT ICON" />

     <style>
       .section{
         width: 100%;
         height: 100%;
         background-size: cover;
         background-repeat: no-repeat;
         position: relative;
       }
       .content{
         box-sizing: border-box;
         max-height: 500px;
         min-width: 1000px;
         line-height: 1;
         color: #fff;
         text-align: center;
         z-index: 1000;
         position: relative;
       }

       .content .t{
         font-size: 80px;
       }
       .content a.t{
         color: #fff;
         display: inline-block;
       }
       .content a.t:hover{
         text-shadow: 0 0 5px #FFF;
       }
       .content .desc{
         height: 46px;
         line-height: 44px;
         width: 475px;
         margin: 28px auto 80px auto;
         box-sizing: border-box;
         border-width: 1px 0;
         border-color: #fff;
         border-style: solid;
         font-size: 24px;
       }

       .content a{
         color: #fff;
         -webkit-transition: all 0.2s ease-in;
         transition: all 0.2s ease-in;
       }
       .content .links{
         font-size: 0;
         /*padding: 100px 0 80px 0;*/
       }
       .content .links a{
         display: inline-block;
         margin-left: 45px;
         text-indent: 20px;
         font-size: 16px;
         height: 20px;
         box-sizing: border-box;
         border-style: solid;
         border-color: transparent;
         border-width: 0 0 1px 0;
       }
       .content .links a:after{
         content: '';
         width: 0;
         margin-top: 5px;
         height: 1px;
         display: block;
         background: #fff;
         transition: all 0.4s ease;
         -moz-transition: all 0.4s ease;
         -webkit-transition: all 0.4s ease;
       }
       .content .links a:hover:after{
         width: 100%;
       }
       .content .links a:first-child{
         margin-left: 0;
       }

       .content a.more{
         box-sizing: border-box;
         display: inline-block;
         width: 200px;
         height: 60px;
         border-radius: 60px;
         -webkit-border-radius: 60px;
         -moz-border-radius: 60px;
         text-align: center;
         line-height: 60px;
         border: solid 1px #fff;
         font-size: 28px;
       }
       .content .more:hover{
         box-shadow: 0px 10px 10px rgba(255, 255, 255, 0.05) inset, 0px 0px 30px rgba(255, 255, 255, 0.7);
         -moz-box-shadow: 0px 10px 10px rgba(255, 255, 255, 0.05) inset, 0px 0px 30px rgba(255, 255, 255, 0.7);
         -webkit-box-shadow: 0px 10px 10px rgba(255, 255, 255, 0.05) inset, 0px 0px 30px rgba(255, 255, 255, 0.7);
       }

       .section .page-logo{
         display: block;
         background-repeat: no-repeat;
         background-position: center center;
         background-size: auto 40px;
         position: absolute;
         bottom: 35px;
         left: 0;
         right: 0;
         margin: auto;
         height: 40px;
         width: auto;
         z-index: 10000;
       }
       .page1 .t{
         padding-bottom: 50px;
       }
       .page1 .t span{
         padding: 0 25px;
         font-size: 60px;
       }


       body{
         margin:0;
         font-family: "Microsoft YaHei","微软雅黑","Arial, Geneva, sans-serif";
       }
       #top{
         font-size: 30px;
         max-width:200%;
         height:100%;
         background-color: #000;
         background-image: url("header-background2.jpg");
         /*background-image: url("header-background4.jpg");*/
         //background-attachment: fixed;
         //background-size:1450px 800px;
         margin-left: auto;
         margin-right:auto;
         overflow:hidden ;
       }
       {
         text-decoration: none;
         cursor: pointer;
       }
       ol,ul ,li{ list-style-type:none;list-style: none; }
       caption,th { text-align:left; }
       img{vertical-align:middle;border:0;}
       q:before,q:after { content:''; }
       .clearfix:before,.clearfix:after{
         content:"";
         display:table;
       }
       body{
         line-height: 1;
         background: #fff;
         overflow-x: hidden;
       }
       .page1 .t {
         padding-bottom: 50px;
       }
     </style>
  </head>
  <body>

  <div id="top">
    <div class="section page1">
      <div class="logo fl">
        <a href="" >
          <%--<img src="NUC.jpg" width="25%" alt="logo"/>--%>
          <img src="NUC.jpg" width="25%" alt="logo"/>
        </a>
      </div>

      <div class="content">

        <p class="t">创新创业项目申报管理系统</p>
        <div class="links">
          <a href="StudentLoginTest.jsp" target="_blank">学生登录</a>
          <a href="TeacherLoginTest.jsp" target="_blank">教师登录</a>
          <a href="AdjuLoginTest.jsp" target="_blank">评审员登录</a>
          <a href="AdminLoginTest.jsp" target="_blank">管理员登录</a>
        </div>
      </div>
    </div>

    <div>
    <%--<div id="top2">--%>
      <%--<a href="" >创新创业项目申报管理系统</a>--%>
    </div>

    <%--<a href="StudentLoginTest.jsp">学生登录</a><br>--%>
    <%--<a href="TeacherLoginTest.jsp">教师登录</a><br>--%>
    <%--<a href="AdjuLoginTest.jsp">评审员登录</a>--%>
    <%--<a href="AdminLoginTest.jsp">管理员登录</a>--%>

  </div>
  </body>
</html>




