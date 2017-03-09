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
            "jdbc:mysql://localhost:3306/shoestore",
            "jdbc",
            "java1234");
    Statement statement = connection.createStatement();
    ResultSet resultset = statement.executeQuery(
            "select shoeid, brand, price, shoesize" +
                    "color, discount, categories, piclink" +
                    " from shoes ORDER BY shoeid");
%>
<h1>Shoe List</h1>
<a href="form.html">Add New Customer</a>
<table BORDER="1">
    <tr>
        <th colspan="5">Shoe Info</th>
        <th colspan="2" rowspan="2">Database Operations</th>
    </tr>
    <tr>
        <th>ID Number</th>
        <th>Brand Name</th>
        <th>Price</th>
        <th>Shoe Size</th>
        <th>Color</th>
        <th>Discount</th>
        <th>Categories</th>
        <th>Shoe Link</th>
    </tr>
    <% while(resultset != null && resultset.next()){ %>
    <TR>
        <td> <%= resultset.getString("shoeid") %></td>
        <td> <%= resultset.getString("brand") %></td>
        <td> <%= resultset.getString("price") %></td>
        <td> <%= resultset.getString("shoesize") %></td>
        <td> <%= resultset.getString("color") %></td>
        <td> <%= resultset.getString("discount") %></td>
        <td> <%= resultset.getString("categories") %></td>
        <td> <%= resultset.getString("piclink") %></td>
        <td class="button">
            <form method="post" action="updateCustomerForm.jsp">
                <input type="hidden" name="shoeid" value="<%= resultset.getString("shoeid") %>">
                <input type="hidden" name="brand" value="<%= resultset.getString("brand") %>">
                <input type="hidden" name="price" value="<%= resultset.getString("price") %>">
                <input type="hidden" name="shoesize" value=" <%= resultset.getString("shoesize") %>">
                <input type="hidden" name="color" value="<%= resultset.getString("color") %>">
                <input type="hidden" name="discount" value="<%= resultset.getString("discount") %>">
                <input type="hidden" name="categories" value="<%= resultset.getString("categories") %>">
                <input type="hidden" name="piclink" value="<%= resultset.getString("piclink") %>">
                <input type="submit" value="Update">
            </form>
        </td>
        <td class="button">
            <form action="" method="post">
                <input type="hidden" name="id" value="<%= resultset.getString("shoeid") %>">
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
