<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin panel</title>
<style>
    /* CSS for aligning forms in a line */
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1 {
        margin-bottom: 20px;
    }

    .forms-container {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        width: 100%;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
</style>
</head>
<body>

<h1>Welcome admin</h1>
 <div class="forms-container">
    <form action="Home.jsp" method="post">
        <h3>Add values</h3>
        <p>Name</p>
        <input type="text" name="name">
        <p>Mobile</p>
        <input type="text" name="mobile"><br>
        <input type="hidden" name="action" value="add">
        <input type="submit" value="Add">
    </form>
    <form action="Home.jsp" method="post">
        <h3>Delete user</h3>
        <p>Name</p>
        <input type="text" name="nameToDelete"><br>
        <input type="hidden" name="action" value="delete">
        <input type="submit" value="Delete">
    </form>
    <form action="Home.jsp" method="post">
        <h3>Update values</h3>
        <p>Name</p>
        <input type="text" name="nameToUpdate">
        <p>New Mobile</p>
        <input type="text" name="newMobile"><br>
        <input type="hidden" name="action" value="update">
        <input type="submit" value="Update">
    </form>
</div><hr>
    <%
    
    String action = request.getParameter("action");
    if (action != null) {
        if ("add".equals(action)) {
            
            if("POST".equalsIgnoreCase(request.getMethod())){
                String jdbcUrl = "jdbc:mysql://localhost:3306/experiment6";
                String dbUser = "root";
                String dbPassword = "root";
                String selectData = "Insert into users(Name,Mobile) values(?,?)";
            
                try{
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);
                    String Username = request.getParameter("name");
                    String Mobile = request.getParameter("mobile");
                    PreparedStatement stmt = con.prepareStatement(selectData);
                    stmt.setString(1,Username);
                    stmt.setString(2,Mobile);
                    stmt.executeUpdate();
                    out.println("<p>Data entered successfully</p>");
                    
                } catch (Exception e) {
                    out.println("<p>Error inserting data into the database: " + e.getMessage() + "</p>");
                } 
             
            }
        } else if ("delete".equals(action)) {
            String Username = request.getParameter("username");
            String Mobile = request.getParameter("mobile");
            
            if("POST".equalsIgnoreCase(request.getMethod())){
                String jdbcUrl = "jdbc:mysql://localhost:3306/experiment6";
                String dbUser = "root";
                String dbPassword = "root";
                
                try{
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);
                    String nameToDelete = request.getParameter("nameToDelete");
                    String selectData2 = "DELETE FROM users WHERE Name = ?";
                    PreparedStatement stmt2 = con.prepareStatement(selectData2);
                    stmt2.setString(1,nameToDelete);
                    stmt2.executeUpdate();
                    out.println("<p>Deleted data successfully</p>");
                    
                } catch(Exception e) {
                    out.println("<p>Error deleting data from database" + e.getMessage() + "</p>");
                }
            }
        }
        else if ("update".equals(action)) {
            String nameToUpdate = request.getParameter("nameToUpdate");
            String newMobile = request.getParameter("newMobile");
            
            if("POST".equalsIgnoreCase(request.getMethod())){
                String jdbcUrl = "jdbc:mysql://localhost:3306/experiment6";
                String dbUser = "root";
                String dbPassword = "root";
                
                try{
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);
                    String updateData = "UPDATE users SET Mobile = ? WHERE Name = ?";
                    PreparedStatement stmt = con.prepareStatement(updateData);
                    stmt.setString(1,newMobile);
                    stmt.setString(2,nameToUpdate);
                    stmt.executeUpdate();
                    out.println("<p>Data updated successfully</p>");
                    
                } catch(Exception e) {
                    out.println("<p>Error updating data in database" + e.getMessage() + "</p>");
                }
            }
        }
    }
    
    %>
    
    <br>
    <hr>
    <h2>All users</h2>
    <% 
    if("POST".equalsIgnoreCase(request.getMethod())){
          String jdbcUrl = "jdbc:mysql://localhost:3306/experiment6";
          String dbUser = "root";
          String dbPassword = "root";
          String selectData = "SELECT * FROM users";
          
          try{
              
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);
              
              PreparedStatement stmt = con.prepareStatement(selectData);
              out.println("<table border='1'><tr><th>Name</th><th>Mobile</th></tr>");
              ResultSet resultSet = stmt.executeQuery();
              while (resultSet.next()) {
                  
                  String name = resultSet.getString("Name");
                  String mobile = resultSet.getString("Mobile");
                  out.println("<tr><td>" + name + "</td><td>" + mobile + "</td></tr>");
              }
              out.println("</table>");
          } catch (Exception e) {
              out.println("<p>Error inserting data into the database: " + e.getMessage() + "</p>");
          } 
         
    }
    
    %>
</body>

</html>
