package com.mai.pizza;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;
    private ArrayList<LineItem> items;

    public Cart() {
        items = new ArrayList<LineItem>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(LineItem item) {
        boolean is_new = true;
        for (LineItem lineitem : items) {
            if (lineitem.getProduct().getId() == item.getProduct().getId()) {
                lineitem.setQuantity(item.getQuantity());
                is_new = false;
                break;
            }
        }
        if (is_new) {
            items.add(item);
        }
    }

    public void removeItem(LineItem item) {
        int code = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getId() == code) {
                items.remove(i);
                return;
            }
        }
    }
}