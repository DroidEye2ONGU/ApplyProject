package DroidEye.Servlet.AdjuServlet;

import DroidEye.DAO.JudgeDAO;
import DroidEye.DAO.StudentDAO;
import DroidEye.DAO.TeacherDAO;
import DroidEye.Servlet.Common.EncodingSetter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

/**
 * Created by DroidEye on 2017/6/11.
 */
@WebServlet(value = "/AdjuScoreServlet", name = "AdjuScoreServlet")
public class AdjuScoreServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EncodingSetter.setEncoding(request, response);

        String adjuScore = request.getParameter("adjuScore");
        if (!Pattern.compile("^(0*100(\\.0+)?|(0*[1-9][0-9]?(\\.\\d+)?)|0+\\.\\d*[1-9]\\d*)").matcher(adjuScore).matches()) {
            PrintWriter out = response.getWriter();
            out.print("<script language='javascript'>alert('评审分无效，请输入不包括0分，最大100分的分数！')</script>");
            response.setHeader("refresh", "1;URL=AdjuHasLoginTest.jsp");
        } else {
            String studentID = request.getParameter("studentID");
            String projectID = request.getParameter("projectID");
            String adjuID = request.getParameter("adjuID");


            float projectTotalScore;
            int adjuNumber = Integer.parseInt(request.getParameter("adjuNumber"));
            int hasScoredAdjuNumber = Integer.parseInt(request.getParameter("hasScoredAdjuNumber"));

            StudentDAO studentDAO = StudentDAO.getStudentDAOInstance();
            JudgeDAO judgeDAO = JudgeDAO.getJudgeDAOInstance();

            projectTotalScore = Float.parseFloat(studentDAO.querySelectedProjectApplyInfo(studentID).getProjectTotalScore());


            if (judgeDAO.addScore(studentID, projectID, adjuID, adjuScore, hasScoredAdjuNumber)) {
                hasScoredAdjuNumber++;
                projectTotalScore += Float.parseFloat(adjuScore);
                projectTotalScore /= hasScoredAdjuNumber;
                if (judgeDAO.updateTotalScore(studentID, Float.toString(projectTotalScore))) {
                    if (hasScoredAdjuNumber == adjuNumber) {
                        TeacherDAO teacherDAO = TeacherDAO.getTeacherDAOInstance();
                        if (teacherDAO.changeProjectProgress(studentID, "已辅导，并通过，已评分")) {
                            PrintWriter out = response.getWriter();
                            out.print("<script language='javascript'>alert('评审完毕！')</script>");
                            response.setHeader("refresh", "1;URL=AdjuHasLoginTest.jsp");
                        } else {
                            PrintWriter out = response.getWriter();
                            out.print("<script language='javascript'>alert('更新状态失败！')</script>");
                            response.setHeader("refresh", "1;URL=AdjuHasLoginTest.jsp");
                        }
                    } else {
                        PrintWriter out = response.getWriter();
                        out.print("<script language='javascript'>alert('评审完毕！')</script>");
                        response.setHeader("refresh", "1;URL=AdjuHasLoginTest.jsp");
                    }
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script language='javascript'>alert('更新总分失败！')</script>");
                    response.setHeader("refresh", "1;URL=AdjuHasLoginTest.jsp");
                }

            } else {
                PrintWriter out = response.getWriter();
                out.print("<script language='javascript'>alert('更新judge失败！')</script>");
                response.setHeader("refresh", "1;URL=AdjuHasLoginTest.jsp");
            }

        }
    }

}
