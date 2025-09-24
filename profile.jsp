<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%
    String username = (String) session.getAttribute("username");
    
    String url="jdbc:mysql://localhost:3306/roadrescue";
    String user="root";
    String pass="Khande@123";
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    
    String fullname="",uname="",email="",phoneNo="",city="";
    
    try{
    	 Class.forName("com.mysql.cj.jdbc.Driver");
    	    con = DriverManager.getConnection(url, user, pass);
    	    String query = "select * FROM signup where username = ?";
    	    pstm = con.prepareStatement(query);
    	    pstm.setString(1, username);   
    	    rs = pstm.executeQuery();     	
    	while(rs.next()){
    		fullname=rs.getString("fullname");
    		uname=rs.getString("username");
    		email=rs.getString("email");
    		phoneNo=rs.getString("mobile");
    		city=rs.getString("city");
    	}
    	
    }catch(Exception e){
    	e.getStackTrace();
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Road Rescue - Profile</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Arial', sans-serif; 
            min-height: 100vh; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            padding: 20px; 
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #4a90e2 100%); 
            background-attachment: fixed; 
        }
        
        .profile-container { 
            background: white; 
            border-radius: 15px; 
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1); 
            padding: 15px 40px 25px 40px; 
            width: 100%; 
            max-width: 600px; 
            text-align: center; 
        }
        
        .logo { margin-bottom: 20px; }
        
        .website-title { 
            font-size: 24px; 
            color: #1e3c72; 
            font-weight: bold; 
            margin-bottom: 5px; 
        }
        
        .subtitle { 
            color: #666; 
            margin-bottom: 25px; 
            font-size: 14px; 
        }
        
       
        
        .profile-info {
            text-align: left;
            margin-bottom: 20px;
        }
        
        .info-row { 
            display: flex; 
            gap: 15px; 
            margin-bottom: 15px; 
        }
        
        .info-group { 
            margin-bottom: 15px; 
            flex: 1; 
        }
        
        .info-group label { 
            display: block; 
            margin-bottom: 5px; 
            color: #333; 
            font-weight: bold; 
            font-size: 14px; 
        }
        
        .info-value { 
            width: 100%; 
            padding: 10px 12px; 
            border: 2px solid #e1e1e1; 
            border-radius: 8px; 
            font-size: 14px; 
            background-color: #f8f9fa;
            color: #555;
            min-height: 20px;
        }
        

      
        
        .btn { 
            flex: 1;
            padding: 12px; 
            border: none; 
            border-radius: 8px; 
            font-size: 14px; 
            font-weight: bold; 
            cursor: pointer; 
            transition: transform 0.2s ease, box-shadow 0.3s ease; 
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); 
            color: white; 
        }
        
        .btn-secondary {
            background: #f8f9fa;
            color: #1e3c72;
            border: 2px solid #e1e1e1;
        }
        
        .btn:hover { 
            transform: translateY(-2px); 
            box-shadow: 0 8px 25px rgba(42, 82, 152, 0.3); 
        }
        
        .btn:active { 
            transform: translateY(0); 
        }
        
        .logout-link { 
            margin-top: 15px; 
            padding-top: 15px; 
            border-top: 1px solid #e1e1e1; 
            color: #666; 
            font-size: 14px; 
        }
        
        .logout-link a { 
            color: #e74c3c; 
            text-decoration: none; 
            font-weight: bold; 
        }
        
        .logout-link a:hover { 
            text-decoration: underline; 
        }
        
        @media (max-width: 768px) {
            .profile-container { 
                padding: 10px 20px 25px 20px; 
                margin: 10px; 
                max-width: 350px; 
            }
            .website-title { font-size: 24px; }
            .info-value { padding: 10px 12px; font-size: 14px; }
            .btn { padding: 12px; font-size: 14px; }
            .info-row { flex-direction: column; gap: 0; }
            .action-buttons { flex-direction: column; }
        }
        
        @media (min-width: 769px) {
            .profile-container { 
                max-width: 650px; 
                padding: 20px 50px 35px 50px; 
            }
            .website-title { font-size: 28px; }
            .info-value { padding: 12px 15px; font-size: 16px; }
            .btn { padding: 14px; font-size: 16px; }
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="logo">
            <img src="images/RRlogo.png" alt="Road Rescue Logo" style="width: 150px; height: 150px;">
            <h1 class="website-title">Road Rescue</h1>
            <p class="subtitle">Your Profile Information</p>
        </div>
        
      
        <div class="profile-info">
            <div class="info-row">
                <div class="info-group">
                    <label>Full Name</label>
                    <div class="info-value"><%=fullname %></div>
                </div>
                <div class="info-group">
                    <label>Username</label>
                    <div class="info-value"><%=uname %></div>
                </div>
            </div>
            
            <div class="info-row">
                <div class="info-group">
                    <label>City</label>
                    <div class="info-value"><%=city %></div>
                </div>
                <div class="info-group">
                    <label>Mobile Number</label>
                    <div class="info-value">+91 <%=phoneNo %></div>
                </div>
            </div>
            
            <div class="info-group">
                <label>Email Address</label>
                <div class="info-value"><%=email %></div>
            </div>
        </div>
        
        <div class="logout-link">
            <a href="RRlogin.jsp">Logout</a>
        </div>
    </div>
</body>
</html>