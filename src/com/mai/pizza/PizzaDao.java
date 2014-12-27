package com.mai.pizza;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class PizzaDao {
    public static int add_pizza(Pizza p) {
        int id = 0;
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        t.begin();
        id = (Integer) session.save(p);
        t.commit();
        session.close();
        return id;
    }

}
