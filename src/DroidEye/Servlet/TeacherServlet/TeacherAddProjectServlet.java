package DroidEye.Servlet.TeacherServlet;

import DroidEye.DAO.TeacherDAO;
import DroidEye.JavaBean.ProjectBean;
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
@WebServlet(value = "/TeacherAddProjectServlet", name = "TeacherAddProjectServlet")
public class TeacherAddProjectServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request,response);

        String projectID = request.getParameter("projectID");
        String projectName = request.getParameter("projectName");
        String projectInfo = request.getParameter("projectInfo");
        String teacherID = (String) request.getSession().getAttribute("ThisTeacherID");

        ProjectBean project = new ProjectBean(projectID, projectName, projectInfo, teacherID);
        TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();

        if (teacherDAO.addProject(project)) {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('添加成功！')</script>");
            response.setHeader("refresh", "1;URL=TeacherAddProjectTest.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('添加错误！')</script>");
            response.setHeader("refresh", "1;URL=TeacherAddProjectTest.jsp");
        }
    }
}
