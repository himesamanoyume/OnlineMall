package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;


import java.math.BigDecimal;
import java.util.List;

@Data
public class Book extends BaseEntity<Book>{
    @TableId(type = IdType.AUTO)
    private Integer bookId;
    private String name;
    private BigDecimal price;
    private String author;
    private Integer amount;
    private String txt;
    private Integer stock;
    private String publisher;
    private String publishTime;
    private Integer status;
    private Integer sellerId;

    @TableField(exist = false)
    private User seller;

    @TableField(exist = false)
    private List<String> srcList;

    @TableField(exist = false)
    private String imgSrc;

    @TableField(exist = false)
    private List<Integer> bookIds;

    //用于传参，数据库中并不存在
    @TableField(exist = false)
    private String sellerName;
}
