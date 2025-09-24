package com.RoadRescueProject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/GarageRegistrationServlet")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 2MB max file size
public class RRjoinus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/roadrescue";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Khande@123"; // change to your MySQL password

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("joinus.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // === Get form parameters ===
            String businessName = request.getParameter("businessName");
            String establishedYear = request.getParameter("establishedYear");
            String businessType = request.getParameter("businessType");
            String ownerName = request.getParameter("ownerName");
            String mobile = request.getParameter("mobile");
            String alternateMobile = request.getParameter("alternateMobile");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String landmark = request.getParameter("landmark");
            String openTime = request.getParameter("openTime");
            String closeTime = request.getParameter("closeTime");
            String weeklyOff = request.getParameter("weeklyOff");
            String description = request.getParameter("description");

            // Services
            String[] services = request.getParameterValues("services");
            String servicesString = services != null ? String.join(",", services) : "";

            // Payments
            String[] payments = request.getParameterValues("payments");
            String paymentsString = payments != null ? String.join(",", payments) : "";

            // === File Upload Handling ===
            String uploadPath = "C:/roadrescue-uploads/garage-documents/";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Shop License
            Part shopLicensePart = request.getPart("shopLicense");
            String shopLicenseFileName = null;
            if (shopLicensePart != null && shopLicensePart.getSize() > 0) {
                shopLicenseFileName = System.currentTimeMillis() + "_shop_" + shopLicensePart.getSubmittedFileName();
                shopLicensePart.write(uploadPath + shopLicenseFileName);
            }

            // Owner ID
            Part ownerIDPart = request.getPart("ownerID");
            String ownerIDFileName = null;
            if (ownerIDPart != null && ownerIDPart.getSize() > 0) {
                ownerIDFileName = System.currentTimeMillis() + "_id_" + ownerIDPart.getSubmittedFileName();
                ownerIDPart.write(uploadPath + ownerIDFileName);
            }

            // Garage Photos
            Collection<Part> garagePhotosParts = request.getParts();
            List<String> garagePhotoFileNames = new ArrayList<>();
            for (Part part : garagePhotosParts) {
                if ("garagePhotos".equals(part.getName()) && part.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_photo_" + part.getSubmittedFileName();
                    part.write(uploadPath + fileName);
                    garagePhotoFileNames.add(fileName);
                }
            }

            String shopLicensePath = shopLicenseFileName != null ? uploadPath + shopLicenseFileName : null;
            String ownerIDPath = ownerIDFileName != null ? uploadPath + ownerIDFileName : null;
            String garagePhotosPath = String.join(",", garagePhotoFileNames);

            // === Database Insert ===
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {

                String insertQuery = "INSERT INTO garage_registrations (business_name, established_year, " +
                        "business_type, owner_name, mobile, alternate_mobile, email, address, city, state, " +
                        "pincode, landmark, open_time, close_time, weekly_off, services, payment_methods, " +
                        "description, shop_license, owner_id, garage_photos, registration_date, status) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), 'PENDING')";

                try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                    pstmt.setString(1, businessName);

                    // Handle established year
                    if (establishedYear != null && !establishedYear.trim().isEmpty()) {
                        try {
                            pstmt.setInt(2, Integer.parseInt(establishedYear));
                        } catch (NumberFormatException e) {
                            pstmt.setNull(2, java.sql.Types.INTEGER);
                        }
                    } else {
                        pstmt.setNull(2, java.sql.Types.INTEGER);
                    }

                    pstmt.setString(3, businessType);
                    pstmt.setString(4, ownerName);
                    pstmt.setString(5, mobile);
                    pstmt.setString(6, alternateMobile);
                    pstmt.setString(7, email);
                    pstmt.setString(8, address);
                    pstmt.setString(9, city);
                    pstmt.setString(10, state);
                    pstmt.setString(11, pincode);
                    pstmt.setString(12, landmark);
                    pstmt.setString(13, openTime);
                    pstmt.setString(14, closeTime);
                    pstmt.setString(15, weeklyOff);
                    pstmt.setString(16, servicesString);
                    pstmt.setString(17, paymentsString);
                    pstmt.setString(18, description);
                    pstmt.setString(19, shopLicensePath);
                    pstmt.setString(20, ownerIDPath);
                    pstmt.setString(21, garagePhotosPath);

                    int result = pstmt.executeUpdate();

                    if (result > 0) {
                        request.setAttribute("successMessage",
                                "Registration successful! We will contact you soon for verification.");
                    } else {
                        request.setAttribute("errorMessage",
                                "Registration failed. Please try again.");
                    }
                    request.getRequestDispatcher("joinus.jsp").forward(request, response);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                if (e.getMessage().contains("Duplicate entry")) {
                    request.setAttribute("errorMessage",
                            "Email or mobile number already exists. Please use different details.");
                } else {
                    request.setAttribute("errorMessage",
                            "Database error occurred. Please try again later.");
                }
                request.getRequestDispatcher("joinus.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database driver not found.");
            request.getRequestDispatcher("joinus.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("joinus.jsp").forward(request, response);
        }
    }
}
