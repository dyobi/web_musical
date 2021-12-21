package jsp.dao;

import jsp.util.DBConnection;
import jsp.vo.OrderVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class OrderDao {

    private Connection          con;
    private PreparedStatement   pst = null;
    private ResultSet           res = null;
    private String              sql = null;

    public OrderDao() throws SQLException, ClassNotFoundException {
        con = new DBConnection().getConnection();
    };

    // GET AVAILABLE TICKETS ---------------------------
    public int[] getAvailTickets() {
        sql = "SELECT a.p_date AS p_date, NVL(b.cnt, 0) AS cnt FROM " +
                "(SELECT * FROM (SELECT TO_CHAR(TO_DATE(?, 'YYYY-MM-DD') + LEVEL - 1, 'YYYY-MM-DD') AS p_date " +
                "FROM DUAL CONNECT BY LEVEL <= TO_DATE(?, 'YYYY-MM-DD') - TO_DATE(?, 'YYYY-MM-DD') + 1)) a, " +
                "(SELECT TO_CHAR(p_date, 'YYYY-MM-DD') AS o_date, COUNT(*) AS cnt FROM orders " +
                "GROUP BY TO_CHAR(p_date, 'YYYY-MM-DD') HAVING TO_CHAR(p_date, 'YYYY-MM-DD') BETWEEN ? AND ?) b " +
                "WHERE a.p_date = b.o_date(+) ORDER BY 1 DESC";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);

        String today = sdf.format(cal.getTime());
        cal.add(Calendar.DATE, 6);
        String afterWeek = sdf.format(cal.getTime());

        try {
            int[] avails = new int[7];
            pst = con.prepareStatement(sql);
            pst.setString(1, today);
            pst.setString(2, afterWeek);
            pst.setString(3, today);
            pst.setString(4, today);
            pst.setString(5, afterWeek);

            res = pst.executeQuery();
            int i = 0;
            while (res.next()) {
                avails[i] = res.getInt("cnt");
                i++;
            }
            return avails;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    };

    // GET AVAILABLE SEATS -----------------------------
    public ArrayList<Integer> getAvailSeats(String p_date) {
        sql = "SELECT seat_num FROM orders WHERE TO_CHAR(p_date, 'yyyyMMdd') = ? ORDER BY 1 ASC";

        try {
            ArrayList<Integer> list = new ArrayList<>();
            pst = con.prepareStatement(sql);
            pst.setString(1, p_date);

            res = pst.executeQuery();
            while (res.next()) {
                list.add(res.getInt("seat_num"));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    };


    // INSERT AN ORDER ---------------------------------
    public boolean insertOrder(OrderVo orderVo) {
        sql = "INSERT INTO orders(mem_id, name, seat_num, p_date) VALUES (?, ?, ?, TO_DATE(?, 'yyyyMMdd'))";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, orderVo.getMem_id());
            pst.setString(2, orderVo.getName());
            pst.setInt(3, orderVo.getSeat_num());
            pst.setString(4, orderVo.getP_date());
            pst.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    };

    // GET MY ORDER ------------------------------------
    public ArrayList<OrderVo> getMyOrder(int id) {
        sql = "SELECT * FROM orders WHERE mem_id = ?";

        try {
            ArrayList<OrderVo> list = new ArrayList<>();
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            res = pst.executeQuery();

            while (res.next()) {
                int buy_id = res.getInt("buy_id");
                int mem_id = res.getInt("mem_id");
                String name = res.getString("name");
                int seat_num = res.getInt("seat_num");
                String p_date = res.getDate("p_date").toString();
                String b_date = res.getDate("buy_date").toString();

                OrderVo tmp = new OrderVo(buy_id, mem_id, name, seat_num, p_date, b_date);
                list.add(tmp);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
