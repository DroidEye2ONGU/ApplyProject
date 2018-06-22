package DroidEye.DAO;

import DroidEye.DAO.DAOInterface.JudgeDAOInterface;
import DroidEye.JavaBean.AdjuBean;
import DroidEye.JavaBean.JudgeBean;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DroidEye on 2017/6/11.
 */
public class JudgeDAO implements JudgeDAOInterface {


    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/apply_project?autoReconnect=true&useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "admin";

    private static JudgeDAO judgeDAO = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private JudgeDAO() throws ClassNotFoundException {
        Class.forName(DBDRIVER);
    }


    public static JudgeDAO getJudgeDAOInstance() {
        if (judgeDAO == null) {
            try {
                judgeDAO = new JudgeDAO();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return judgeDAO;
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
    public boolean setAdju(JudgeBean judgeBean) {

        if (prepareMySql("INSERT INTO judge(student_id," +
                "project_id,adju_id) VALUES(?,?,?)")) {
            try {
                pstmt.setString(1, judgeBean.getStudentID());
                pstmt.setString(2, judgeBean.getProjectID());
                pstmt.setString(3, judgeBean.getAdjuID());

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
    public boolean isRepetitive(String adjuID, String studentID, String project_id) {
        int number = 0;
        if (prepareMySql("SELECT COUNT(*) AS peopleNumber FROM judge WHERE adju_id=\'" + adjuID + "\' and" +
                " student_id=\'" + studentID + "\' and" + " project_id=\'" + project_id + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    number = Integer.parseInt(rs.getString("peopleNumber"));
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

        return number == 1 ? true : false;
    }

    @Override
    public List<JudgeBean> queryAllNonAdju(String adjuID) {
        List<JudgeBean> unJudgeList = new ArrayList<JudgeBean>();
        if (prepareMySql("SELECT * FROM judge WHERE is_judged=\'未评分\' and adju_id=\'" + adjuID + "\'" )) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    JudgeBean judgeBean = new JudgeBean();
                    judgeBean.setStudentID(rs.getString("student_id"));
                    judgeBean.setProjectID(rs.getString("project_id"));
                    judgeBean.setAdjuID(rs.getString("adju_id"));
                    unJudgeList.add(judgeBean);
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
        return unJudgeList;
    }


    @Override
    public boolean addScore(String studentID, String projectID, String adjuID, String newScore,int hasScoredAdjuNumber) {
        if (prepareMySql("UPDATE judge SET project_score=\'" + newScore + "\' WHERE " +
                "student_id=\'" + studentID + "\' and project_id=\'" + projectID +
                "\' and adju_id=\'" + adjuID + "\'")) {
            try {
                pstmt.executeUpdate();
                hasScoredAdjuNumber++;

                String sql = "UPDATE apply SET has_scored_adju_number=\'" +
                        hasScoredAdjuNumber + "\' WHERE student_id=\'" +
                        studentID + "\'";
                pstmt = conn.prepareStatement(sql);
                pstmt.executeUpdate();

                sql = "UPDATE judge SET is_judged=\'已评分\' WHERE " +
                        "student_id=\'" + studentID + "\' and project_id=\'" + projectID +
                        "\' and adju_id=\'" + adjuID + "\'";
                pstmt = conn.prepareStatement(sql);
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
    public boolean updateTotalScore(String studentID, String totalScore) {
        if (prepareMySql("UPDATE apply SET project_total_score=\'" +
                totalScore + "\' WHERE student_id=\'" + studentID + "\'")) {
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
}
