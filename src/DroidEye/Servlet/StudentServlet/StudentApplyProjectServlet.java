package DroidEye.Servlet.StudentServlet;

import DroidEye.DAO.StudentDAO;
import DroidEye.DAO.TeacherDAO;
import DroidEye.JavaBean.ApplyBean;
import DroidEye.JavaBean.ProjectBean;
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
 * Created by DroidEye on 2017/6/11.
 */
@WebServlet(value = "/StudentApplyProjectServlet", name = "StudentApplyProjectServlet")
public class StudentApplyProjectServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String selectedProjectID = request.getParameter("selectedProjectID");
        String selectedProjectContent = request.getParameter("projectContent");
        String thisStudentID = (String) request.getSession().getAttribute("ThisStudentID");

        StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();


        String thisStudentName = studentDAO.querySingleStudent(thisStudentID).getStudentName();
        String thisTeacherID = studentDAO.querySelectedProject(selectedProjectID).getTeacherID();
        String thisTeacherName = TeacherDAO.getTeacherDAOInstance().queryTeacherAccount(
                studentDAO.querySelectedProject(selectedProjectID).getTeacherID()).getTeacherName();
        String selectedProjectName = studentDAO.querySelectedProject(selectedProjectID).getProjectName();

        ApplyBean apply = new ApplyBean();
        apply.setStudentID(thisStudentID);
        apply.setProjectID(selectedProjectID);
        apply.setTeacherID(thisTeacherID);
        apply.setStudentName(thisStudentName);
        apply.setProjectName(selectedProjectName);
        apply.setTeacherName(thisTeacherName);
        apply.setProjectContent(selectedProjectContent);

        if (studentDAO.addSelectedProject(apply)) {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('申报成功！')</script>");
            response.setHeader("refresh", "3;URL=StudentHasLoginTest.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('申报失败！')</script>");
            response.setHeader("refresh", "0;URL=StudentSelectThisProject.jsp");
        }

    }
}
