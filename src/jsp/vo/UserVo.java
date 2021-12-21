package jsp.vo;

public class UserVo {

    private int     id;
    private String  email;
    private String  name;
    private String  pwd;
    private String  tel;

    // CONSTRUCTORS ----------------------------------------------------------
    public UserVo() {};
    public UserVo(int id, String email, String name, String pwd, String tel) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.pwd = pwd;
        this.tel = tel;
    };

    // GETTERS & SETTERS -----------------------------------------------------
    public int getId() {
        return id;
    };
    public void setId(int id) {
        this.id = id;
    };
    public String getEmail() {
        return email;
    };
    public void setEmail(String email) {
        this.email = email;
    };
    public String getName() {
        return name;
    };
    public void setName(String name) {
        this.name = name;
    };
    public String getPwd() {
        return pwd;
    };
    public void setPwd(String pwd) {
        this.pwd = pwd;
    };
    public String getTel() {
        return tel;
    };
    public void setTel(String tel) {
        this.tel = tel;
    };

}
