package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


import java.util.Date;


public class BaseEntity<T> {
    @TableLogic
    private Integer deleted;

    private Integer create_user_id;

    @TableField(exist = false)
    private User create_user;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date create_time;

    private Integer update_user_id;
    @TableField(exist = false)
    private User update_user;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date update_time;

    @JsonIgnore
    @TableField(exist = false)
    private Page<T> page;

    @Override
    public String toString() {
        return "BaseEntity{" +
                "deleted=" + deleted +
                ", create_user_id=" + create_user_id +
                ", create_user=" + create_user +
                ", create_time=" + create_time +
                ", update_user_id=" + update_user_id +
                ", update_user=" + update_user +
                ", update_time=" + update_time +
                ", page=" + page +
                '}';
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Integer getCreate_user_id() {
        return create_user_id;
    }

    public void setCreate_user_id(Integer create_user_id) {
        this.create_user_id = create_user_id;
    }

    public User getCreate_user() {
        return create_user;
    }

    public void setCreate_user(User create_user) {
        this.create_user = create_user;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getUpdate_user_id() {
        return update_user_id;
    }

    public void setUpdate_user_id(Integer update_user_id) {
        this.update_user_id = update_user_id;
    }

    public User getUpdate_user() {
        return update_user;
    }

    public void setUpdate_user(User update_user) {
        this.update_user = update_user;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public Page<T> getPage() {
        return page;
    }

    public void setPage(Page<T> page) {
        this.page = page;
    }
}
