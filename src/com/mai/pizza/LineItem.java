package com.mai.pizza;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;

public class LineItem implements Serializable {
    private static final long serialVersionUID = 1L;
    private Pizza product;
    private int quantity;

    public LineItem() {
    }

    public void setProduct(Pizza product) {
        this.product = product;
    }

    public Pizza getProduct() {
        return product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public BigDecimal getTotal() {
        return new BigDecimal(Integer.parseInt(product.getPrice()) * quantity);
    }

    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotal());
    }
}
