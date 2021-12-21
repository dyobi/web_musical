package jsp.dao;

import jsp.util.DBConnection;
import jsp.vo.UserVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private Connection          con;
    private PreparedStatement   pst = null;
    private ResultSet           res = null;
    private String              sql = null;

    public UserDao() throws SQLException, ClassNotFoundException {
        con = new DBConnection().getConnection();
    }

    // CHECK EMAIL BEFORE JOINING ----------------------
    public boolean checkEmail(String email) {
        sql = "SELECT mem_id FROM members WHERE mem_email = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, email);
            res = pst.executeQuery();

            return res.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

    // JOIN ---------------------------------------------
    public boolean insertUser(UserVo user) {
        sql = "INSERT INTO members(mem_email, mem_name, mem_pwd, mem_tel) VALUES (?, ?, ?, ?)";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, user.getEmail());
            pst.setString(2, user.getName());
            pst.setString(3, user.getPwd());
            pst.setString(4, user.getTel());
            pst.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

    // LOG IN -------------------------------------------
    public UserVo selectUser(String email, String pwd) {
        sql = "SELECT mem_id, mem_email, mem_name, mem_tel FROM members WHERE mem_email = ? AND mem_pwd = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, pwd);
            res = pst.executeQuery();

            return res.next() ?
                    new UserVo(res.getInt("mem_id"),
                            res.getString("mem_email"),
                            res.getString("mem_name"),
                            null,
                            res.getString("mem_tel"))
                    :
                    null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    };

    // UPDATE PWD ---------------------------------------
    public boolean updatePwd(int id, String pwd) {
        sql = "UPDATE members SET mem_pwd = ? WHERE mem_id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, pwd);
            pst.setInt(2, id);
            pst.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

    // UPDATE INFO --------------------------------------
    public boolean updateInfo(UserVo user) {
        sql = "UPDATE members SET mem_name = ?, mem_tel = ? WHERE mem_id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, user.getName());
            pst.setString(2, user.getTel());
            pst.setInt(3, user.getId());
            pst.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

}
