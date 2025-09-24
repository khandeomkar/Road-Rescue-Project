<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Records</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
  
  .feedback-button {
    display: inline-block;
    background-color: #28a745;
    color: white;
    padding: 12px 25px;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 600;
    font-size: 16px;
    transition: all 0.3s ease;
    box-shadow: 0 2px 5px rgba(40, 167, 69, 0.3);
    border: none;
    cursor: pointer;
  }
  
  .feedback-button:hover {
    background-color: #218838;
    color: white;
    text-decoration: none;
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(40, 167, 69, 0.4);
  }
  
  .feedback-button:active {
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(40, 167, 69, 0.3);
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
    
    .feedback-button {
      padding: 10px 20px;
      font-size: 14px;
    }
  }
</style>
</head>
<body>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String meassage = request.getParameter("meassage");

// Insert feedback only if all fields are filled
if (id != null && name != null && email != null && phone != null && meassage != null
    && !id.trim().isEmpty() && !name.trim().isEmpty()
    && !email.trim().isEmpty() && !phone.trim().isEmpty()
    && !meassage.trim().isEmpty()) {

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue", "root", "Khande@123");

        String query = "INSERT INTO contactus (id, name, email, phone, message) VALUES (?, ?, ?, ?, ?)";
        ps = con.prepareStatement(query);
        ps.setString(1, id);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, meassage);

        int i = ps.executeUpdate();
        if (i > 0) {
            out.print("<h4 style='color:green;text-align:center;'>Data stored successfully.</h4>");
        } else {
            out.print("<h4 style='color:red;text-align:center;'>Error: Data not stored.</h4>");
        }

    } catch (Exception e) {
        out.print("<h4 style='color:red;text-align:center;'>Error: " + e.getMessage() + "</h4>");
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
}
%>

<h2 class="h">Feedback Records</h2>
<br>

<table class="table table-hover text-center">
<thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Message</th>
    </tr>
</thead>
<tbody>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue", "root", "Khande@123");
    Statement st = c.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM contactus");

    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("meassage") %></td>
    </tr>
<%
    }
    rs.close();
    st.close();
    c.close();
} catch (Exception e) {
    out.print("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
}
%>
</tbody>
</table>

<center class="pt-3">
    <a href="contactus.jsp" class="feedback-button">
        Go to Feedback Form
    </a>
</center>

</body>
</html>