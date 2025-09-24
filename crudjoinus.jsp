<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Garage Records</title>
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
  
  .table tbody td {
    padding: 12px 8px;
    text-align: center;
    border-bottom: 1px solid #dee2e6;
    border-right: 1px solid #dee2e6;
    vertical-align: middle;
    font-size: 14px;
  }
  
  .table tbody tr:hover {
    background-color: #f1f3f4;
  }
  
  .fa-pen { color: #28a745; }
  .fa-trash { color: #dc3545; }
  
  .h {
    text-align: center;
    color: #495057;
    font-weight: 600;
    margin-bottom: 20px;
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
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(40, 167, 69, 0.4);
  }
</style>
</head>
<body>
<% 
// ----------- Fetch request parameters (Insert Section) -----------
String id = request.getParameter("id");
String business_name= request.getParameter("business_name");
String established_year= request.getParameter("established_year");
String business_type= request.getParameter("business_type");
String owner_name= request.getParameter("owner_name");
String mobile= request.getParameter("mobile");
String alternate_mobile= request.getParameter("alternate_mobile");
String email= request.getParameter("email");
String address= request.getParameter("address");
String city= request.getParameter("city");
String state= request.getParameter("state");
String pincode= request.getParameter("pincode");
String landmark= request.getParameter("landmark");
String open_time= request.getParameter("open_time");
String close_time= request.getParameter("close_time");
String weekly_off= request.getParameter("weekly_off");
String services= request.getParameter("services");
String payment_methods= request.getParameter("payment_methods");
String description= request.getParameter("description");

if (id != null && !id.trim().isEmpty()
&& business_name != null && !business_name.trim().isEmpty()
&& established_year != null && !established_year.trim().isEmpty()
&& business_type != null && !business_type.trim().isEmpty()
&& owner_name != null && !owner_name.trim().isEmpty()
&& mobile != null && !mobile.trim().isEmpty()
&& alternate_mobile != null && !alternate_mobile.trim().isEmpty()
&& email != null && !email.trim().isEmpty()
&& address != null && !address.trim().isEmpty()
&& city != null && !city.trim().isEmpty()
&& state != null && !state.trim().isEmpty()
&& pincode != null && !pincode.trim().isEmpty()
&& landmark != null && !landmark.trim().isEmpty()
&& open_time != null && !open_time.trim().isEmpty()
&& close_time != null && !close_time.trim().isEmpty()
&& weekly_off != null && !weekly_off.trim().isEmpty()
&& services != null && !services.trim().isEmpty()
&& payment_methods != null && !payment_methods.trim().isEmpty()
&& description != null && !description.trim().isEmpty())  {
	
	Connection con = null;
    PreparedStatement ps = null;
    
    try {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue", "root", "Khande@123");
          
          String query = "INSERT INTO garage_registrations " +
        	        "(id, business_name, established_year, business_type, owner_name, " +
        	        "mobile, alternate_mobile, email, address, city, state, pincode, " +
        	        "landmark, open_time, close_time, weekly_off, services, payment_methods, description) " +
        	        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
          
          ps = con.prepareStatement(query);
          ps.setString(1, id);
          ps.setString(2, business_name);
          ps.setString(3, established_year);
          ps.setString(4, business_type);
          ps.setString(5, owner_name);
          ps.setString(6, mobile);
          ps.setString(7, alternate_mobile);
          ps.setString(8, email);
          ps.setString(9, address);
          ps.setString(10, city);
          ps.setString(11, state);
          ps.setString(12, pincode);
          ps.setString(13, landmark);
          ps.setString(14, open_time);
          ps.setString(15, close_time);
          ps.setString(16, weekly_off);
          ps.setString(17, services);
          ps.setString(18, payment_methods);
          ps.setString(19, description);
          
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

<h2 class="h">Garage Requests</h2>
<br>

<table class="table table-hover text-center">
<thead>
<tr>
    <th>ID</th>
    <th>Business Name</th>
    <th>Established Year</th>
    <th>Business Type</th>
    <th>Owner Name</th>
    <th>Mobile</th>
    <th>Alternate Mobile</th>
    <th>Email</th>
    <th>Address</th>
    <th>City</th>
    <th>State</th>
    <th>Pincode</th>
    <th>Landmark</th>
    <th>Open Time</th>
    <th>Close Time</th>
    <th>Weekly Off</th>
    <th>Services</th>
    <th>Payment Methods</th>
    <th>Description</th>
</tr>
</thead>
<tbody>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue", "root", "Khande@123");
    String query = "SELECT * FROM garage_registrations";
    ps = con.prepareStatement(query);
    rs = ps.executeQuery();

    while(rs.next()) {
%>
<tr>
    <td><%= rs.getString("id") %></td>
    <td><%= rs.getString("business_name") %></td>
    <td><%= rs.getString("established_year") %></td>
    <td><%= rs.getString("business_type") %></td>
    <td><%= rs.getString("owner_name") %></td>
    <td><%= rs.getString("mobile") %></td>
    <td><%= rs.getString("alternate_mobile") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("address") %></td>
    <td><%= rs.getString("city") %></td>
    <td><%= rs.getString("state") %></td>
    <td><%= rs.getString("pincode") %></td>
    <td><%= rs.getString("landmark") %></td>
    <td><%= rs.getString("open_time") %></td>
    <td><%= rs.getString("close_time") %></td>
    <td><%= rs.getString("weekly_off") %></td>
    <td><%= rs.getString("services") %></td>
    <td><%= rs.getString("payment_methods") %></td>
    <td><%= rs.getString("description") %></td>
</tr>
<%
    }
} catch(Exception e) {
    out.print("<tr><td colspan='19' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
} finally {
    try { if (rs != null) rs.close(); } catch(Exception e) {}
    try { if (ps != null) ps.close(); } catch(Exception e) {}
    try { if (con != null) con.close(); } catch(Exception e) {}
}
%>
</tbody>
</table>

<center class="pt-3">
    <a href="joinus.jsp" class="feedback-button">
        Go to Feedback Form
    </a>
</center>

</body>
</html>
