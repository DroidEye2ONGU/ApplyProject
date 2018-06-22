package DroidEye.DAO;


import DroidEye.DAO.DAOInterface.StudentDAOInterface;
import DroidEye.JavaBean.ProjectBean;
import DroidEye.JavaBean.StudentBean;
import DroidEye.JavaBean.ApplyBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DroidEye on 2017/6/4.
 */
public class StudentDAO implements StudentDAOInterface {


    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/apply_project?autoReconnect=true&useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "admin";

    private static StudentDAO studentDAO = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private StudentDAO() throws ClassNotFoundException {
        Class.forName(DBDRIVER);
    }


    public static StudentDAO getStudentDAOInstance() {
        if (studentDAO == null) {
            try {
                studentDAO = new StudentDAO();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return studentDAO;
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
    public StudentBean queryStudentAccount(String studentID) {
        StudentBean studentBean = null;
        if (prepareMySql("SELECT * FROM student WHERE student_id=\'" + studentID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    studentBean = new StudentBean();
                    studentBean.setStudentID(rs.getString("student_id"));
                    studentBean.setStudentPassword(rs.getString("student_password"));
                    studentBean.setStudentName(rs.getString("student_name"));
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
        return studentBean;
    }

    @Override
    public boolean changeStudentPassword(String studentID, String newStudentPassword) {

        if (prepareMySql("UPDATE student SET student_password=\'" + newStudentPassword + "\' WHERE student_id=\'" + studentID +"\'")) {
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
    public List<ProjectBean> queryAllProject() {
        List<ProjectBean> projectBeanList = new ArrayList<ProjectBean>();
        if (prepareMySql("select * from project")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    ProjectBean project = new ProjectBean();
                    project.setProjectID(rs.getString("project_id"));
                    project.setProjectName(rs.getString("project_name"));
                    project.setProjectInfo(rs.getString("project_info"));
                    project.setTeacherID(rs.getString("teacher_id"));
                    projectBeanList.add(project);
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

        return projectBeanList;
    }

    @Override
    public List<ApplyBean> queryAllSelectedProject() {
        List<ApplyBean> applyList = new ArrayList<ApplyBean>();
        if (prepareMySql("SELECT * FROM apply")) {
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
                    applyList.add(applyBean);
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
        return applyList;
    }

    @Override
    public StudentBean querySingleStudent(String studentID) {
        StudentBean studentBean = null;
        if (prepareMySql("SELECT * FROM student WHERE student_id=\'" + studentID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    studentBean = new StudentBean();
                    studentBean.setStudentID(rs.getString("student_id"));
                    studentBean.setStudentPassword(rs.getString("student_password"));
                    studentBean.setStudentName(rs.getString("student_name"));
                    studentBean.setStudentSex(rs.getString("student_sex"));
                    studentBean.setStudentClass(rs.getString("student_class"));
                    studentBean.setStudentPhoneNumber(rs.getString("student_phonenumber"));

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
        return studentBean;
    }

    @Override
    public boolean updateStudent(StudentBean studentBean, String studentID) {

        String studentSex = studentBean.getStudentSex();
        String studentClass = studentBean.getStudentClass();
        String studentPhoneNumber = studentBean.getStudentPhoneNumber();


        if (prepareMySql("UPDATE student SET student_sex=\'" + studentSex +
                "\', student_class=\'" + studentClass +
                "\', student_phonenumber=\'" +
                studentPhoneNumber +
                "\' WHERE student_id=\'" +
                studentID + "\'")) {
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
    public ApplyBean querySelectedProjectApplyInfo(String studentID) {
        ApplyBean applyBean = null;
        if (prepareMySql("SELECT * FROM apply WHERE student_id=\'" + studentID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    applyBean = new ApplyBean();
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
                    applyBean.setHasScoredAdjuNumber(rs.getString("has_scored_adju_number"));
                    applyBean.setProjectTotalScore(rs.getString("project_total_score"));
                    applyBean.setAdjuNumber(rs.getString("adju_number"));
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
        return applyBean;
    }

    @Override
    public ProjectBean querySelectedProject(String projectID) {
        ProjectBean projectBean = null;
        if (prepareMySql("SELECT * FROM project WHERE project_id=\'" + projectID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    projectBean = new ProjectBean();
                    projectBean.setProjectID(rs.getString("project_id"));
                    projectBean.setProjectName(rs.getString("project_name"));
                    projectBean.setProjectInfo(rs.getString("project_info"));
                    projectBean.setTeacherID(rs.getString("teacher_id"));
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
        return projectBean;
    }

    @Override
    public boolean addSelectedProject(ApplyBean applyBean) {
        if (prepareMySql("INSERT INTO apply(student_id,project_id,teacher_id," +
                "student_name,project_name,teacher_name,project_content) VALUES(?,?,?,?,?,?,?)")) {
            try {
                pstmt.setString(1, applyBean.getStudentID());
                pstmt.setString(2, applyBean.getProjectID());
                pstmt.setString(3, applyBean.getTeacherID());
                pstmt.setString(4, applyBean.getStudentName());
                pstmt.setString(5, applyBean.getProjectName());
                pstmt.setString(6, applyBean.getTeacherName());
                pstmt.setString(7, applyBean.getProjectContent());
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
    public boolean setSelectedProjectPass(String studentID) {
        if (prepareMySql("UPDATE apply SET pass_status='通过' WHERE student_id=\'" + studentID + "\'")) {
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
    public boolean setSelectedProjectAdjuNumber(String studentID, String adjuNumber) {
        int adjudicatorNumber = Integer.parseInt(adjuNumber);
        //adjudicatorNumber ++;
        if (prepareMySql("UPDATE apply SET adju_number=\'" + Integer.toString(adjudicatorNumber) + "\' WHERE student_id" +
                "=\'" + studentID + "\'")) {
            try {
                pstmt.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                closeMySql();
            }
        }

        return false;
    }

    @Override
    public String getSelectedProjectAdjuNumber(String studentID) {
        String adjuNumber = null;
        if (prepareMySql("SELECT adju_number from apply WHERE student_id=\'" + studentID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    adjuNumber = rs.getString("adju_number");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                closeMySql();
            }
        }
        return adjuNumber;
    }
}
