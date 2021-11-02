package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;


import java.math.BigDecimal;

@Data
public class Book extends BaseEntity<Book>{
    @TableId(type = IdType.AUTO)
    private Integer book_id;
    private String name;
    private BigDecimal price;
    private String author;
    private Integer amount;
    private String txt;

    private Integer seller_id;

    @TableField(exist = false)
    private User seller;

    private Integer stock;
    private String publisher;
    private String publish_time;
    private Integer status;


}
