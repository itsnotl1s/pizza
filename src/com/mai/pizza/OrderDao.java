package com.mai.pizza;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

public class OrderDao {
    public static int OrderMake(HttpServletRequest request, HttpServletResponse response) {
        Session session1 = new Configuration().configure().buildSessionFactory().openSession();
        session1.beginTransaction();

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Order my_order = new Order();
        my_order.setUser((User) session1.get(User.class, (Integer) session.getAttribute("id")));
        my_order.setStatus(Constants.ORDER_STATUS_ACTIVE);

        BigDecimal final_price = BigDecimal.ZERO;

        for (LineItem item : cart.getItems()) {
            final_price.add(item.getTotal());
        }
        my_order.setFinal_price(final_price);
        session1.save(my_order);

        for (LineItem item : cart.getItems()) {
            Pizza_in_order pizza = new Pizza_in_order();
            pizza.setOrder_id(my_order);
            pizza.setCount(item.getQuantity());
            pizza.setPizza_id(item.getProduct());
            session1.save(pizza);
        }

        session1.getTransaction().commit();
        session1.flush();
        session1.close();
        return my_order.getId();
    }
}
