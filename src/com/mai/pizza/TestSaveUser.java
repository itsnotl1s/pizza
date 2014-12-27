package com.mai.pizza;

import com.mai.util.HibernateUtil;
import junit.framework.TestCase;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TestSaveUser extends TestCase {

    public void testSave() {
        User user = new User();
        user.setId(2);
        user.setLogin("apple");
        user.setPassword("123456");
        user.setEmail("gg@mail.ru");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(user);
        tx.commit();
        session.close();
        HibernateUtil.shutdown();
    }
}
