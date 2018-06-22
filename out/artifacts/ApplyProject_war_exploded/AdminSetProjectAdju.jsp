<%@ page import="java.util.List" %>
<%@ page import="DroidEye.JavaBean.AdjuBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DroidEye.DAO.AdjuDAO" %><%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2017/6/11
  Time: 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="RightSideBackGroundSetter.jsp"/>
<html>
<head>
    <title>Title</title>

</head>
<body>
<br><center><h3>为项目分配评审员</h3></center><br><hr/><br>
<%
    List<AdjuBean> adjuList = new ArrayList<AdjuBean>();
    AdjuDAO adjuDAO = AdjuDAO.getAdjuDAOInstance();
    adjuList = adjuDAO.queryAllAdju();
%>

<center>
    <h1>
        <%
            if (adjuList.isEmpty()){
        %>
        暂无评审员，请先添加评审员！
        <a href="AdminAddAdju.jsp">添加</a>
        <%
            } else {
        %>

        全部评审员如下<br>
        <h3>
            点击评审员学号可设置为其设置评审项目<br>
        </h3>
    </h1>
    <table width="500" border="1" align="center" id="tab2">
        <tr>
            <td align="center" valign="middle">评审员号</td>
            <td align="center" valign="middle">评审员姓名</td>
        </tr>
        <%
            for (AdjuBean adju : adjuList
                    ) {
        %>
        <tr>
            <td align="center" valign="middle">
                <a href="AdminProjectAdjuSetter.jsp?message=<%=adju.getAdjuID()%>"><%=adju.getAdjuID()%>
                </a>
            </td>
            <td align="center" valign="middle"><%=adju.getAdjuName()%>
            </td>
        </tr>
        <%
            }
            }
        %>

    </table>
    </h1>
</center>

</body>
</html>
