<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crude operations</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
  body {
    background-color: #f8f9fa;
    font-family: Arial, sans-serif;
  }
  
  .table {
    border: 2px solid #dee2e6;
    margin: 20px auto;
    width: 90%;
    background-color: white;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    border-radius: 8px;
    overflow: hidden;
  }
  
  .table thead th {
    background-color: #495057;
    color: white;
    font-weight: 600;
    text-align: center;
    padding: 15px 8px;
    border-right: 1px solid #6c757d;
    border-bottom: 1px solid #6c757d;
    font-size: 14px;
  }
  
  .table thead th:last-child {
    border-right: none;
  }
  
  .table tbody td {
    padding: 12px 8px;
    text-align: center;
    border-bottom: 1px solid #dee2e6;
    border-right: 1px solid #dee2e6;
    vertical-align: middle;
    font-size: 14px;
  }
  
  .table tbody td:last-child {
    border-right: none;
  }
  
  .table tbody tr:hover {
    background-color: #f1f3f4;
  }
  
  .table tbody tr:nth-child(even) {
    background-color: #f8f9fa;
  }
  
  .table a {
    color: #495057;
    text-decoration: none;
    padding: 8px;
    border-radius: 4px;
    transition: all 0.3s ease;
  }
  
  .table a:hover {
    background-color: #e9ecef;
    color: #212529;
  }
  
  .fa-pen {
    color: #28a745;
  }
  
  .fa-trash {
    color: #dc3545;
  }
  
  .h {
    text-align: center;
    color: #495057;
    font-weight: 600;
    margin-bottom: 20px;
  }
  
  .register-link {
    display: inline-block;
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: 500;
    transition: background-color 0.3s ease;
  }
  
  .register-link:hover {
    background-color: #0056b3;
    color: white;
    text-decoration: none;
  }
  
  .container-fluid {
    padding: 20px;
  }
  
  @media (max-width: 768px) {
    .table {
      width: 95%;
      font-size: 12px;
    }
    
    .table thead th,
    .table tbody td {
      padding: 8px 4px;
    }
  }
</style>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
String fullname=request.getParameter("fullname");
String username=request.getParameter("username");
String city=request.getParameter("city");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String password=request.getParameter("password");
//String confirmpassword=request.getParameter("confirmpassword");


if (fullname != null && username != null && city != null && mobile != null && email != null && password != null && 
    !fullname.trim().isEmpty() && !username.trim().isEmpty() && !city.trim().isEmpty() && !mobile.trim().isEmpty() && !email.trim().isEmpty() && !password.trim().isEmpty()) 
{

    ResultSet rs = null;
    Connection con = null;
    PreparedStatement ps = null;
    String querry = "insert into signup (fullname, username, city, mobile, email, password) values (?, ?, ?, ?, ?, ?)";

    try
    {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue", "root", "Khande@123");
        ps = con.prepareStatement(querry);
        ps.setString(1, fullname);
        ps.setString(2, username);
        ps.setString(3, city);
        ps.setString(4, mobile);
        ps.setString(5, email);
        ps.setString(6, password);
    //    ps.setString(7, confirmpassword);

        int i = ps.executeUpdate();
        
        if (i > 0)
        {
            out.print("<h1 style='color:green;'>Data stored successfully....</h1>");
        } 
        else
        {
            out.print("<h1 style='color:red;'>Error: Data not stored.</h1>");
        }
        
    } 
    catch (Exception e)
    {
        out.print("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
    finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
}
%>

<div class="container-fluid">
    <h2 class="h">User Information</h2>
    
    <table class="table">
        <thead> 
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>User Name</th>
                <th>City</th>
                <th>Mobile No.</th>
                <th>Email</th>
                <th>Password</th>
                <!--  <th>Confirm Password</th>-->
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue","root","Khande@123");
            Statement st=c.createStatement();
            
            ResultSet set=st.executeQuery("SELECT * FROM signup");
            while(set.next()) {
        	%>
        	
            <tr>
                <td>
        	        <% out.println(set.getInt("id")); %>
        	    </td>
        	    <td>
        	        <% out.println(set.getString("fullname")); %>
        	    </td>
        	    <td>
        	        <% out.println(set.getString("username"));%>
        	    </td>
        	    <td> 
        	        <% out.println(set.getString("city"));%> 
        	    </td>
        	    <td>
        	        <% out.println(set.getString("mobile"));%>
        	    </td>   
        	    <td>
        	        <% out.println(set.getString("email"));%>
        	    </td>
        	    <td>
        	        <% out.println(set.getString("password"));%>
        	    </td>
        	    
        	    <td>
        	        <a href='updatedata.jsp?id=<%=set.getString("id") %>' title="Edit"><i class="fa-solid fa-pen"></i></a>
        	    </td>
        	    <td>
        	        <a href='deletedata.jsp?id=<%=set.getString("id") %>' title="Delete"><i class="fa-solid fa-trash"></i></a>
        	    </td>
            </tr>
         <%   }
            set.close();
        }
         catch(Exception e) {
        	 System.out.println(e);
         }
        %>
         </tbody>
    </table>
    
    <center class="pt-5">
        <a href="register.jsp" class="register-link">Register Student</a>
    </center>
</div>

</body>
</html>