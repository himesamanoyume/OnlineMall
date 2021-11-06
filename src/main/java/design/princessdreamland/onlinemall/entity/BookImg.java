package design.princessdreamland.onlinemall.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;

@Data
public class BookImg {

    @TableId(type = IdType.AUTO)
    private Integer bookImgId;

    //商品ID
    private Integer bookId;

    //图片路径
    private String imgSrc;

    @TableLogic
    private Integer dateled;
}
