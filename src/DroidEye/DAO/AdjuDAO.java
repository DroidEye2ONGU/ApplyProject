package DroidEye.DAO;

import DroidEye.DAO.DAOInterface.AdjuDAOInterface;
import DroidEye.JavaBean.AdjuBean;
import DroidEye.JavaBean.JudgeBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DroidEye on 2017/6/11.
 */
public class AdjuDAO implements AdjuDAOInterface{

    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/apply_project?autoReconnect=true&useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "admin";

    private static AdjuDAO adjuDAO = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private AdjuDAO() throws ClassNotFoundException {
        Class.forName(DBDRIVER);
    }


    public static AdjuDAO getAdjuDAOInstance() {
        if (adjuDAO == null) {
            try {
                adjuDAO = new AdjuDAO();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return adjuDAO;
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
    public AdjuBean queryAdjuAccount(String adjuID) {
        AdjuBean adjuBean = null;
        if (prepareMySql("SELECT * FROM adjudicator WHERE adjudicator_id=\'" + adjuID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    adjuBean = new AdjuBean();
                    adjuBean.setAdjuID(rs.getString("adjudicator_id"));
                    adjuBean.setAdjuPassword(rs.getString("adjudicator_password"));
                    adjuBean.setAdjuName(rs.getString("adjudicator_name"));
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
        return adjuBean;
    }

    @Override
    public List<AdjuBean> queryAllAdju() {
        List<AdjuBean> adjuList = new ArrayList<AdjuBean>();
        if (prepareMySql("SELECT * FROM adjudicator")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    AdjuBean adjuBean = new AdjuBean();
                    adjuBean.setAdjuID(rs.getString("adjudicator_id"));
                    adjuBean.setAdjuName(rs.getString("adjudicator_name"));
                    adjuList.add(adjuBean);
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
        return adjuList;
    }

    @Override
    public boolean changeAdjuPassword(String adjuID, String newAdjuPassword) {
        if (prepareMySql("UPDATE adjudicator SET adjudicator_password=\'" + newAdjuPassword + "\' WHERE adjudicator_id=\'" + adjuID + "\'")) {
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
    public List<JudgeBean> queryAllNeededAdjuProject(String adjuID) {
        List<JudgeBean> judgeList = new ArrayList<>();
        if (prepareMySql("SELECT * FROM judge WHERE adju_id=\'" + adjuID + "\'")) {
            try {
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    JudgeBean judgeBean = new JudgeBean();
                    judgeBean.setAdjuID(rs.getString("adju_id"));
                    judgeBean.setStudentID(rs.getString("student_id"));
                    judgeBean.setProjectID(rs.getString("project_id"));
                    judgeBean.setProjectScore(rs.getString("project_score"));
                    judgeList.add(judgeBean);
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
        return judgeList;
    }
}
