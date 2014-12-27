package com.mai.pizza;

import javax.persistence.*;

@Entity
@Table(name = "pizza_in_order")
public class Pizza_in_order {

    @Id
    @GeneratedValue(generator = "increment")
    private int id;

    @Column(name = "order_id")
    private Order order_id;

    @Column(name = "pizza_id")
    private Pizza pizza_id;

    @Column(name = "count")
    private int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Pizza getPizza_id() {
        return pizza_id;
    }

    public void setPizza_id(Pizza pizza_id) {
        this.pizza_id = pizza_id;
    }

    public Order getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Order order_id) {
        this.order_id = order_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
