package DroidEye.DAO;


import DroidEye.DAO.DAOInterface.AdminDAOInterface;
import DroidEye.JavaBean.AdjuBean;
import DroidEye.JavaBean.AdminBean;
import DroidEye.JavaBean.TeacherBean;

import java.sql.*;

/**
 * Created by DroidEye on 2017/6/9.
 */
public class AdminDAO implements AdminDAOInterface {


    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/apply_project?autoReconnect=true&useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "admin";

    private static AdminDAO adminDAO = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private AdminDAO() throws ClassNotFoundException {
        Class.forName(DBDRIVER);
    }


    public static AdminDAO getAdminDAOInstance() {
        if (adminDAO == null) {
            try {
                adminDAO = new AdminDAO();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return adminDAO;
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
    public boolean createAdminAccount(AdminBean adminBean) {
        if (prepareMySql("INSERT INTO administrator VALUES(?,?,?)")) {
            try {
                pstmt.setString(1, adminBean.getAdminID());
                pstmt.setString(2, adminBean.getAdminPassword());
                pstmt.setString(3, adminBean.getAdminName());
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
    public AdminBean queryAdminAccount(String adminID) {
        AdminBean admin = null;
        if (prepareMySql("SELECT * FROM administrator WHERE admin_id=\'" + adminID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    admin = new AdminBean();
                    admin.setAdminID(rs.getString("admin_id"));
                    admin.setAdminPassword(rs.getString("admin_password"));
                    admin.setAdminName(rs.getString("admin_name"));
                }
            } catch (SQLException e) {
                return admin;
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                closeMySql();
            }
        }

        return admin;
    }

    @Override
    public boolean createStudentAccount(String studentID, String studentName) {
        return createPeopleAccount(studentID, studentName, "student");
    }

    @Override
    public boolean isHaveStudent(String studentID) {

        return isHavePeople(studentID,"student");

    }

    @Override
    public int studentNumber() {
        return getPeopleNumber("student");
    }


    @Override
    public boolean createTeacherAccount(String teacherID, String teacherName) {
        return createPeopleAccount(teacherID, teacherName, "teacher");
    }

    @Override
    public boolean isHaveTeacher(String teacherID) {


        return isHavePeople(teacherID, "teacher");
    }


    @Override
    public int teacherNumber() {
        return  getPeopleNumber("teacher");
    }


    @Override
    public boolean createAdjuAccount(String adjuID, String adjuName) {
        return createPeopleAccount(adjuID,adjuName,"adjudicator");
    }

    @Override
    public boolean isHaveAdju(String adjuID) {
        return isHavePeople(adjuID,"adjudicator");
    }

    @Override
    public int adjuNumber() {
        return getPeopleNumber("adjudicator");
    }

//    @Override
//    public boolean queryAdjuAccount() {
//        return false;
//    }
//
//    @Override
//    public boolean queryProject(int categoryNumber) {
//        return false;
//    }

    private boolean createPeopleAccount(String ID, String name, String people) {
        if (prepareMySql("INSERT INTO " + people + "(" + people + "_id," + people + "_name) VALUES(?,?)")) {
            try {
                pstmt.setString(1, ID);
                pstmt.setString(2, name);
                pstmt.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            } finally {
                closeMySql();
            }
        }
        return false;
    }

    private boolean isHavePeople(String ID, String people) {
        boolean statment = false;
        if (prepareMySql("SELECT * FROM " + people + " WHERE " + people + "_id=\'" + ID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    statment = true;
                } else {
                    statment = false;
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
        return statment;
    }


    private int getPeopleNumber(String people) {
        int number = 0;
        if (prepareMySql("select count(*) as peopleNumber from " + people)) {
            try {
                rs = pstmt.executeQuery();
                if (rs.next()) {

                    number = rs.getInt("peopleNumber");
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
        return number;
    }


}
