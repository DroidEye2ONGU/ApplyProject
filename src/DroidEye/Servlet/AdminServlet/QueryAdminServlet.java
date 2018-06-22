package DroidEye.Servlet.AdminServlet;

import DroidEye.DAO.AdminDAO;
import DroidEye.JavaBean.AdminBean;
import DroidEye.Servlet.Common.EncodingSetter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by DroidEye on 2017/6/10.
 */
@WebServlet(value = "/QueryAdminServlet", name = "QueryAdminServlet")
public class QueryAdminServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EncodingSetter.setEncoding(request,response);

        String adminID = request.getParameter("adminID");
        String adminPassword = request.getParameter("adminPassword");

        AdminDAO adminDAO = AdminDAO.getAdminDAOInstance();
        AdminBean admin;

        admin = adminDAO.queryAdminAccount(adminID);

        if (admin != null) {
            if (admin.getAdminPassword().equals(adminPassword)) {
                request.getSession().setAttribute("ThisAdminID",adminID);
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('管理员登录成功！')</script>");
                response.setHeader("refresh", "0;URL=AdminHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('用户名或密码错误！')</script>");
                response.setHeader("refresh", "0;URL=AdminLoginTest.jsp");
            }
        }else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('用户名或密码错误！')</script>");
            response.setHeader("refresh", "0;URL=AdminLoginTest.jsp");
        }
    }
}
