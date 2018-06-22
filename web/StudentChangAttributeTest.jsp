<%@ page import="DroidEye.DAO.StudentDAO" %>
<%@ page import="DroidEye.JavaBean.StudentBean" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/10
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>
    <br><center><h3>修改个人信息</h3></center><br><hr/><br>
</head>
<body>

<%
    String studentID = (String) session.getAttribute("ThisStudentID");
%>

<%
    StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
    StudentBean student = studentDAO.querySingleStudent(studentID);
    String sex = student.getStudentSex();
    String thisStudentClass = student.getStudentClass().equals("未知") ? "" : student.getStudentClass();
    String thisStudentPhoneNumber = student.getStudentPhoneNumber().equals("未知") ? "" : student.getStudentPhoneNumber();

    boolean isMale = ((sex.equals("未知")) || (sex.equals("男"))) ? true : false;
    boolean isFemale = sex.equals("女") ? true : false;

%>
<center>
<form action="/StudentChangeAttributeServlet" method="post">
    <table width="318" height="167" border="1" align="center">
        <tr>
            <td align="center" valign="middle">ID</td>
            <td><%=student.getStudentID()%>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">姓名</td>
            <td><%=student.getStudentName()%>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">性别</td>
            <td>
                <%
                    if (isMale) {
                %>
                <input type="radio" name="studentSex" value="男" checked="checked"/>男
                <input type="radio" name="studentSex" value="女"/>女
                <%
                } else {
                %>
                <input type="radio" name="studentSex" value="男"/>男
                <input type="radio" name="studentSex" value="女" checked="checked"/>女
                <%
                    }
                %>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">班级</td>
            <td>
                <input type="text" name="studentClass" value=<%=thisStudentClass%>>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">手机号</td>
            <td>
                <input type="text" name="studentPhoneNumber" value=<%=thisStudentPhoneNumber%>>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="确认修改">
            </td>
            <td>
                <input type="button" onclick="location='StudentHasLoginTest.jsp'" value="返回">
            </td>
        </tr>
    </table>
</form>
</center>
</body>
</html>
