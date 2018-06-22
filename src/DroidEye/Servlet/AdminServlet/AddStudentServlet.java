package DroidEye.Servlet.AdminServlet;

import DroidEye.DAO.AdminDAO;
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
@WebServlet(value = "/AddStudentServlet", name = "AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EncodingSetter.setEncoding(request,response);

        String studentID = request.getParameter("studentID");
        String studentName = request.getParameter("studentName");

        PrintWriter out = response.getWriter();
        AdminDAO adminDAO = AdminDAO.getAdminDAOInstance();


        if (adminDAO.isHaveStudent(studentID)) {
            out.print("<script language='javascript'>alert('已经存在该学生')</script>");
            response.setHeader("refresh", "1;URL=AdminAddStudent.jsp");
        } else {
            if (adminDAO.createStudentAccount(studentID, studentName)) {
                out.print("<script language='javascript'>alert('添加成功！')</script>");
                response.setHeader("refresh", "1;URL=AdminAddStudent.jsp");
            } else {
                out.print("<script language='javascript'>alert('添加失败！')</script>");
                response.setHeader("refresh", "1;URL=AdminAddStudent.jsp");
            }
        }
    }
}
