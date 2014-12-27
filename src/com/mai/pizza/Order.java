package com.mai.pizza;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "Orders")
public class Order {

    @Id
    @GeneratedValue(generator = "increment")
    private int id;

    @Column(name = "user")
    private User user;

    @Column(name = "status")
    private int status;

    @Column(name = "final_price")
    private BigDecimal final_price;

    public BigDecimal getFinal_price() {
        return final_price;
    }

    public void setFinal_price(BigDecimal final_price) {
        this.final_price = final_price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
