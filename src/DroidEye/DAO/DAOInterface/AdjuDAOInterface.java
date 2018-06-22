package DroidEye.DAO.DAOInterface;

import DroidEye.JavaBean.AdjuBean;
import DroidEye.JavaBean.JudgeBean;

import java.util.List;

/**
 * Created by DroidEye on 2017/6/11.
 */
public interface AdjuDAOInterface {

    public AdjuBean queryAdjuAccount(String adjuID);

    public boolean changeAdjuPassword(String adjuID, String newAdjuPassword);

    public List<AdjuBean> queryAllAdju();

    public List<JudgeBean> queryAllNeededAdjuProject(String adjuID);

}
