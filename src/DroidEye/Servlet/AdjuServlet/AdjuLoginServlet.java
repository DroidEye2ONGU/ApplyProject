package DroidEye.Servlet.AdjuServlet;

import DroidEye.DAO.AdjuDAO;
import DroidEye.DAO.StudentDAO;
import DroidEye.JavaBean.AdjuBean;
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
@WebServlet(value = "/AdjuLoginServlet", name = "AdjuLoginServlet")
public class AdjuLoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String adjuID = request.getParameter("adjuID");
        String adjuPassword = request.getParameter("adjuPassword");

        AdjuDAO adjuDAO = AdjuDAO.getAdjuDAOInstance();
        AdjuBean adjuBean;

        adjuBean = adjuDAO.queryAdjuAccount(adjuID);


        if (adjuBean != null) {
            if (adjuBean.getAdjuPassword().equals(adjuPassword)) {
                PrintWriter out = response.getWriter();
                request.getSession().setAttribute("ThisAdjuID", adjuID);
                request.getSession().setAttribute("ThisAdjuPassword", adjuPassword);
                out.print("<script language='javascript'>alert('登录成功！')</script>");
                response.setHeader("refresh", "0;URL=AdjuHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('用户名或密码错误！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=AdjuLoginTest.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('用户名或密码错误！3秒后返回')</script>");
            response.setHeader("refresh", "3;URL=AdjuLoginTest.jsp");
        }

    }
}

