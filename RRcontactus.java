package com.RoadRescueProject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/contactus")

public class RRcontactus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		
		String name=req.getParameter("name");
        String email=req.getParameter("email");
        String phone=req.getParameter("phone");
        String message=req.getParameter("message");
        String url="jdbc:mysql://localhost:3306/roadrescue";
        String user="root";
        String pass="Khande@123";
        
		try
		{
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 
		 Connection con = DriverManager.getConnection(url,user,pass);
		 String query="insert into contactus(name,email,phone,meassage) values(?,?,?,?)";
		 PreparedStatement ps= con.prepareStatement(query);

		 ps.setString(1, name);
		 ps.setString(2, email);
		 ps.setString(3, phone);
		 ps.setString(4, message);
		 
		 int row = ps.executeUpdate();
		 con.close();

		 if (row > 0) {
		     // redirect back to JSP with success flag
		     res.sendRedirect("contactus.jsp?success=true");
		 } else {
		     res.sendRedirect("contactus.jsp?success=false");
		 }

		}
		 
		catch(Exception e)
		{
			e.printStackTrace();
			res.getWriter().println("<h2> Error :"+e.getMessage()+"</h2>");
		} 
	}

}