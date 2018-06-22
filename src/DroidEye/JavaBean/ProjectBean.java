package DroidEye.JavaBean;

/**
 * Created by DroidEye on 2017/6/9.
 */
public class ProjectBean {

    private String projectID;
    private String projectName;
    private String projectInfo;
    private String teacherID;

    public ProjectBean() {
    }

    public ProjectBean(String projectID, String projectName, String projectInfo, String teacherID) {
        this.projectID = projectID;
        this.projectName = projectName;
        this.projectInfo = projectInfo;
        this.teacherID = teacherID;
    }

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(String projectInfo) {
        this.projectInfo = projectInfo;
    }

    public String getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(String teacherID) {
        this.teacherID = teacherID;
    }
}
