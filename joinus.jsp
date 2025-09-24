<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RoadRescue - Garage Registration</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font: normal 16px/1.6 Arial, sans-serif; background: #f4f4f4; padding-top: 80px; }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
        
        /* Header Styles */
        header .container { max-width: 100%; padding: 0 10px; }
        header { background: #1e40af; color: white; padding: 2px 0; width: 100%; position: fixed; top: 0; left: 0; right: 0; z-index: 1000; }
        .header-content { display: flex; justify-content: space-between; align-items: center; width: 100%; padding-right: 40px; }
        .navbar { display: flex; align-items: center; }
        .logo { display: flex; align-items: center; gap: 4px; }
        .logo-image { width: 135px; height: 65px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .logo-image img { width: 100%; height: 100%; object-fit: contain; }
        .logo-placeholder { width: 135px; height: 65px; background: linear-gradient(135deg, #3b82f6, #1e40af); border-radius: 8px; display: flex; align-items: center; justify-content: center; color: white; font: bold 12px Arial, sans-serif; }
        .logo h1 { font: bold 24px/1 Arial, sans-serif; letter-spacing: 1px; margin: 0; white-space: nowrap; color: white; }
        .logo h1 span { color: #93c5fd; }
        .right-section { display: flex; align-items: center; gap: 30px; margin-right: 20px; }
        nav { display: flex; gap: 25px; }
        nav a { color: white; text-decoration: none; font: 500 16px Arial, sans-serif; position: relative; padding: 10px 18px; border-radius: 25px; transition: all 0.3s ease; overflow: hidden; }
        nav a::before { content: ''; position: absolute; top: 50%; left: 50%; width: 0; height: 0; background: rgba(255, 255, 255, 0.1); border-radius: 50%; transform: translate(-50%, -50%); transition: all 0.4s ease; z-index: -1; }
        nav a:hover { color: #e2e8f0; transform: translateY(-1px); box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15); text-decoration: none; }
        nav a:hover::before { width: 80px; height: 80px; background: rgba(255, 255, 255, 0.08); }
        nav a::after { content: ''; position: absolute; top: 50%; left: 50%; width: 0; height: 0; background: linear-gradient(45deg, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.03)); border-radius: 50%; transform: translate(-50%, -50%); transition: all 0.5s ease; z-index: -1; }
        nav a:active::after { width: 100px; height: 100px; }
        .profile-container { position: relative; }
        .profile-icon { display: flex; align-items: center; justify-content: center; width: 45px; height: 45px; background: #4d89c5; border: 2px solid white; border-radius: 50%; cursor: pointer; transition: all 0.3s ease; }
        .profile-icon:hover { background: #3b82f6; transform: scale(1.05); box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2); }
        .profile-icon i { font-size: 22px; color: white; transition: all 0.3s ease; }
        .profile-icon:hover i { transform: rotate(360deg); }
        .dropdown-menu { position: absolute; top: 60px; left: 50%; transform: translateX(-50%); background: white; border: 1px solid #ccc; border-radius: 5px; min-width: 200px; display: none; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15); }
        .dropdown-menu.show { display: block; animation: fadeInDown 0.3s ease-out; }
        @keyframes fadeInDown { from { opacity: 0; transform: translateX(-50%) translateY(-10px); } to { opacity: 1; transform: translateX(-50%) translateY(0); } }
        .dropdown-item { display: flex; align-items: center; padding: 12px 16px; border-bottom: 1px solid #f0f0f0; cursor: pointer; transition: all 0.3s ease; position: relative; overflow: hidden; }
        .dropdown-item:last-child { border-bottom: none; }
        .dropdown-item::before { content: ''; position: absolute; left: -100%; top: 0; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(30, 64, 175, 0.08), transparent); transition: left 0.5s ease; }
        .dropdown-item:hover::before { left: 100%; }
        .dropdown-item:hover { background: #f8fafc; transform: translateX(5px); }
        .dropdown-item i { font-size: 18px; color: #4d89c5; margin-right: 12px; transition: all 0.3s ease; }
        .dropdown-item:hover i { transform: scale(1.2); color: #1e40af; }
        .dropdown-item a { color: #333; text-decoration: none; font: 500 14px Arial, sans-serif; transition: all 0.3s ease; }
        .dropdown-item:hover a { color: #1e40af; }

        /* Main Content */
        .main-container { max-width: 900px; margin: 20px auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0,0,0,0.1); }
        .header-section { text-align: center; margin-bottom: 40px; }
        .header-section h1 { color: #333; font-size: 32px; margin-bottom: 10px; }
        .header-section p { color: #666; font-size: 18px; }
        .section { margin-bottom: 35px; }
        .section-title { font: bold 20px Arial, sans-serif; color: #2c3e50; margin-bottom: 20px; border-bottom: 2px solid #eee; padding-bottom: 8px; }
        .form-row { display: flex; margin-bottom: 20px; gap: 20px; flex-wrap: wrap; }
        .form-field { flex: 1; min-width: 260px; }
        .form-field.full { flex: 2; }
        .label { display: block; margin-bottom: 8px; font-weight: bold; color: #555; }
        .required { color: red; }
        .input-box { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 5px; font-size: 16px; box-sizing: border-box; }
        .input-box:focus { border-color: #3498db; outline: none; }
        .textarea-box { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 5px; font-size: 16px; box-sizing: border-box; height: 100px; resize: vertical; }
        .select-box { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 5px; font-size: 16px; box-sizing: border-box; background: white; }
        .checkbox-area { display: flex; flex-wrap: wrap; gap: 15px; margin-top: 10px; }
        .checkbox-item { display: flex; align-items: center; min-width: 180px; }
        .checkbox-item input { margin-right: 8px; transform: scale(1.2); }
        .time-section { display: flex; align-items: center; gap: 15px; }
        .time-select { width: 140px; padding: 10px; border: 2px solid #ddd; border-radius: 5px; font-size: 16px; }
        .info-box { background: #e8f4fd; border-left: 4px solid #3498db; padding: 15px; margin: 15px 0; border-radius: 5px; }
        .file-input { width: 100%; padding: 10px; border: 2px solid #ddd; border-radius: 5px; background: white; box-sizing: border-box; }
        .hint-text { font-size: 13px; color: #777; margin-top: 5px; }
        .button-section { text-align: center; margin-top: 40px; display: flex; justify-content: space-between; gap: 16px; flex-wrap: wrap; }
        .btn { padding: 15px 30px; font: bold 18px Arial, sans-serif; border: none; border-radius: 5px; cursor: pointer; }
        .btn-submit { background: #27ae60; color: white; }
        .btn-submit:hover { background: #229954; }
        .btn-reset { background: #95a5a6; color: white; }
        .btn-reset:hover { background: #7f8c8d; }
        .success-msg { display: none; background: #d4edda; color: #155724; padding: 20px; text-align: center; border-radius: 5px; margin-bottom: 20px; font-size: 18px; border: 1px solid #c3e6cb; }
        .error-msg { display: block; background: #f8d7da; color: #721c24; padding: 20px; text-align: center; border-radius: 5px; margin-bottom: 20px; font-size: 18px; border: 1px solid #f5c6cb; }
   
        a { color: #3498db; text-decoration: none; }
        a:hover { text-decoration: none; }

        /* Footer */
        footer { background: #374151; color: white; padding: 40px 0; margin-top: 40px; }
        .footer-content { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; }
        .footer-section h4 { font-size: 20px; margin-bottom: 15px; }
        .footer-section p, .footer-section a { color: #d1d5db; text-decoration: none; margin-bottom: 8px; display: block; }
        .footer-section a:hover { color: white; }
        .social-links { display: flex; gap: 15px; margin-top: 15px; }
        .social-links a { font-size: 24px; color: #d1d5db; transition: color 0.3s; }
        .social-links a:hover { color: white; }
        .footer-bottom { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid #4b5563; color: #9ca3af; }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            body { padding-top: 160px; }
            header .container { padding: 0 8px; }
            header { padding: 12px 0; }
            .header-content { flex-direction: column; gap: 12px; padding-right: 8px; }
            .navbar { width: 100%; justify-content: center; order: 1; }
            .logo { gap: 6px; }
            .logo-image, .logo-placeholder { width: 45px; height: 45px; }
            .logo h1 { font-size: 18px; }
            .right-section { width: 100%; flex-direction: column; gap: 8px; align-items: center; margin-right: 0; order: 2; }
            nav { gap: 8px; flex-wrap: wrap; justify-content: center; }
            nav a { font-size: 13px; padding: 8px 12px; }
            nav a:hover::before { width: 50px; height: 50px; }
            .profile-icon { width: 38px; height: 38px; }
            .profile-icon i { font-size: 18px; }
            .dropdown-menu { top: 48px; min-width: 160px; }
            .dropdown-item { padding: 8px 12px; }
            .dropdown-item a { font-size: 12px; }
            .main-container { padding: 15px 12px; margin: 8px; border-radius: 8px; }
            .header-section h1 { font-size: 22px; margin-bottom: 8px; }
            .header-section p { font-size: 14px; }
            .section-title { font-size: 18px; margin-bottom: 15px; }
            .form-row { flex-direction: column; gap: 12px; margin-bottom: 15px; }
            .input-box, .select-box, .textarea-box { padding: 14px 12px; font-size: 16px; border-radius: 6px; }
            .checkbox-area { flex-direction: column; gap: 12px; margin-top: 12px; }
            .checkbox-item { min-width: auto; width: 100%; padding: 8px 0; }
            .checkbox-item input { transform: scale(1.4); margin-right: 12px; }
            .time-section { flex-direction: column; gap: 12px; align-items: stretch; }
            .time-select { width: 100%; padding: 14px 12px; font-size: 16px; }
            .file-input { padding: 12px; font-size: 14px; }
            .button-section { flex-direction: column; gap: 12px; margin-top: 30px; }
            .btn { padding: 16px 25px; font-size: 16px; width: 100%; }
            .terms-section { margin: 20px 0; flex-direction: column; align-items: flex-start; gap: 8px; }
            .terms-section input { transform: scale(1.4); margin-right: 0; margin-bottom: 8px; }
            .footer-content { grid-template-columns: 1fr; gap: 20px; text-align: center; }
            .footer-section { padding: 0 10px; }
        }

        /* Desktop */
        @media (min-width: 769px) {
            body { padding-top: 80px; }
            header .container { padding: 0 20px; }
            header { padding: 4px 0; }
            .header-content { display: flex; justify-content: space-between; align-items: center; padding-right: 40px; flex-direction: row; }
            .navbar { display: flex; align-items: center; }
            .logo { gap: 4px; }
            .logo-image, .logo-placeholder { width: 135px; height: 65px; }
            .logo h1 { font-size: 24px; }
            .right-section { display: flex; align-items: center; gap: 30px; margin-right: 20px; flex-direction: row; }
            nav { display: flex; gap: 25px; }
            nav a { font-size: 16px; padding: 10px 18px; }
            .profile-icon { width: 45px; height: 45px; }
            .profile-icon i { font-size: 22px; }
            .dropdown-menu { top: 60px; min-width: 200px; }
            .dropdown-item { padding: 12px 16px; }
            .dropdown-item a { font-size: 14px; }
            .main-container { max-width: 900px; padding: 30px; }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="navbar">
                    <div class="logo">
                        <div class="logo-image">
                             <img src="images/RRlogo.png" alt="RoadRescue Logo"> 
                        </div>
                        <h1>ROAD<span>RESCUE</span></h1>
                    </div>
                </div>
                <div class="right-section">
                    <nav>
                        <a href="RRhomepage.jsp">Home</a>
                        <a href="Aboutus.html">About Us</a>
                        <a href="contactus.jsp">Support</a>
                        <a href="joinus.jsp">Add Garage</a>
                    </nav>
                    <div class="profile-container">
                        <div class="profile-icon" onclick="toggleDropdown()">
                            <i class='bx bx-user'></i>
                        </div>
                        <div class="dropdown-menu" id="dropdown">
                            <div class="dropdown-item">
                                <i class='bx bx-user-circle'></i>
                                <a href="profile.jsp">Account</a>
                            </div>
                            <div class="dropdown-item">
                                <i class='bx bx-crown'></i>
                                <a href="login.jsp">Admin</a>
                            </div>
                            <div class="dropdown-item">
                                <i class='bx bx-log-out'></i>
                                <a href="AAintropage.html">Sign Out</a>
                            </div>
                        </div>
                </div>
                </div>
            </div>
        </div>
    </header>

    <div class="main-container">
        <div class="header-section">
            <h1>RoadRescue - Garage Registration</h1>
            <p>Join our network and connect with more customers</p>
        </div>
        
        <!-- Display success message -->
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="success-msg" style="display: block;">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>
        
        <!-- Display error message -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-msg">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <form id="registrationForm" action="GarageRegistrationServlet" method="post" enctype="multipart/form-data" novalidate>
            <!-- Business Information -->
            <div class="section">
                <h2 class="section-title">Business Information</h2>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">Business Name <span class="required">*</span></label>
                        <input type="text" class="input-box" name="businessName" id="businessName" maxlength="120" required
                               value="<%= request.getParameter("businessName") != null ? request.getParameter("businessName") : "" %>">
                    </div>
                    
                    <div class="form-field">
                        <label class="label">Year Established</label>
                        <input type="number" class="input-box" name="establishedYear" id="establishedYear" min="1950" max="2025"
                               value="<%= request.getParameter("establishedYear") != null ? request.getParameter("establishedYear") : "" %>">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">Business Type</label>
                        <select class="select-box" name="businessType" id="businessType">
                            <option value="">Choose Business Type</option>
                            <option value="sole" <%= "sole".equals(request.getParameter("businessType")) ? "selected" : "" %>>Sole Proprietorship</option>
                            <option value="partnership" <%= "partnership".equals(request.getParameter("businessType")) ? "selected" : "" %>>Partnership</option>
                            <option value="llp" <%= "llp".equals(request.getParameter("businessType")) ? "selected" : "" %>>Limited Liability Partnership</option>
                            <option value="company" <%= "company".equals(request.getParameter("businessType")) ? "selected" : "" %>>Private Company</option>
                        </select>
                    </div>
                </div>
            </div>
            
            <!-- Contact Information -->
            <div class="section">
                <h2 class="section-title">Contact Details</h2>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">Owner Name <span class="required">*</span></label>
                        <input type="text" class="input-box" name="ownerName" id="ownerName" maxlength="120" required
                               value="<%= request.getParameter("ownerName") != null ? request.getParameter("ownerName") : "" %>">
                    </div>
                    
                    <div class="form-field">
                        <label class="label">Mobile Number <span class="required">*</span></label>
                        <input type="tel" class="input-box" name="mobile" id="mobile" inputmode="numeric" pattern="^[0-9]{10}$" maxlength="10" required
                               title="Enter a 10 digit mobile number"
                               value="<%= request.getParameter("mobile") != null ? request.getParameter("mobile") : "" %>">
                        <div class="hint-text">Enter 10 digit mobile number</div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">Alternate Contact</label>
                        <input type="tel" class="input-box" name="alternateMobile" id="alternateMobile" inputmode="numeric" pattern="^[0-9]{10}$" maxlength="10"
                               title="Enter a 10 digit mobile number"
                               value="<%= request.getParameter("alternateMobile") != null ? request.getParameter("alternateMobile") : "" %>">
                    </div>
                    
                    <div class="form-field">
                        <label class="label">Email Address <span class="required">*</span></label>
                        <input type="email" class="input-box" name="email" id="email" maxlength="150" required
                               value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                    </div>
                </div>
            </div>
            
            <!-- Location Information -->
            <div class="section">
                <h2 class="section-title">Location Details</h2>
                
                <div class="form-row">
                    <div class="form-field full">
                        <label class="label">Complete Address <span class="required">*</span></label>
                        <input type="text" class="input-box" name="address" id="address" maxlength="255" required
                               value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">City <span class="required">*</span></label>
                        <input type="text" class="input-box" name="city" id="city" maxlength="100" required
                               value="<%= request.getParameter("city") != null ? request.getParameter("city") : "" %>">
                    </div>
                    
                    <div class="form-field">
                        <label class="label">State <span class="required">*</span></label>
                        <select class="select-box" name="state" id="state" required>
                            <option value="">Select State</option>
                            <option value="Andhra Pradesh" <%= "Andhra Pradesh".equals(request.getParameter("state")) ? "selected" : "" %>>Andhra Pradesh</option>
                            <option value="Bihar" <%= "Bihar".equals(request.getParameter("state")) ? "selected" : "" %>>Bihar</option>
                            <option value="Gujarat" <%= "Gujarat".equals(request.getParameter("state")) ? "selected" : "" %>>Gujarat</option>
                            <option value="Haryana" <%= "Haryana".equals(request.getParameter("state")) ? "selected" : "" %>>Haryana</option>
                            <option value="Karnataka" <%= "Karnataka".equals(request.getParameter("state")) ? "selected" : "" %>>Karnataka</option>
                            <option value="Kerala" <%= "Kerala".equals(request.getParameter("state")) ? "selected" : "" %>>Kerala</option>
                            <option value="Madhya Pradesh" <%= "Madhya Pradesh".equals(request.getParameter("state")) ? "selected" : "" %>>Madhya Pradesh</option>
                            <option value="Maharashtra" <%= "Maharashtra".equals(request.getParameter("state")) ? "selected" : "" %>>Maharashtra</option>
                            <option value="Punjab" <%= "Punjab".equals(request.getParameter("state")) ? "selected" : "" %>>Punjab</option>
                            <option value="Rajasthan" <%= "Rajasthan".equals(request.getParameter("state")) ? "selected" : "" %>>Rajasthan</option>
                            <option value="Tamil Nadu" <%= "Tamil Nadu".equals(request.getParameter("state")) ? "selected" : "" %>>Tamil Nadu</option>
                            <option value="Uttar Pradesh" <%= "Uttar Pradesh".equals(request.getParameter("state")) ? "selected" : "" %>>Uttar Pradesh</option>
                            <option value="West Bengal" <%= "West Bengal".equals(request.getParameter("state")) ? "selected" : "" %>>West Bengal</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">PIN Code <span class="required">*</span></label>
                        <input type="text" class="input-box" name="pincode" id="pincode" inputmode="numeric" pattern="^[0-9]{6}$" maxlength="6" required
                               title="Enter a 6 digit PIN code"
                               value="<%= request.getParameter("pincode") != null ? request.getParameter("pincode") : "" %>">
                    </div>
                    
                    <div class="form-field">
                        <label class="label">Nearby Landmark</label>
                        <input type="text" class="input-box" name="landmark" id="landmark" maxlength="150"
                               value="<%= request.getParameter("landmark") != null ? request.getParameter("landmark") : "" %>">
                    </div>
                </div>
            </div>
            
            <!-- Business Details -->
            <div class="section">
                <h2 class="section-title">Business Details</h2>
                
                <div class="form-field" style="margin-bottom: 35px;">
                    <label class="label">Services Offered</label>
                    <div class="checkbox-area" style="margin-top: 15px;">
                        <%
                            String[] selectedServices = request.getParameterValues("services");
                            java.util.List<String> servicesList = selectedServices != null ? java.util.Arrays.asList(selectedServices) : new java.util.ArrayList<>();
                        %>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service1" name="services" value="car_repair" <%= servicesList.contains("car_repair") ? "checked" : "" %>>
                            <label for="service1">Car Repair</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service2" name="services" value="bike_service" <%= servicesList.contains("bike_service") ? "checked" : "" %>>
                            <label for="service2">Bike Service</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service3" name="services" value="engine_repair" <%= servicesList.contains("engine_repair") ? "checked" : "" %>>
                            <label for="service3">Engine Repair</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service4" name="services" value="wheel_alignment" <%= servicesList.contains("wheel_alignment") ? "checked" : "" %>>
                            <label for="service4">Wheel Alignment</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service5" name="services" value="oil_change" <%= servicesList.contains("oil_change") ? "checked" : "" %>>
                            <label for="service5">Oil Change</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service6" name="services" value="denting_painting" <%= servicesList.contains("denting_painting") ? "checked" : "" %>>
                            <label for="service6">Denting & Painting</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service7" name="services" value="ac_service" <%= servicesList.contains("ac_service") ? "checked" : "" %>>
                            <label for="service7">AC Service</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="service8" name="services" value="electrical" <%= servicesList.contains("electrical") ? "checked" : "" %>>
                            <label for="service8">Electrical Work</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-row" style="margin-bottom: 35px;">
                    <div class="form-field">
                        <label class="label">Business Hours</label>
                        <div class="time-section">
                            <select class="time-select" name="openTime" id="openTime">
                                <option value="">Opening</option>
                                <option value="06:00" <%= "06:00".equals(request.getParameter("openTime")) ? "selected" : "" %>>06:00 AM</option>
                                <option value="07:00" <%= "07:00".equals(request.getParameter("openTime")) ? "selected" : "" %>>07:00 AM</option>
                                <option value="08:00" <%= "08:00".equals(request.getParameter("openTime")) ? "selected" : "" %>>08:00 AM</option>
                                <option value="09:00" <%= "09:00".equals(request.getParameter("openTime")) ? "selected" : "" %>>09:00 AM</option>
                                <option value="10:00" <%= "10:00".equals(request.getParameter("openTime")) ? "selected" : "" %>>10:00 AM</option>
                            </select>
                            <span>to</span>
                            <select class="time-select" name="closeTime" id="closeTime">
                                <option value="">Closing</option>
                                <option value="17:00" <%= "17:00".equals(request.getParameter("closeTime")) ? "selected" : "" %>>05:00 PM</option>
                                <option value="18:00" <%= "18:00".equals(request.getParameter("closeTime")) ? "selected" : "" %>>06:00 PM</option>
                                <option value="19:00" <%= "19:00".equals(request.getParameter("closeTime")) ? "selected" : "" %>>07:00 PM</option>
                                <option value="20:00" <%= "20:00".equals(request.getParameter("closeTime")) ? "selected" : "" %>>08:00 PM</option>
                                <option value="21:00" <%= "21:00".equals(request.getParameter("closeTime")) ? "selected" : "" %>>09:00 PM</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-field">
                        <label class="label">Weekly Off</label>
                        <select class="select-box" name="weeklyOff" id="weeklyOff">
                            <option value="">Select Day</option>
                            <option value="sunday" <%= "sunday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Sunday</option>
                            <option value="monday" <%= "monday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Monday</option>
                            <option value="tuesday" <%= "tuesday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Tuesday</option>
                            <option value="wednesday" <%= "wednesday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Wednesday</option>
                            <option value="thursday" <%= "thursday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Thursday</option>
                            <option value="friday" <%= "friday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Friday</option>
                            <option value="saturday" <%= "saturday".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>Saturday</option>
                            <option value="none" <%= "none".equals(request.getParameter("weeklyOff")) ? "selected" : "" %>>No Weekly Off</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-field" style="margin-bottom: 35px;">
                    <label class="label">Payment Methods</label>
                    <div class="checkbox-area" style="margin-top: 15px;">
                        <%
                            String[] selectedPayments = request.getParameterValues("payments");
                            java.util.List<String> paymentsList = selectedPayments != null ? java.util.Arrays.asList(selectedPayments) : new java.util.ArrayList<>();
                        %>
                        <div class="checkbox-item">
                            <input type="checkbox" id="payment1" name="payments" value="cash" <%= paymentsList.contains("cash") ? "checked" : "" %>>
                            <label for="payment1">Cash</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="payment2" name="payments" value="cards" <%= paymentsList.contains("cards") ? "checked" : "" %>>
                            <label for="payment2">Credit/Debit Cards</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="payment3" name="payments" value="upi" <%= paymentsList.contains("upi") ? "checked" : "" %>>
                            <label for="payment3">UPI Payment</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="payment4" name="payments" value="netbanking" <%= paymentsList.contains("netbanking") ? "checked" : "" %>>
                            <label for="payment4">Net Banking</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-field">
                    <label class="label">Business Description</label>
                    <textarea class="textarea-box" name="description" id="description" placeholder="Tell us about your garage, specialties, experience, etc." maxlength="800"><%= request.getParameter("description") != null ? request.getParameter("description") : "" %></textarea>
                </div>
            </div>
            
            <!-- Document Upload -->
            <div class="section">
                <h2 class="section-title">Document Verification</h2>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">Shop License</label>
                        <input type="file" class="file-input" name="shopLicense" id="shopLicense" accept=".pdf,.jpg,.jpeg,.png">
                        <div class="hint-text">Upload shop license (PDF, JPG, PNG - max 2MB)</div>
                    </div>
                    
                    <div class="form-field">
                        <label class="label">Owner ID Proof</label>
                        <input type="file" class="file-input" name="ownerID" id="ownerID" accept=".pdf,.jpg,.jpeg,.png">
                        <div class="hint-text">Aadhar/PAN/License (PDF, JPG, PNG - max 2MB)</div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-field">
                        <label class="label">Garage Photos</label>
                        <input type="file" class="file-input" name="garagePhotos" id="garagePhotos" accept=".jpg,.jpeg,.png" multiple>
                        <div class="hint-text">Upload up to 5 photos (JPG, PNG - each ≤ 2MB)</div>
                    </div>
                </div>
            </div>
            
          
            
            <!-- Submit Buttons -->
            <div class="button-section">
                <button type="button" class="btn btn-reset" onclick="resetForm()">Reset Form</button>
                <button type="submit" class="btn btn-submit">Submit Registration</button>
            </div>
        </form>
    </div>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>RoadRescue</h4>
                    <p>Helping drivers find reliable repair services when they need it most.</p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <a href="RRhomepage.jsp">Home</a>
                    <a href="Aboutus.html">About Us</a>
                    <a href="contactus.jsp">Support</a>
                    <a href="joinus.jsp">Add Garage</a>
                </div>
                <div class="footer-section">
                    <h4>Contact</h4>
                    <p>Email: roderescue@gmail.com</p>
                    <p>Phone: 8080XXXXXX</p>
                    <div class="social-links">
                        <a href="#"><i class='bx bxl-facebook'></i></a>
                        <a href="#"><i class='bx bxl-twitter'></i></a>
                        <a href="#"><i class='bx bxl-youtube'></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 RoadRescue. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('dropdown');
            dropdown.classList.toggle('show');
        }

        window.onclick = function(event) {
            if (!event.target.matches('.profile-icon') && !event.target.matches('.profile-icon i')) {
                const dropdown = document.getElementById('dropdown');
                if (dropdown.classList.contains('show')) {
                    dropdown.classList.remove('show');
                }
            }
        }

        function resetForm() {
            document.getElementById('registrationForm').reset();
        }
        
        // Client-side validation to match server constraints
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            // HTML5 will catch required/patterns. Add file checks & limits here.
            const maxFiles = 5;
            const maxBytes = 2 * 1024 * 1024; // 2MB per @MultipartConfig
            const allowedTypes = ['image/jpeg','image/png','application/pdf'];

            const shop = document.getElementById('shopLicense').files[0];
            const owner = document.getElementById('ownerID').files[0];
            const photos = document.getElementById('garagePhotos').files;

            // helper
            const checkFile = (file, label) => {
                if (!file) return true;
                if (file.size > maxBytes) { alert(label + ' must be ≤ 2MB'); return false; }
                if (!allowedTypes.includes(file.type)) { alert(label + ' must be PDF/JPG/PNG'); return false; }
                return true;
            };

            if (!checkFile(shop, 'Shop License') || !checkFile(owner, 'Owner ID')) {
                e.preventDefault(); return false;
            }

            if (photos.length > maxFiles) {
                alert('Please upload up to ' + maxFiles + ' garage photos.');
                e.preventDefault(); return false;
            }
            for (let i = 0; i < photos.length; i++) {
                const f = photos[i];
                if (f.size > maxBytes) { alert('Each garage photo must be ≤ 2MB'); e.preventDefault(); return false; }
                if (!['image/jpeg','image/png'].includes(f.type)) { alert('Garage photos must be JPG/PNG'); e.preventDefault(); return false; }
            }

            // Basic logical checks
            const year = document.getElementById('establishedYear').value;
            if (year && (parseInt(year, 10) < 1950 || parseInt(year, 10) > 2025)) {
                alert('Year Established must be between 1950 and 2025.');
                e.preventDefault(); return false;
            }

            return true;
        });
    </script>
</body>
</html>
