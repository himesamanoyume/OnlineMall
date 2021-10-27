package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

import java.math.BigDecimal;

public class Phone {
    @TableId(type = IdType.AUTO)
    private Integer phone_id;
    private String name;
    private BigDecimal price;
    private String designer;
    private Integer amount;
    private String txt;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Phone phone = (Phone) o;

        if (!phone_id.equals(phone.phone_id)) return false;
        if (!name.equals(phone.name)) return false;
        if (!price.equals(phone.price)) return false;
        if (!designer.equals(phone.designer)) return false;
        if (!amount.equals(phone.amount)) return false;
        return txt.equals(phone.txt);
    }

    @Override
    public int hashCode() {
        int result = phone_id.hashCode();
        result = 31 * result + name.hashCode();
        result = 31 * result + price.hashCode();
        result = 31 * result + designer.hashCode();
        result = 31 * result + amount.hashCode();
        result = 31 * result + txt.hashCode();
        return result;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getPhoneId() {
        return phone_id;
    }

    public void setPhoneId(Integer phoneId) {
        this.phone_id = phone_id;
    }


    @Override
    public String toString() {
        return "Phone{" +
                "phone_id=" + phone_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", designer='" + designer + '\'' +
                ", amount=" + amount +
                ", txt='" + txt + '\'' +
                '}';
    }
}
