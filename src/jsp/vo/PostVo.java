package jsp.vo;

import java.util.Date;

public class PostVo {

    private int post_id;
    private int mem_id;
    private String mem_name;
    private String review;
    private String date;
    private int views;

    // CONSTRUCTORS ----------------------------------------------------------
    public PostVo() {
    };
    public PostVo(int post_id, int mem_id, String mem_name, String review, String date, int views) {
        this.post_id = post_id;
        this.mem_id = mem_id;
        this.mem_name = mem_name;
        this.review = review;
        this.date = date;
        this.views = views;
    };

    // GETTERS & SETTERS -----------------------------------------------------
    public int getPost_id() {
        return post_id;
    };
    public void setPost_id(int post_id) {
        this.post_id = post_id;
    };
    public int getMem_id() {
        return mem_id;
    };
    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    };
    public String getMem_name() {
        return mem_name;
    };
    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    };
    public String getReview() {
        return review;
    };
    public void setReview(String review) {
        this.review = review;
    };
    public String getDate() {
        return date;
    };
    public void setDate(String date) {
        this.date = date;
    };
    public int getViews() {
        return views;
    };
    public void setViews(int views) {
        this.views = views;
    };

}
