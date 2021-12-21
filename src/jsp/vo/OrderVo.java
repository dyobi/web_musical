package jsp.vo;

public class OrderVo {

    private int     buy_id;
    private int     mem_id;
    private String  name;
    private int     seat_num;
    private String  p_date;
    private String  buy_date;

    // CONSTRUCTORS ----------------------------------------------------------
    public OrderVo() {};
    public OrderVo(int buy_id, int mem_id, String name, int seat_num, String p_date, String buy_date) {
        this.buy_id = buy_id;
        this.mem_id = mem_id;
        this.name = name;
        this.seat_num = seat_num;
        this.p_date = p_date;
        this.buy_date = buy_date;
    };

    // GETTERS & SETTERS -----------------------------------------------------

    public String getName() {
        return name;
    };
    public void setName(String name) {
        this.name = name;
    };
    public int getMem_id() {
        return this.mem_id;
    };
    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    };
    public int getSeat_num() {
        return seat_num;
    };
    public void setSeat_num(int seat_num) {
        this.seat_num = seat_num;
    };
    public String getP_date() {
        return p_date;
    };
    public void setP_date(String p_date) {
        this.p_date = p_date;
    };
    public String getBuy_date() {
        return buy_date;
    };
    public void setBuy_date(String buy_date) {
        this.buy_date = buy_date;
    };
    public int getBuy_id() {
        return buy_id;
    };
    public void setBuy_id(int buy_id) {
        this.buy_id = buy_id;
    };

}