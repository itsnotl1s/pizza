package com.mai.pizza;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.Iterator;
import java.util.List;


public class UserDao {
    public static int register(User u) {
        int id = 0;
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        t.begin();
        id = (Integer) session.save(u);
        t.commit();
        session.close();
        return id;
    }

    @SuppressWarnings("unchecked")
    public static int logon(String name, String password) {
        Session session = new Configuration().configure().buildSessionFactory().openSession();
        String SQL_QUERY = " from User u where u.login='" + name + "' and u.password='" + password + "'";
        System.out.println(SQL_QUERY);
        Query query = session.createQuery(SQL_QUERY);
        Iterator<User> it = query.iterate();
        List<User> list = query.list();
        if (list.size() > 0) {
            session.close();
            return User.getId();
        }
        session.close();
        return 0;
    }

}