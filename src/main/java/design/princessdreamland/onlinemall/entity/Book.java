package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

import java.math.BigDecimal;
import java.util.List;

public class Book {
    @TableId(type = IdType.AUTO)
    private Integer bookId;
    private String name;
    private BigDecimal price;
    private String author;
    private Integer amount;
    @TableField(exist = false)
    private List<Integer> bookIds;
    @TableField(exist = false)
    private String sellerName;
    @TableField(exist = false)
    private String seller;

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", author='" + author + '\'' +
                ", amount=" + amount +
                ", bookIds=" + bookIds +
                ", sellerName='" + sellerName + '\'' +
                ", seller='" + seller + '\'' +
                ", txt='" + txt + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        if (!bookId.equals(book.bookId)) return false;
        if (!name.equals(book.name)) return false;
        if (!price.equals(book.price)) return false;
        if (!author.equals(book.author)) return false;
        if (!amount.equals(book.amount)) return false;
        if (!bookIds.equals(book.bookIds)) return false;
        if (!sellerName.equals(book.sellerName)) return false;
        if (!seller.equals(book.seller)) return false;
        return txt.equals(book.txt);
    }

    @Override
    public int hashCode() {
        int result = bookId.hashCode();
        result = 31 * result + name.hashCode();
        result = 31 * result + price.hashCode();
        result = 31 * result + author.hashCode();
        result = 31 * result + amount.hashCode();
        result = 31 * result + bookIds.hashCode();
        result = 31 * result + sellerName.hashCode();
        result = 31 * result + seller.hashCode();
        result = 31 * result + txt.hashCode();
        return result;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public List<Integer> getBookIds() {
        return bookIds;
    }

    public void setBookIds(List<Integer> bookIds) {
        this.bookIds = bookIds;
    }



    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
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

    private String txt;

}
