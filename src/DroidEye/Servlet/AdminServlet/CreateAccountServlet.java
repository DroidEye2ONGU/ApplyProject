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
@WebServlet(value = "/CreateAccountServlet", name = "CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EncodingSetter.setEncoding(request,response);

        String adminID = request.getParameter("adminID");
        String adminPassword = request.getParameter("adminPassword");
        String adminPassword2 = request.getParameter("adminPassword2");
        String adminName = request.getParameter("adminName");
        int secretKey = Integer.parseInt(request.getParameter("secretKey"));

        if (secretKey==5256 && adminPassword.equals(adminPassword2)) {
            AdminBean adminBean = new AdminBean(adminID, adminPassword, adminName);
            AdminDAO adminDAO = AdminDAO.getAdminDAOInstance();

            if (adminDAO.createAdminAccount(adminBean)) {
                request.getSession().setAttribute("ThisAdminID", adminID);
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('管理员注册成功！已自动登录。')</script>");
                response.setHeader("refresh", "0;URL=AdminHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('管理员注册失败！')</script>");
                response.setHeader("refresh", "0;URL=AdminRegisterTest.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('管理员注册密钥错误！')</script>");
            response.setHeader("refresh", "0;URL=AdminRegisterTest.jsp");
        }




    }
}
