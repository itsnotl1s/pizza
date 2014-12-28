<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WebPizza</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<body>
<div id="container">
    <%@ include file="header.jsp" %>
    <div id="main_content">
        <div class="content">
            <%
                String myname = (String) session.getAttribute("username");
                int id = (Integer) session.getAttribute("id");
                if (myname.toLowerCase().trim().equals("admin")) {
                    out.println("Welcome  " + myname + " , Select a pizza to remove.");
                } else {
                    out.println("Please Login in");
                }
            %>
            <table width="750" border="1" cellspacing="4">
                <tr align="center">
                    <th>Name</th>
                    <th>Ingredients</th>
                    <th>Price</th>
                    <th>Cart</th>
                </tr>
                <%@ page
                        import="com.mai.pizza.Pizza,com.mai.util.SessionUtil,org.hibernate.Query,org.hibernate.Session" %>
                <%@ page import="org.hibernate.SessionFactory" %>
                <%@ page import="org.hibernate.cfg.Configuration" %>
                <%@ page import="java.util.Iterator" %>
                <%! int pizza_id;
                    String flag;
                    String ingredient;
                    String price;
                    String name;
                    Session session1 = null; %>

                <%
                    Configuration cf = new Configuration();
                    cf.configure();
                    SessionFactory sf = SessionUtil.getSessionFactory();
                    session1 = sf.openSession();
//Using from Clause
                    String SQL_QUERY = "from Pizza";
                    Query query = session1.createQuery(SQL_QUERY);
                    Iterator it = query.iterate();
                    while (it.hasNext()) {
                        Pizza p = (Pizza) it.next();
                        flag = p.getFlag();
                        pizza_id = p.getId();
                        name = p.getName();
                        ingredient = p.getIngredient();
                        price = p.getPrice();
                %>
                <tr align="center">
                    <td><%=name%>
                    </td>
                    <td><%=ingredient%>
                    </td>
                    <td><%=price%>
                    </td>

                    <td>
                        <form action="${pageContext.request.contextPath}/DeleteServlet">
                            <input type="hidden" name="productCode" value="<%=pizza_id%>"/>
                            <select name="flag" size="1">
                                <option <%=("0".equals(flag)) ? "selected='selected'" : ""%> value="0">Hide (delete)
                                </option>
                                <option <%=("1".equals(flag)) ? "selected='selected'" : ""%> value="1">Unhide</option>
                            </select>
                            <input type="submit" value="Submit"/>
                        </form>
                    </td>
                </tr>
                <%
                    }
                    session1.close();
                %>

            </table>

        </div>
        <%@ include file="menu.jsp" %>
        <div id="clear"></div>
    </div>
</div>
</body>
</html>