package com.mai.pizza;

import javax.persistence.*;
import java.text.NumberFormat;

@Entity
@Table(name = "Pizza")
public class Pizza {
    @Id
    @GeneratedValue(generator = "increment")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "ingredient")
    private String ingredient;

    @Column(name = "price")
    private String price;

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getpriceCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(price);
    }
}
