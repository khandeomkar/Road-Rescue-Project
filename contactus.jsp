<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Garage Contact</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; color: #333; line-height: 1.6; }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
        header .container { max-width: 100%; padding: 0 10px; }
        header { background-color: #1e40af; color: white; padding: 2px 0; width: 100%; position: fixed; top: 0; left: 0; right: 0; z-index: 1000; }
        .header-content { display: flex; justify-content: space-between; align-items: center; width: 100%; padding-right: 40px; }
        .navbar { display: flex; align-items: center; }
        .logo { display: flex; align-items: center; gap: 4px; }
        .logo-image { width: 135px; height: 65px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .logo-image img { width: 100%; height: 100%; object-fit: contain; }
        .logo h1 { font: bold 24px/1 Arial, sans-serif; letter-spacing: 1px; margin: 0; white-space: nowrap; }
        .logo h1 span { color: #93c5fd; }
        .right-section { display: flex; align-items: center; gap: 30px; margin-right: 20px; }
        nav { display: flex; gap: 25px; }
        nav a { color: white; text-decoration: none; font: 500 16px Arial, sans-serif; position: relative; padding: 10px 18px; border-radius: 25px; transition: all 0.3s ease; overflow: hidden; }
        nav a::before { content: ''; position: absolute; top: 50%; left: 50%; width: 0; height: 0; background-color: rgba(255, 255, 255, 0.1); border-radius: 50%; transform: translate(-50%, -50%); transition: all 0.4s ease; z-index: -1; }
        nav a:hover { color: #e2e8f0; transform: translateY(-1px); box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15); }
        nav a:hover::before { width: 80px; height: 80px; background-color: rgba(255, 255, 255, 0.08); }
        nav a::after { content: ''; position: absolute; top: 50%; left: 50%; width: 0; height: 0; background: linear-gradient(45deg, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.03)); border-radius: 50%; transform: translate(-50%, -50%); transition: all 0.5s ease; z-index: -1; }
        nav a:active::after { width: 100px; height: 100px; }
        .profile-container { position: relative; }
        .profile-icon { display: flex; align-items: center; justify-content: center; width: 45px; height: 45px; background-color: #4d89c5; border-radius: 50%; cursor: pointer; border: 2px solid white; transition: all 0.3s ease; }
        .profile-icon:hover { background-color: #3b82f6; transform: scale(1.05); box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2); }
        .profile-icon i { font-size: 22px; color: white; transition: all 0.3s ease; }
        .profile-icon:hover i { transform: rotate(360deg); }
        .dropdown-menu { position: absolute; top: 60px; left: 50%; transform: translateX(-50%); background-color: white; border-radius: 5px; border: 1px solid #ccc; min-width: 200px; display: none; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15); }
        .dropdown-menu.show { display: block; }
        @keyframes fadeInDown { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        .dropdown-item { display: flex; align-items: center; padding: 12px 16px; border-bottom: 1px solid #f0f0f0; cursor: pointer; transition: all 0.3s ease; position: relative; overflow: hidden; }
        .dropdown-item:last-child { border-bottom: none; }
        .dropdown-item::before { content: ''; position: absolute; left: -100%; top: 0; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(30, 64, 175, 0.08), transparent); transition: left 0.5s ease; }
        .dropdown-item:hover::before { left: 100%; }
        .dropdown-item:hover { background-color: #f8fafc; transform: translateX(5px); }
        .dropdown-item i { font-size: 18px; color: #4d89c5; margin-right: 12px; transition: all 0.3s ease; }
        .dropdown-item:hover i { transform: scale(1.2); color: #1e40af; }
        .dropdown-item a { color: #333; text-decoration: none; font: 500 14px Arial, sans-serif; transition: all 0.3s ease; }
        .dropdown-item:hover a { color: #1e40af; }
        .main-content { margin-top: 75px; padding: 10px 0; }
        .contact-section { background-color: white; border-radius: 8px; margin: 10px auto; overflow: hidden; }
        .contact-header { color: white; padding: 60px 20px; text-align: center; background: linear-gradient(135deg, #1e3c72, #2a5298); }
        .contact-image { max-width: 280px; max-height: 180px; width: auto; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.2); margin: 0 auto 15px auto; object-fit: contain; display: block; }
        .contact-title { font: 800 clamp(2.5rem, 6vw, 4.5rem)/1 Arial, sans-serif; letter-spacing: -1px; color: white; margin-bottom: 0.5rem; text-align: center; }
        .contact-header p { font-size: 18px; margin: 0 0 15px 0; opacity: 0.9; }
        .contact-content { display: flex; padding: 25px; }
        .contact-info { width: 50%; padding: 10px; }
        .contact-form { width: 50%; padding: 10px; }
        .info-item { margin-bottom: 20px; display: flex; align-items: flex-start; }
        .info-item:first-child { margin-bottom: 35px; }
        .info-icon { width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px; color: white; font: bold 18px Arial, sans-serif; box-shadow: 0 2px 8px rgba(220, 38, 38, 0.3); background: linear-gradient(135deg, #dc2626, #b91c1c); }
        .info-text h3 { font-size: 20px; margin-bottom: 5px; color: #1e3c72; }
        .info-text p { color: #666; margin: 0; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 6px; font-weight: bold; color: #444; }
        .required-star { color: red; font-size: 10px; }
        input, textarea { width: 100%; padding: 14px; border: 2px solid #e2e8f0; border-radius: 6px; font: 16px Arial, sans-serif; transition: border-color 0.3s ease; }
        input:focus, textarea:focus { outline: none; border-color: #2a5298; box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1); }
        textarea { height: 140px; resize: vertical; }
        .submit-btn { background: linear-gradient(135deg, #1e3c72, #2a5298); color: white; border: none; padding: 14px 28px; font: bold 16px Arial, sans-serif; border-radius: 6px; cursor: pointer; box-shadow: 0 4px 12px rgba(30, 60, 114, 0.3); transition: all 0.3s ease; }
        .submit-btn:hover { background: linear-gradient(135deg, #2a5298, #1e3c72); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(30, 60, 114, 0.4); }
        .business-hours { margin-top: 20px; padding: 15px; background: linear-gradient(135deg, #f8fafc, #e2e8f0); border-radius: 8px; border: 1px solid #cbd5e1; }
        .business-hours h3 { margin-bottom: 10px; color: #1e3c72; font-size: 22px; }
        .hours-table { width: 100%; }
        .hours-table td { padding: 3px 0; }
        .day { font-weight: bold; width: 50%; }
        .demo-notice { background: linear-gradient(135deg, #fef2f2, #fee2e2); padding: 12px; border-radius: 4px; margin-top: 12px; border-left: 4px solid #dc2626; border: 1px solid #fecaca; }
        footer { background: #374151; color: white; padding: 30px 0; }
        .footer-content { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 25px; }
        .footer-section h4 { font-size: 20px; margin-bottom: 12px; }
        .footer-section p, .footer-section a { color: #d1d5db; text-decoration: none; margin-bottom: 6px; display: block; }
        .footer-section a:hover { color: white; }
        .social-links { display: flex; gap: 12px; margin-top: 12px; }
        .social-links a { font-size: 24px; color: #d1d5db; transition: color 0.3s; }
        .social-links a:hover { color: white; }
        .footer-bottom { text-align: center; margin-top: 25px; padding-top: 15px; border-top: 1px solid #4b5563; color: #9ca3af; }
        .back-home-btn { display: inline-flex; align-items: center; gap: 8px; padding: 12px 24px; background: linear-gradient(135deg, #1e3c72, #2a5298); color: white; text-decoration: none; border-radius: 25px; font: 500 16px Arial, sans-serif; border: 2px solid rgba(255, 255, 255, 0.2); box-shadow: 0 4px 15px rgba(30, 60, 114, 0.3); transition: all 0.3s ease; position: relative; overflow: hidden; }
        .back-home-btn::before { content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent); transition: left 0.5s ease; }
        .back-home-btn:hover { background: linear-gradient(135deg, #2a5298, #3b82f6); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(30, 60, 114, 0.4); border-color: rgba(255, 255, 255, 0.3); }
        .back-home-btn:hover::before { left: 100%; }
        .back-home-btn:active { transform: translateY(0px); box-shadow: 0 2px 10px rgba(30, 60, 114, 0.3); }
        .back-home-btn i { font-size: 18px; transition: transform 0.3s ease; }
        .back-home-btn:hover i { transform: scale(1.1); }
        h1.medium-headline { font: 800 clamp(1.3rem, 2.5vw, 2.4rem)/1.2 Arial, sans-serif; letter-spacing: -0.02em; color: #1e3c72; display: inline-block; padding: 0.2em 0.4em; border-radius: 8px; background: linear-gradient(135deg, #e6f3ff, #f0f8ff); box-shadow: 0 2px 8px rgba(30, 60, 114, 0.1); margin: 0; }
        .styled-text { font: 600 1.05rem/1.7 Arial, sans-serif; color: #2d3748; letter-spacing: 0.4px; text-shadow: 0 1px 3px rgba(0,0,0,0.1); max-width: 520px; text-align: left; margin-top: 20px; position: relative; padding: 15px 20px; background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%); border-radius: 12px; border-left: 4px solid #1e3c72; box-shadow: 0 4px 15px rgba(30, 60, 114, 0.08); transition: all 0.3s ease; }
        .styled-text::before { content: ''; position: absolute; top: 0; left: 0; right: 0; height: 2px; background: linear-gradient(90deg, #1e3c72, #2a5298, #93c5fd); border-radius: 12px 12px 0 0; }
        .styled-text:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(30, 60, 114, 0.12); background: linear-gradient(135deg, #ffffff 0%, #f1f5f9 100%); }

        @media (max-width: 768px) {
            .container { padding: 0 10px; }
            header { padding: 8px 0; }
            .header-content { flex-direction: column; gap: 8px; padding-right: 10px; }
            .navbar { width: 100%; justify-content: center; order: 1; }
            .logo { gap: 4px; }
            .logo-image { width: 40px; height: 40px; }
            .logo h1 { font-size: 18px; }
            .right-section { width: 100%; flex-direction: column; gap: 8px; align-items: center; margin-right: 0; order: 2; }
            nav { gap: 10px; flex-wrap: wrap; justify-content: center; }
            nav a { font-size: 13px; padding: 6px 12px; }
            nav a:hover::before { width: 60px; height: 60px; }
            .profile-icon { width: 35px; height: 35px; }
            .profile-icon i { font-size: 18px; }
            .dropdown-menu { top: 45px; left: 50%; transform: translateX(-50%); min-width: 160px; }
            .dropdown-item { padding: 8px 12px; }
            .dropdown-item a { font-size: 12px; }
            .main-content { margin-top: 120px; padding: 5px 0; }
            .contact-content { flex-direction: column; padding: 15px; }
            .contact-info, .contact-form { width: 100%; padding: 5px; }
            .contact-header { padding: 30px 15px; }
            .contact-image { max-width: 200px; max-height: 120px; }
            .contact-title { font-size: clamp(1.8rem, 5vw, 2.5rem); }
            .contact-header p { font-size: 14px; }
            .back-home-btn { padding: 8px 16px; font-size: 14px; gap: 6px; }
            .info-item { margin-bottom: 15px; flex-direction: column; align-items: flex-start; }
            .info-item:first-child { margin-bottom: 25px; }
            .info-icon { width: 35px; height: 35px; font-size: 16px; margin-right: 0; margin-bottom: 8px; }
            .info-text h3 { font-size: 18px; }
            .info-text p { font-size: 14px; }
            h1.medium-headline { font-size: clamp(1.1rem, 4vw, 1.8rem); padding: 0.2em 0.3em; }
            .styled-text { font-size: 0.9rem; padding: 12px 15px; max-width: 100%; margin-top: 15px; }
            .business-hours { padding: 12px; margin-top: 15px; }
            .business-hours h3 { font-size: 18px; }
            .form-group { margin-bottom: 15px; }
            label { font-size: 14px; margin-bottom: 4px; }
            input, textarea { padding: 12px; font-size: 14px; }
            textarea { height: 100px; }
            .submit-btn { padding: 12px 20px; font-size: 14px; width: 100%; }
            footer { padding: 20px 0; }
            .footer-content { grid-template-columns: 1fr; gap: 20px; }
            .footer-section h4 { font-size: 18px; }
            .footer-section p, .footer-section a { font-size: 14px; }
            .social-links a { font-size: 20px; }
        }

        @media (min-width: 769px) {
            .container { padding: 0 20px; }
            header { padding: 4px 0; }
            .header-content { display: flex; justify-content: space-between; align-items: center; padding-right: 40px; flex-direction: row; }
            .navbar { display: flex; align-items: center; }
            .logo { gap: 4px; }
            .logo-image { width: 135px; height: 65px; }
            .logo h1 { font-size: 24px; }
            .right-section { display: flex; align-items: center; gap: 30px; margin-right: 20px; flex-direction: row; }
            nav { display: flex; gap: 25px; }
            nav a { font-size: 16px; padding: 10px 18px; }
            .profile-icon { width: 45px; height: 45px; }
            .profile-icon i { font-size: 22px; }
            .dropdown-menu { top: 60px; min-width: 200px; }
            .dropdown-item { padding: 12px 16px; }
            .dropdown-item a { font-size: 14px; }
            .main-content { margin-top: 75px; padding: 10px 0; }
            .contact-content { display: flex; flex-direction: row; padding: 25px; }
            .contact-info, .contact-form { width: 50%; padding: 10px; }
            .contact-header { padding: 60px 20px; }
            .contact-image { max-width: 280px; max-height: 180px; }
            .back-home-btn { padding: 12px 24px; font-size: 16px; }
            .info-item { flex-direction: row; align-items: flex-start; }
            .info-icon { width: 40px; height: 40px; font-size: 18px; margin-right: 15px; margin-bottom: 0; }
            .styled-text { max-width: 520px; font-size: 1.05rem; padding: 15px 20px; }
            .submit-btn { width: auto; padding: 14px 28px; font-size: 16px; }
            footer { padding: 30px 0; }
            .footer-content { grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 25px; }
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
                                <a href="profile.html">Account</a>
                            </div>
                            <div class="dropdown-item">
                                <i class='bx bx-crown'></i>
                                <a href="login.jsp">Admin</a>
                            </div>
                            <div class="dropdown-item">
                                <i class='bx bx-log-out'></i>
                                <a href="AAintropage.jsp">Sign Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="main-content">
        <div class="container">
            <div class="contact-section">
                <div class="contact-header">
                    <img src="images/RRcontact.png" alt="RoadRescue Contact" class="contact-image">
                    <h1 class="contact-title">Contact</h1>
                    <p>Need our help! Feel free to reach out to us anytime.</p>
                    <a href="RRhomepage.jsp" class="back-home-btn">
                        <i class='bx bx-home'></i>
                        Back to Home
                    </a>
                </div>
                
                <div class="contact-content">
                    <div class="contact-info">
                        <div class="info-item">
                            <div class="info-text">
                                <h1 id="get-in-touch-medium" class="medium-headline">Get In Touch</h1>
                                <p class="styled-text">
                                    Have questions or need roadside assistance? We're here to help!
                                    Fill out the contact form and our team will respond within 24 hours.
                                    Your safety on the road is our top priority.
                                </p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon"><i class='bx bx-envelope'></i></div>
                            <div class="info-text">
                                <h3>Contact us</h3>
                                <p>8080XXXXXX</p>
                                <p>info@RoadRescue.com</p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon"><i class='bx bx-map'></i></div>
                            <div class="info-text">
                                <h3>Address</h3>
                                <p>123 Highway Road<br>Nashik </p>
                            </div>
                        </div>
                        
                        <div class="business-hours">
                            <h3>Business Hours</h3>
                            <table class="hours-table">
                                <tr>
                                    <td class="day">Monday - Sunday:</td>
                                    <td>12:00 AM - 12:00 PM</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div class="contact-form">
                        <form id="contactForm" action ="contactus" method="post" onsubmit="submitForm(event)">
                            <div class="form-group">
                                <label for="name">Your Name <span class="required-star">★</span></label>
                                <input type="text" id="name" name="name" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email Address <span class="required-star">★</span></label>
                                <input type="text" id="email" name="email" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Phone Number <span class="required-star">★</span></label>
                                <input type="text" id="phone" name="phone">
                            </div>
                            
                            <div class="form-group">
                                <label for="message">Message <span class="required-star">★</span></label>
                                <textarea id="message" name="message" required></textarea>
                            </div>
                            
                            <button  class="submit-btn">Submit Request</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
                    <p>Phone: +918080XXXXXX</p>
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

    window.onload = function() {
        const params = new URLSearchParams(window.location.search);
        if (params.get("success") === "true") {
            alert("Submitted Successfully!");
        } else if (params.get("success") === "false") {
            alert("Submission Failed. Please try again.");
        }
    }
</script>

    
</body>
</html>