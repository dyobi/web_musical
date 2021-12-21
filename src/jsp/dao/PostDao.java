package jsp.dao;

import jsp.util.DBConnection;
import jsp.vo.PostVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDao {

    private Connection          con;
    private PreparedStatement   pst = null;
    private ResultSet           res = null;
    private String              sql = null;

    public PostDao() throws SQLException, ClassNotFoundException {
        con = new DBConnection().getConnection();
    };

    // GET ALL REVIEWS ---------------------------------
    public ArrayList<PostVo> getAllReviews() {
        sql = "SELECT * FROM posts ORDER BY posts_id ASC";

        try {
            pst = con.prepareStatement(sql);
            res = pst.executeQuery();

            ArrayList<PostVo> list = new ArrayList<>();
            while (res.next()) {
                int p_id = res.getInt("posts_id");
                int m_id = res.getInt("mem_id");
                String author = res.getString("author");
                String review = res.getString("review");
                String date = res.getDate("review_date").toString().substring(2);
                int views = res.getInt("views");

                PostVo tmp = new PostVo(p_id, m_id, author, review, date, views);
                list.add(tmp);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    };

    // INSERT A REVIEW ---------------------------------
    public boolean insertReview(PostVo postVo) {
        sql = "INSERT INTO posts(mem_id, author, review) VALUES (?, ?, ?)";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, postVo.getMem_id());
            pst.setString(2, postVo.getMem_name());
            pst.setString(3, postVo.getReview());

            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

    // GET A REVIEW ------------------------------------
    public PostVo selectReview(int id) {
        sql = "SELECT * FROM posts WHERE posts_id = ?";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);

            res = pst.executeQuery();
            PostVo postVo = null;
            while (res.next()) {
                int p_id = res.getInt("posts_id");
                int m_id = res.getInt("mem_id");
                String author = res.getString("author");
                String review = res.getString("review");
                String date = res.getDate("review_date").toString().substring(2);
                int views = res.getInt("views");

                postVo = new PostVo(p_id, m_id, author, review, date, views);
            }
            return postVo;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    };

    // INCREASING VIEWS --------------------------------
    public boolean increasingViews(int id) {
        sql = "UPDATE posts SET views = views + 1 WHERE posts_id = ?";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);

            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

    // DELETE REVIEW -----------------------------------
    public boolean deleteReview(int p_id) {
        sql = "DELETE FROM posts WHERE posts_id = ?";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, p_id);

            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

}
