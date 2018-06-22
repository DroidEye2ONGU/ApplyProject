package DroidEye.DAO.DAOInterface;

import DroidEye.JavaBean.AdjuBean;
import DroidEye.JavaBean.AdminBean;
import DroidEye.JavaBean.StudentBean;
import DroidEye.JavaBean.TeacherBean;

/**
 * Created by DroidEye on 2017/6/9.
 */
public interface AdminDAOInterface {

    public boolean createAdminAccount(AdminBean adminBean);
    public AdminBean queryAdminAccount(String adminID);

    public boolean createStudentAccount(String studentID, String studentName);
    public boolean isHaveStudent(String studentID);
    public int studentNumber();


    public boolean createTeacherAccount(String teacherID, String teacherName);
    public boolean isHaveTeacher(String teacherID);
    public int teacherNumber();


    public boolean createAdjuAccount(String adjuID, String adjuName);
    public boolean isHaveAdju(String adjuID);
    public int adjuNumber();
    //public boolean queryAdjuAccount();

    //public boolean queryProject(int categoryNumber);

}
