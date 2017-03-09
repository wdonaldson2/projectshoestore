<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Description of Shoe</title>
    <link rel="stylesheet" href="styles.css" type="text/css">

</head>
<body>
<h1>Show Details</h1>
<%
    //you need this for JDBC with MySQL in version 5
    //even though you're not supposed to
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/shoestore",
            "jdbc",
            "java1234");
    Statement statement = connection.createStatement();
    Resultset resultset = statement.executeQuery(
            "SELECT * FROM shoestore.shoes Where shoeid ='SKU# 00001'");
%>


Shoe ID: <%= resultset.getString("SKU# 00001") %><br>

<a href="listAll.jsp">Return to Shoe List</a>
<%
    //cleaning up after myself
    if (statement != null) {
        statement.close();
    }
    if (connection != null) {
        connection.close();
    }
%>

</body>
</html>