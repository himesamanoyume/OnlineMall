package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Permi extends BaseEntity<Permi>{
    @TableId(type = IdType.AUTO)
    private Integer permiId;
    private Integer type;
    private String password;
}
