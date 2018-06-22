package DroidEye.JavaBean;

/**
 * Created by DroidEye on 2017/6/11.
 */
public class JudgeBean {
    private String studentID;
    private String projectID;
    private String adjuID;
    private String projectScore;

    public JudgeBean() {
    }

    public JudgeBean(String studentID, String projectID, String adjuID) {
        this.studentID = studentID;
        this.projectID = projectID;
        this.adjuID = adjuID;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    public String getAdjuID() {
        return adjuID;
    }

    public void setAdjuID(String adjuID) {
        this.adjuID = adjuID;
    }

    public String getProjectScore() {
        return projectScore;
    }

    public void setProjectScore(String projectScore) {
        this.projectScore = projectScore;
    }
}
