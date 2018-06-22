package DroidEye.DAO;

import DroidEye.DAO.DAOInterface.TeacherDAOInterface;
import DroidEye.JavaBean.ApplyBean;
import DroidEye.JavaBean.ProjectBean;
import DroidEye.JavaBean.TeacherBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DroidEye on 2017/6/10.
 */
public class TeacherDAO implements TeacherDAOInterface {

    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/apply_project?autoReconnect=true&useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "admin";

    private static TeacherDAO teacherDAO = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private TeacherDAO() throws ClassNotFoundException {
        Class.forName(DBDRIVER);
    }


    public static TeacherDAO getTeacherDAOInstance() {
        if (teacherDAO == null) {
            try {
                teacherDAO = new TeacherDAO();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return teacherDAO;
    }

    private boolean prepareMySql(String sql) {
        try {
            conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
            pstmt = conn.prepareStatement(sql);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void closeMySql() {
        if (conn != null) {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public TeacherBean queryTeacherAccount(String teacherID) {
        TeacherBean teacher = null;
        if (prepareMySql("SELECT * FROM teacher WHERE teacher_id=\'" + teacherID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    teacher = new TeacherBean();
                    teacher.setTeacherID(rs.getString("teacher_id"));
                    teacher.setTeacherPassword(rs.getString("teacher_password"));
                    teacher.setTeacherName(rs.getString("teacher_name"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                closeMySql();
            }
        }
        return teacher;
    }

    @Override
    public boolean changeTeacherPassword(String teacherID, String newTeacherPassword) {
        if (prepareMySql("UPDATE teacher SET teacher_password=\'" + newTeacherPassword + "\' WHERE teacher_id=\'" + teacherID + "\'")) {
            try {
                pstmt.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                closeMySql();
            }
        }
        return false;
    }

    @Override
    public int projectNumber() {
        int projectNumber = 0;
        if (prepareMySql("SELECT COUNT(*) AS ProjectNumber FROM project")) {
            try {
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    projectNumber = rs.getInt("ProjectNumber");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                closeMySql();
            }
        }
        return projectNumber;
    }

    @Override
    public boolean addProject(ProjectBean projectBean) {

        if (prepareMySql("INSERT INTO project VALUES(?,?,?,?)")) {
            try {
                pstmt.setString(1, projectBean.getProjectID());
                pstmt.setString(2, projectBean.getProjectName());
                pstmt.setString(3, projectBean.getProjectInfo());
                pstmt.setString(4, projectBean.getTeacherID());
                pstmt.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                closeMySql();
            }
        }
        return false;
    }

    @Override
    public List<ProjectBean> searchProjectGroupbyTeacher(String teacherID) {
        List<ProjectBean> projectList = new ArrayList<ProjectBean>();
        if (prepareMySql("SELECT * FROM project WHERE teacher_id=\'" + teacherID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    ProjectBean project = new ProjectBean();
                    project.setProjectID(rs.getString("project_id"));
                    project.setProjectName(rs.getString("project_name"));
                    project.setProjectInfo(rs.getString("project_info"));
                    project.setTeacherID(rs.getString("teacher_id"));
                    projectList.add(project);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                closeMySql();
            }

        }

        return projectList;

    }

//    @Override
//    public List<ApplyBean> queryProjectGroupByProjectID(String projectID) {
//        List<ApplyBean> projectList = new ArrayList<ApplyBean>();
//        if (prepareMySql("SELECT * FROM apply WHERE project_id=\'" + projectID + "\'")) {
//            try {
//                rs = pstmt.executeQuery();
//                while (rs.next()) {
//                    ApplyBean applyBean = new ApplyBean();
//                    applyBean.setStudentID(rs.getString("student_id"));
//                    applyBean.setProjectID(rs.getString("project_id"));
//                    applyBean.setTeacherID(rs.getString("teacher_id"));
//                    applyBean.setStudentName(rs.getString("student_name"));
//                    applyBean.setProjectName(rs.getString("project_name"));
//                    applyBean.setTeacherName(rs.getString("teacher_name"));
//                    applyBean.setProjectContent(rs.getString("project_content"));
//                    applyBean.setProjectProgress(rs.getString("project_progress"));
//                    applyBean.setProjectTeach(rs.getString("project_teach"));
//                    applyBean.setPassStatus(rs.getString("pass_status"));
//                    applyBean.setProjectTotalScore(rs.getString("project_total_score"));
//                    applyBean.setAdjuNumber(rs.getString("adju_number"));
//                    projectList.add(applyBean);
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            } finally {
//                try {
//                    rs.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//                closeMySql();
//            }
//        }
//        return projectList;
//    }
//
    @Override
    public List<ApplyBean> queryProjectGroupByTeacherID(String teacherID) {
        List<ApplyBean> projectList = new ArrayList<ApplyBean>();
        if (prepareMySql("SELECT * FROM apply WHERE teacher_id=\'" + teacherID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    ApplyBean applyBean = new ApplyBean();
                    applyBean.setStudentID(rs.getString("student_id"));
                    applyBean.setProjectID(rs.getString("project_id"));
                    applyBean.setTeacherID(rs.getString("teacher_id"));
                    applyBean.setStudentName(rs.getString("student_name"));
                    applyBean.setProjectName(rs.getString("project_name"));
                    applyBean.setTeacherName(rs.getString("teacher_name"));
                    applyBean.setProjectContent(rs.getString("project_content"));
                    applyBean.setProjectProgress(rs.getString("project_progress"));
                    applyBean.setProjectTeach(rs.getString("project_teach"));
                    applyBean.setPassStatus(rs.getString("pass_status"));
                    applyBean.setProjectTotalScore(rs.getString("project_total_score"));
                    applyBean.setAdjuNumber(rs.getString("adju_number"));
                    projectList.add(applyBean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                closeMySql();
            }
        }
        return projectList;
    }

    @Override
    public boolean addProjectTeach(String studentID,String projectTeach) {
        if (prepareMySql("UPDATE apply SET project_teach=\'" + projectTeach + "\' WHERE student_id=\'" + studentID + "\'")) {
            try {
                pstmt.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                closeMySql();
            }
        }
        return false;
    }

    @Override
    public boolean changeProjectProgress(String studentID, String status) {
        if (prepareMySql("UPDATE apply SET project_progress=\'" + status + "\' WHERE student_id=\'" + studentID + "\'")) {
            try {
                pstmt.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                closeMySql();
            }
        }
        return false;
    }
}





















