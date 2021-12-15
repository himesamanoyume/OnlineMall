package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Misc extends BaseEntity<Misc> {
    @TableId(type = IdType.AUTO)
    private Integer miscId;
    private String text;
}
