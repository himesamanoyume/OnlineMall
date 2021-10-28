package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

import java.math.BigDecimal;
import java.util.List;

public class Book {
    @TableId(type = IdType.AUTO)
    private Integer book_id;
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
                "book_id=" + book_id +
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

        if (book_id != null ? !book_id.equals(book.book_id) : book.book_id != null) return false;
        if (name != null ? !name.equals(book.name) : book.name != null) return false;
        if (price != null ? !price.equals(book.price) : book.price != null) return false;
        if (author != null ? !author.equals(book.author) : book.author != null) return false;
        if (amount != null ? !amount.equals(book.amount) : book.amount != null) return false;
        if (bookIds != null ? !bookIds.equals(book.bookIds) : book.bookIds != null) return false;
        if (sellerName != null ? !sellerName.equals(book.sellerName) : book.sellerName != null) return false;
        if (seller != null ? !seller.equals(book.seller) : book.seller != null) return false;
        return txt != null ? txt.equals(book.txt) : book.txt == null;
    }

    @Override
    public int hashCode() {
        int result = book_id != null ? book_id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        result = 31 * result + (bookIds != null ? bookIds.hashCode() : 0);
        result = 31 * result + (sellerName != null ? sellerName.hashCode() : 0);
        result = 31 * result + (seller != null ? seller.hashCode() : 0);
        result = 31 * result + (txt != null ? txt.hashCode() : 0);
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

    private String txt;

}
