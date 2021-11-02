package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;


import java.util.Date;

@Data
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
}
