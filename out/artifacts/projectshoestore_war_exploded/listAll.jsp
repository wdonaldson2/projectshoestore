<%--
  Created by IntelliJ IDEA.
  User: paperspace
  Date: 3/8/2017
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<body>
<%
    //you need this for JDBC with MySQL in version 5
    //even though you're not supposed to
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/gcdojo",
            "jdbc",
            "java1234");
    Statement statement = connection.createStatement();
    ResultSet resultset = statement.executeQuery(
            "select firstName, lastName, email, " +
                    "usertel, zipCode, Classes" +
                    " from signups1 ORDER BY lastName");
%>
<h1>Customer List</h1>
<a href="form.html">Add New Customer</a>
<table BORDER="1">
    <tr>
        <th colspan="5">Customer Info</th>
        <th colspan="2" rowspan="2">Database Operations</th>
    </tr>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Zip Code</th>
        <th>Classes</th>
    </tr>
    <% while(resultset != null && resultset.next()){ %>
    <TR>
        <td> <%= resultset.getString("firstName") %></td>
        <td> <%= resultset.getString("lastName") %></td>
        <td> <%= resultset.getString("email") %></td>
        <td> <%= resultset.getString("usertel") %></td>
        <td> <%= resultset.getString("zipCode") %></td>
        <td> <%= resultset.getString("Classes") %></td>
        <td class="button">
            <form method="post" action="updateCustomerForm.jsp">
                <input type="hidden" name="firstName" value="<%= resultset.getString("firstName") %>">
                <input type="hidden" name="lastName" value="<%= resultset.getString("lastName") %>">
                <input type="hidden" name="email" value="<%= resultset.getString("email") %>">
                <input type="hidden" name="usertel" value=" <%= resultset.getString("usertel") %>">
                <input type="hidden" name="zipCode" value="<%= resultset.getString("zipCode") %>">
                <input type="hidden" name="Classes" value="<%= resultset.getString("Classes") %>">
                <input type="submit" value="Update">
            </form>
        </td>
        <td class="button">
            <form action="deleteCustomer.jsp" method="post">
                <input type="hidden" name="id" value="<%= resultset.getString("lastName") %>">
                <input type="submit" value="Delete">
            </form>
        </td>


    </TR>
    <% }
        //cleaning up after myself
        if (resultset != null) {
            resultset.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    %>
</table>
</body>
</html>
