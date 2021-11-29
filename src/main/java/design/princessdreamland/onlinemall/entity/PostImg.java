package design.princessdreamland.onlinemall.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class PostImg extends BaseEntity<PostImg>{

    @TableId(type = IdType.AUTO)
    private Integer postImgId;
    //关键字
    private String keyword;
    private String name;
}
