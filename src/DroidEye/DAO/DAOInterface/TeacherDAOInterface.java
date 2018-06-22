package DroidEye.DAO.DAOInterface;

import DroidEye.JavaBean.ApplyBean;
import DroidEye.JavaBean.ProjectBean;
import DroidEye.JavaBean.TeacherBean;

import java.util.List;

/**
 * Created by DroidEye on 2017/6/10.
 */
public interface TeacherDAOInterface {


    public TeacherBean queryTeacherAccount(String teacherID);

    public boolean changeTeacherPassword(String teacherID, String newTeacherPassword);

    public int projectNumber();

    public boolean addProject(ProjectBean projectBean);

    public List<ProjectBean> searchProjectGroupbyTeacher(String teacherID);

 //   public List<ApplyBean> queryProjectGroupByProjectID(String projectID);

    public List<ApplyBean> queryProjectGroupByTeacherID(String teacherID);

    public boolean addProjectTeach(String studentID, String projectTeach);

    public boolean changeProjectProgress(String studentID, String status);

}
