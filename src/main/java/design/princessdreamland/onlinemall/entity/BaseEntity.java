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

    private Integer createUserId;

    @TableField(exist = false)
    private Permi createUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    private Integer updateUserId;
    @TableField(exist = false)
    private Permi updateUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    @JsonIgnore
    @TableField(exist = false)
    private Page<T> page;
}
