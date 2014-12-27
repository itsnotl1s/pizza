<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>WebPizza</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <p><%
                        String myname =  (String)session.getAttribute("username");
                        int id =  (Integer)session.getAttribute("id");
                        if("admin".equals(myname)){
                            out.println("Welcome  "+myname+" , Select a pizza.");
                        }
                        else {out.println("Please Login in");}
                        %>
                    <%int order_id =Integer.parseInt(request.getParameter("orderCode"));%>
                <b>Order №<%=id%>
                </b>
            <table width="750" border="1" cellspacing="4">
                <tr align="center">
                    <th>Name pizza</th>
                    <th>Count</th>
                </tr>
            <%@ page
                    import="com.mai.pizza.Pizza_in_order,org.hibernate.Query,org.hibernate.Session,org.hibernate.SessionFactory" %>
            <%@ page import="org.hibernate.cfg.Configuration" %>
            <%@ page import="java.util.Iterator" %>
            <%! int order_id;
                    int pizza_count;
                    String pizza_name;
                    Session session1 = null; %>

                <%

                    Configuration cf = new Configuration();
                    cf.configure();
                    SessionFactory sf = cf.buildSessionFactory();
                    session1 = sf.openSession();
//Using from Clause
                    String SQL_QUERY = "from Pizza_in_order o where o.order_id" + order_id;
                    Query query = session1.createQuery(SQL_QUERY);
                    Iterator it = query.iterate();
                    while (it.hasNext()) {
                        Pizza_in_order o = (Pizza_in_order) it.next();
                        pizza_name = o.getPizza_id().getName();
                        pizza_count = o.getCount();
                %>
                <tr align="center">
                    <td><%=pizza_name%>
                    </td>
                    <td><%=pizza_count%>
                    </td>
                </tr>
                <%
                    }
                    session1.close();
                %>

            </table>
            <a href="/orders.jsp">return to orders</a>

            <p>
        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>