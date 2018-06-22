package DroidEye.Servlet.StudentServlet;

import DroidEye.DAO.StudentDAO;
import DroidEye.DAO.TeacherDAO;
import DroidEye.JavaBean.StudentBean;
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
@WebServlet(value = "/StudentChangePasswordServlet", name = "StudentChangePasswordServlet")
public class StudentChangePasswordServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);


        String studentID = (String) request.getSession().getAttribute("ThisStudentID");
        String newStudentPassword = request.getParameter("NewStudentPassword");
        String newStudentPasswordConfirm = request.getParameter("NewStudentPasswordConfirm");

        StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();



        if (newStudentPassword.equals(newStudentPasswordConfirm)) {
            if (studentDAO.changeStudentPassword(studentID, newStudentPassword)) {
                request.getSession().setAttribute("ThisStudentPassword",newStudentPassword);
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('密码修改成功！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=StudentHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('密码修改失败！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=StudentChangePassword.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('两次密码不同，请重新输入！')</script>");
            response.setHeader("refresh", "0;URL=StudentChangePassword.jsp");
        }
    }
}
