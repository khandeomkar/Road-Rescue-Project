package com.RoadRescueProject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RRsearch")
public class RRsearch extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get form parameters
        String location = request.getParameter("location");
        String radius = request.getParameter("radius");
        String serviceType = request.getParameter("service-type");

        if (location != null) {
            location = location.trim();
        } else {
            location = "";
        }

        // Just for debugging, you can log what user entered
        System.out.println("Location: " + location);
        System.out.println("Radius: " + radius);
        System.out.println("Service Type: " + serviceType);

        // Simple location-based redirection
        if (location.equalsIgnoreCase("Beed")) {
            response.sendRedirect("beedservices.html");
        } else if (location.equalsIgnoreCase("Nashik")) {
            response.sendRedirect("nashikservices.html");
        } else if (location.equalsIgnoreCase("Pune")) {
            response.sendRedirect("puneservices.html");
        } else if (location.equalsIgnoreCase("SambhajiNagar")) {
            response.sendRedirect("sambhajinagarservices.html");
        } else {
            response.sendRedirect("RRhomepage.jsp?message=Sorry, RoadRescue is not connected to that city!");
        }
    }
}
