package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Post extends BaseEntity<Post>{
    @TableId(type = IdType.AUTO)
    private Integer postId;
    private String title;
    private String article;
    private String introduction;
    private String publishTime;
    private Integer typeId;
    private Integer status;
}
