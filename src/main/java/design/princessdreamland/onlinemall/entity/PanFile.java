package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class PanFile extends BaseEntity<PanFile>{
    @TableId(type = IdType.AUTO)
    private Integer panFileId;
    private String fileName;
    private String introduction;
    private Integer status;
}
