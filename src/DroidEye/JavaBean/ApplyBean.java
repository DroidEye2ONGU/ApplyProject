package DroidEye.JavaBean;

/**
 * Created by DroidEye on 2017/6/11.
 */
public class ApplyBean {
    private String studentID;
    private String projectID;
    private String teacherID;
    private String studentName;
    private String projectName;
    private String teacherName;
    private String projectContent;//申报内容
    private String projectProgress;//申报进度
    private String projectTeach;//指导内容
    private String passStatus; //通过状态
    private String projectTotalScore;
    private String hasScoredAdjuNumber;
    private String adjuNumber;


    public ApplyBean() {
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

    public String getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(String teacherID) {
        this.teacherID = teacherID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getProjectContent() {
        return projectContent;
    }

    public void setProjectContent(String projectContent) {
        this.projectContent = projectContent;
    }

    public String getProjectProgress() {
        return projectProgress;
    }

    public void setProjectProgress(String projectProgress) {
        this.projectProgress = projectProgress;
    }

    public String getProjectTeach() {
        return projectTeach;
    }

    public void setProjectTeach(String projectTeach) {
        this.projectTeach = projectTeach;
    }

    public String getPassStatus() {
        return passStatus;
    }

    public void setPassStatus(String passStatus) {
        this.passStatus = passStatus;
    }

    public String getProjectTotalScore() {
        return projectTotalScore;
    }

    public void setProjectTotalScore(String projectTotalScore) {
        this.projectTotalScore = projectTotalScore;
    }

    public String getAdjuNumber() {
        return adjuNumber;
    }

    public void setAdjuNumber(String adjuNumber) {
        this.adjuNumber = adjuNumber;
    }

    public String getHasScoredAdjuNumber() {
        return hasScoredAdjuNumber;
    }

    public void setHasScoredAdjuNumber(String hasScoredAdjuNumber) {
        this.hasScoredAdjuNumber = hasScoredAdjuNumber;
    }
}
