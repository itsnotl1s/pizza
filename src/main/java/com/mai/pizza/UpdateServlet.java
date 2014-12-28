package com.mai.pizza;

import com.mai.util.SessionUtil;
import org.hibernate.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by L1S on 28.12.2014.
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderCode = request.getParameter("orderCode");
        String menu = request.getParameter("menu");

        int order_id = Integer.parseInt(orderCode);
        int new_status = Integer.parseInt(menu);

        Session session1 = SessionUtil.getSessionFactory().openSession();
        session1.beginTransaction();


        Order o = (Order) session1.get(Order.class, order_id);
        o.setStatus(new_status);
        session1.update(o);
        session1.getTransaction().commit();
        session1.flush();
        session1.close();


        String url = "/orders.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
