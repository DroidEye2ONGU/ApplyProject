package DroidEye.DAO.DAOInterface;

import DroidEye.JavaBean.JudgeBean;

import java.util.List;

/**
 * Created by DroidEye on 2017/6/11.
 */
public interface JudgeDAOInterface {

    public boolean setAdju(JudgeBean judgeBean);

    public boolean isRepetitive(String adjuID, String studentID, String project_id);

    public List<JudgeBean> queryAllNonAdju(String adjuID);

    public boolean addScore(String studentID, String projectID, String adjuID, String score, int hasScoredAdjuNumber);

    public boolean updateTotalScore(String studentID, String totalScore);

}
