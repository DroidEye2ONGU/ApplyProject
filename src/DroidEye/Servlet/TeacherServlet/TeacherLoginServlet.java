package DroidEye.Servlet.TeacherServlet;

import DroidEye.DAO.TeacherDAO;
import DroidEye.JavaBean.TeacherBean;
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
@WebServlet(value = "/TeacherLoginServlet", name = "TeacherLoginServlet")
public class TeacherLoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String teacherID = request.getParameter("teacherID");
        String teacherPassword = request.getParameter("teacherPassword");

        TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();
        TeacherBean teacherBean = null;

        teacherBean = teacherDAO.queryTeacherAccount(teacherID);

        if (teacherBean != null) {
            if (teacherBean.getTeacherPassword().equals(teacherPassword)) {
                PrintWriter out = response.getWriter();
                request.getSession().setAttribute("ThisTeacherID",teacherID);
                request.getSession().setAttribute("ThisTeacherPassword",teacherPassword);
                out.print("<script language='javascript'>alert('登录成功！')</script>");
                response.setHeader("refresh", "0;URL=TeacherHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('用户名或密码错误！')</script>");
                response.setHeader("refresh", "0;URL=TeacherLoginTest.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('用户名或密码错误！')</script>");
            response.setHeader("refresh", "0;URL=TeacherLoginTest.jsp");
        }

    }
}
