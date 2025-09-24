package com.RoadRescueProject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/signupup")
public class RRsignup extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname=request.getParameter("fullname");
		String username=request.getParameter("username");
		String city=request.getParameter("city");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmpassword=request.getParameter("confirmpassword");

		ResultSet rs=null;
		Connection con=null;
		PreparedStatement ps=null;
		String querry="insert into signup (fullname,username,city,mobile,email,password,confirmpassword)values(?,?,?,?,?,?,?)";
		PrintWriter out=response.getWriter();
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =DriverManager.getConnection("jdbc:mysql://localhost:3306/roadrescue","root","Khande@123");
		    ps=con.prepareStatement(querry);
		    ps.setString(1, fullname);
		    ps.setString(2, username);
		    ps.setString(3, city);
		    ps.setString(4, mobile);
		    ps.setString(5, email);
		    ps.setString(6, password);
		    ps.setString(7, confirmpassword);

		    int i=ps.executeUpdate();
		    
		    if(i>0){
	    	response.sendRedirect("login.jsp");
		    	
		    //	out.print("<a href=RRlogin.jsp>Go to login Page</a>");
		    	
		    }
		    else{
		    	out.print("<h1>Error Data not stored </h1>");
		    }
			
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

}