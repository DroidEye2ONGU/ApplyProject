package DroidEye.Servlet.AdjuServlet;

import DroidEye.DAO.AdjuDAO;
import DroidEye.Servlet.Common.EncodingSetter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by DroidEye on 2017/6/11.
 */
@WebServlet(value = "/AdjuChangePasswordServlet", name = "AdjuChangePasswordServlet")
public class AdjuChangePasswordServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String adjuID = (String) request.getSession().getAttribute("ThisAdjuID");
        String newAdjuPassword = request.getParameter("NewAdjuPassword");
        String newAdjuPasswordConfirm = request.getParameter("NewAdjuPasswordConfirm");

        AdjuDAO adjuDAO = AdjuDAO.getAdjuDAOInstance();

        if (newAdjuPassword.equals(newAdjuPasswordConfirm)) {
            if (adjuDAO.changeAdjuPassword(adjuID, newAdjuPassword)) {
                request.getSession().setAttribute("ThisAdjuPassword",newAdjuPassword);
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('密码修改成功！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=AdjuHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('密码修改失败！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=AdjuChangePassword.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('两次密码不同，请重新输入！')</script>");
            response.setHeader("refresh", "0;URL=AdjuChangePassword.jsp");
        }
    }
}
