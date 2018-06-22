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
@WebServlet(value = "/StudentLoginServlet", name = "StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);


        String studentID = request.getParameter("studentID");
        String studentPassword = request.getParameter("studentPassword");


        StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
        StudentBean studentBean;

        studentBean = studentDAO.queryStudentAccount(studentID);


        if (studentBean != null) {
            if (studentBean.getStudentPassword().equals(studentPassword)) {
                PrintWriter out = response.getWriter();
                request.getSession().setAttribute("ThisStudentID",studentID);
                request.getSession().setAttribute("ThisStudentPassword",studentPassword);
                out.print("<script language='javascript'>alert('登录成功！')</script>");
                response.setHeader("refresh", "0;URL=StudentHasLoginTest.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('用户名或密码错误！3秒后返回')</script>");
                response.setHeader("refresh", "3;URL=StudentLoginTest.jsp");
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('用户名或密码错误！3秒后返回')</script>");
            response.setHeader("refresh", "3;URL=StudentLoginTest.jsp");
        }

    }
}
