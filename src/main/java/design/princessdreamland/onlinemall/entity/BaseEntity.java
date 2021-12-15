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

    @JsonIgnore
    @TableField(exist = false)
    private Page<T> page;
}
