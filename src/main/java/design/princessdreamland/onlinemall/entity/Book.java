package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;


import java.math.BigDecimal;


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
    private String publish_date;
    private Integer status;

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", author='" + author + '\'' +
                ", amount=" + amount +
                ", txt='" + txt + '\'' +
                ", seller_id=" + seller_id +
                ", seller=" + seller +
                ", stock=" + stock +
                ", publisher='" + publisher + '\'' +
                ", publish_date='" + publish_date + '\'' +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        if (!book_id.equals(book.book_id)) return false;
        if (!name.equals(book.name)) return false;
        if (!price.equals(book.price)) return false;
        if (!author.equals(book.author)) return false;
        if (!amount.equals(book.amount)) return false;
        if (!txt.equals(book.txt)) return false;
        if (!seller_id.equals(book.seller_id)) return false;
        if (!seller.equals(book.seller)) return false;
        if (!stock.equals(book.stock)) return false;
        if (!publisher.equals(book.publisher)) return false;
        if (!publish_date.equals(book.publish_date)) return false;
        return status.equals(book.status);
    }

    @Override
    public int hashCode() {
        int result = book_id.hashCode();
        result = 31 * result + name.hashCode();
        result = 31 * result + price.hashCode();
        result = 31 * result + author.hashCode();
        result = 31 * result + amount.hashCode();
        result = 31 * result + txt.hashCode();
        result = 31 * result + seller_id.hashCode();
        result = 31 * result + seller.hashCode();
        result = 31 * result + stock.hashCode();
        result = 31 * result + publisher.hashCode();
        result = 31 * result + publish_date.hashCode();
        result = 31 * result + status.hashCode();
        return result;
    }

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public Integer getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(Integer seller_id) {
        this.seller_id = seller_id;
    }

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(String publish_date) {
        this.publish_date = publish_date;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
