package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;


import java.math.BigDecimal;
import java.util.List;

@Data
public class User extends BaseEntity<User>{

    @TableId(type = IdType.AUTO)
    private Integer userId;
    private String account;
    private String password;
    private String name;
    private Integer type;
    private BigDecimal balance;
    private String address;
}
