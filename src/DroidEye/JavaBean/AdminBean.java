package DroidEye.JavaBean;

/**
 * Created by DroidEye on 2017/6/9.
 */
public class AdminBean {

    private String adminID;
    private String adminPassword;
    private String adminName;

    public AdminBean() {

    }

    public AdminBean(String adminID, String adminPassword, String adminName) {
        this.adminID = adminID;
        this.adminPassword = adminPassword;
        this.adminName = adminName;
    }

    public String getAdminID() {
        return adminID;
    }

    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }
}
