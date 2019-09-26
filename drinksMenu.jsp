<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Menu</title>
    </head>
  <body>
    <h1>Drinks Menu</h1>
    
    <table border="1">
      <tr>
        <td>ID</td>
        <td>Drink</td>
        <td>Price</td>
   </tr>
    <% 
     String db = "drinks";
        String user; // assumes database name is the same as username
          user = "157a";
        String password = "CS157Apass";
        try {
            
            java.sql.Connection con; 
            //Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/drinks?serverTimezone=EST5EDT",user, password);
            //out.println(db + " database successfully opened.<br/><br/>");
            
            //out.println("Initial entries in table \"students\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM drinks ");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
