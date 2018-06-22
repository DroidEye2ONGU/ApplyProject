package DroidEye.DAO.DAOInterface;

import DroidEye.JavaBean.ProjectBean;
import DroidEye.JavaBean.StudentBean;
import DroidEye.JavaBean.ApplyBean;

import java.util.List;

/**
 * Created by DroidEye on 2017/6/10.
 */
public interface StudentDAOInterface {

    public StudentBean queryStudentAccount(String studentID);

    public boolean changeStudentPassword(String studentID, String newStudentPassword);

    public List<ProjectBean> queryAllProject();

    public List<ApplyBean> queryAllSelectedProject();

    public StudentBean querySingleStudent(String studentID);

    public boolean updateStudent(StudentBean studentBean, String studentID);

    public ApplyBean querySelectedProjectApplyInfo(String studentID);

    public ProjectBean querySelectedProject(String projectID);


    public boolean addSelectedProject(ApplyBean applyBean);

    public boolean setSelectedProjectPass(String studentID);

    public boolean setSelectedProjectAdjuNumber(String studentID, String adjuNumber);

    public String getSelectedProjectAdjuNumber(String studentID);
}
