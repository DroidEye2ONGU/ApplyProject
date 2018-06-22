package DroidEye.Servlet.TeacherServlet;

import DroidEye.DAO.TeacherDAO;
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
@WebServlet(value = "/TeacherChangePasswordServlet", name = "TeacherChangePasswordServlet")
public class TeacherChangePasswordServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String teacherID = (String) request.getSession().getAttribute("ThisTeacherID");
        String newTeacherPassword = request.getParameter("NewTeacherPassword");
        String newTeacherPasswordConfirm = request.getParameter("NewTeacherPasswordConfirm");

        TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();

        if (newTeacherPassword.equals(newTeacherPasswordConfirm)) {
            if (teacherDAO.changeTeacherPassword(teacherID, newTeacherPassword)) {
                request.getSession().setAttribute("ThisTeacherPassword",newTeacherPassword);
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('密码修改成功！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=TeacherHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('密码修改失败！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=TeacherChangePassword.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('两次密码不同，请重新输入！')</script>");
            response.setHeader("refresh", "0;URL=TeacherChangePassword.jsp");
        }

    }
}
