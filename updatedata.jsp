<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Information</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f8f9fa;
    font-family: Arial, sans-serif;
    padding: 20px;
  }
  
  .update-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 80vh;
  }
  
  .update-card {
    background-color: white;
    border: 2px solid #dee2e6;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    overflow: hidden;
    width: 100%;
    max-width: 450px;
  }
  
  .card-header {
    background-color: #495057;
    color: white;
    text-align: center;
    padding: 20px;
    margin: 0;
    border-bottom: 2px solid #dee2e6;
  }
  
  .card-header h4 {
    margin: 0;
    font-weight: 600;
    font-size: 18px;
  }
  
  .form-container {
    padding: 30px;
  }
  
  .form-label {
    color: #495057;
    font-weight: 600;
    margin-bottom: 8px;
    font-size: 14px;
  }
  
  .form-control {
    border: 1px solid #dee2e6;
    border-radius: 4px;
    padding: 12px 15px;
    font-size: 14px;
    transition: all 0.3s ease;
  }
  
  .form-control:focus {
    border-color: #495057;
    box-shadow: 0 0 0 0.2rem rgba(73, 80, 87, 0.25);
  }
  
  .btn-update {
    background-color: #495057;
    border-color: #495057;
    color: white;
    padding: 12px 30px;
    font-weight: 600;
    border-radius: 4px;
    width: 100%;
    transition: all 0.3s ease;
    margin-top: 20px;
  }
  
  .btn-update:hover {
    background-color: #343a40;
    border-color: #343a40;
    color: white;
  }
  
  .btn-back {
    background-color: #6c757d;
    border-color: #6c757d;
    color: white;
    padding: 8px 20px;
    font-weight: 500;
    border-radius: 4px;
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s ease;
    margin-top: 10px;
  }
  
  .btn-back:hover {
    background-color: #5a6268;
    border-color: #5a6268;
    color: white;
    text-decoration: none;
  }
  
  .alert {
    border-radius: 4px;
    margin-bottom: 20px;
    padding: 12px 15px;
    font-size: 14px;
  }
  
  .mb-3 {
    margin-bottom: 20px;
  }
  
  .button-group {
    text-align: center;
  }
  
  @media (max-width: 768px) {
    .update-card {
      margin: 10px;
      max-width: 100%;
    }
    
    .form-container {
      padding: 20px;
    }
  }
</style>
</head>
<body>

<%
String message = "";
String id = request.getParameter("id");
String name = "";
String password = "";

String jdbcURL = "jdbc:mysql://localhost:3306/roadrescue";
String dbUser = "root";
String dbPassword = "Khande@123";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

    if (id != null) {
        String fetchQuery = "SELECT * FROM signup WHERE id=?";
        pstmt = conn.prepareStatement(fetchQuery);
        pstmt.setInt(1, Integer.parseInt(id));
        rs = pstmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("fullname");
            password = rs.getString("password");
        }
        rs.close();
        pstmt.close();
    }

    if (request.getParameter("update") != null) {
        name = request.getParameter("name");
        password = request.getParameter("password");
        String updateQuery = "UPDATE signup SET fullname=?,password=? WHERE id=?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, name);
        pstmt.setString(2, password);
        pstmt.setInt(3, Integer.parseInt(id));

        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            response.sendRedirect("crudoperation.jsp");
            return;
        } else {
            message = "<div class='alert alert-danger'>⚠ Update Failed! User not found.</div>";
        }
    }
} catch (Exception e) {
    message = "<div class='alert alert-danger'>⚠ Error: " + e.getMessage() + "</div>";
} finally {
    try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
    try { if (conn != null) conn.close(); } catch (Exception ignored) {}
}
%>

<div class="update-container">
    <div class="update-card">
        <div class="card-header">
            <h4>Update User Information</h4>
        </div>
        <div class="form-container">
            <%= message %>

            <form action="updatedata.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                
                <div class="mb-3">
                    <label class="form-label">
                        Full Name
                    </label>
                    <input type="text" name="name" class="form-control" value="<%= name %>" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">
                        Password
                    </label>
                    <input type="text" name="password" class="form-control" value="<%= password %>">
                </div>
                
                <div class="button-group">
                    <button type="submit" name="update" class="btn-update">
                        Update Information
                    </button>
                    
                    <div class="mt-3">
                        <a href="crudoperation.jsp" class="btn-back">
                            ← Back to User List
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>