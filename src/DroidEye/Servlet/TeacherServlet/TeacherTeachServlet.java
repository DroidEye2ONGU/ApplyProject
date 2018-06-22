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
 * Created by DroidEye on 2017/6/11.
 */
@WebServlet(value = "/TeacherTeachServlet", name = "TeacherTeachServlet")
public class TeacherTeachServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String thisStudentID = request.getParameter("thisStudentID");
        String projectTeach = request.getParameter("projectTeach");

        TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();

        if (teacherDAO.addProjectTeach(thisStudentID, projectTeach)&&
                teacherDAO.changeProjectProgress(thisStudentID,"已辅导，待通过")) {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('辅导信息添加完毕！')</script>");
            response.setHeader("refresh", "0;URL=TeacherHasLoginTest.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('辅导信息添加出现问题！')</script>");
            response.setHeader("refresh", "0;URL=TeacherTeachProject.jsp");
        }

    }
}
