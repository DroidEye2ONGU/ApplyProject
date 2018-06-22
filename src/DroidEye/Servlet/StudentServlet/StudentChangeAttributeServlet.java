package DroidEye.Servlet.StudentServlet;

import DroidEye.DAO.StudentDAO;
import DroidEye.JavaBean.StudentBean;
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
@WebServlet(value = "/StudentChangeAttributeServlet", name = "StudentChangeAttributeServlet")
public class StudentChangeAttributeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);


        String studentID = (String) request.getSession().getAttribute("ThisStudentID");
        String studentSex = request.getParameter("studentSex");
        String studentClass = request.getParameter("studentClass");
        String studentPhoneNumber = request.getParameter("studentPhoneNumber");

        StudentBean student = new StudentBean();
        student.setStudentID(studentID);
        student.setStudentSex(studentSex);
        student.setStudentClass(studentClass);
        student.setStudentPhoneNumber(studentPhoneNumber);

        StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();

            if (studentDAO.updateStudent(student, studentID)) {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('个人信息修改成功！3秒后刷新')</script>");
            response.setHeader("refresh", "3;URL=StudentChangAttributeTest.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('个人信息修改失败！3秒后刷新')</script>");
            response.setHeader("refresh", "3;URL=StudentChangAttributeTest.jsp");
        }

    }
}
