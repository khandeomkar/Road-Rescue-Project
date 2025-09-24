<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RoadRescue</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<style>

* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); color: #333; line-height: 1.6; }
.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }


header .container { max-width: 100%; padding: 0 10px; }
header { background-color: #1e40af; color: white; padding: 2px 0; width: 100%; position: fixed; top: 0; left: 0; right: 0; z-index: 1000; }
.header-content { display: flex; justify-content: space-between; align-items: center; width: 100%; padding-right: 40px; }
.navbar { display: flex; align-items: center; height: 65px; }
.logo { display: flex; align-items: center; gap: 4px; margin-bottom: 20px; }
.logo-image { width: 135px; height: 65px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.logo-image img { width: 100%; height: 100%; object-fit: contain; margin-bottom: 14px; }
.logo h1 { font: bold 24px/1 Arial, sans-serif; letter-spacing: 1px; margin-bottom: 14px; white-space: nowrap; }
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
.dropdown-item { display: flex; align-items: center; padding: 12px 16px; border-bottom: 1px solid #f0f0f0; cursor: pointer; transition: all 0.3s ease; position: relative; overflow: hidden; }
.dropdown-item:last-child { border-bottom: none; }
.dropdown-item::before { content: ''; position: absolute; left: -100%; top: 0; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(30, 64, 175, 0.08), transparent); transition: left 0.5s ease; }
.dropdown-item:hover::before { left: 100%; }
.dropdown-item:hover { background-color: #f8fafc; transform: translateX(5px); }
.dropdown-item i { font-size: 18px; color: #4d89c5; margin-right: 12px; transition: all 0.3s ease; }
.dropdown-item:hover i { transform: scale(1.2); color: #1e40af; }
.dropdown-item a { color: #333; text-decoration: none; font: 500 14px Arial, sans-serif; transition: all 0.3s ease; }
.dropdown-item:hover a { color: #1e40af; }


.carousel { margin-top: 70px; }
.carousel-item { position: relative; height: 500px; }
.carousel-item img { width: 100%; height: 100%; object-fit: cover; }
.carousel-caption-custom { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: #fff; z-index: 10; background: linear-gradient(135deg, rgba(0, 0, 0, 0.7), rgba(30, 64, 175, 0.5)); padding: 30px; border-radius: 15px; backdrop-filter: blur(8px); border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3); }
.carousel-caption-custom h2 { font: bold 3rem inherit; margin-bottom: 15px; text-align: left; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); }
.carousel-caption-custom p { font-size: 1.2rem; margin-bottom: 20px; text-align: left; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); }

.search-section { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 40px 0; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); position: relative; }
.search-section::before { content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: url('data:image/svg+xml,<svg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><g fill="%23ffffff" fill-opacity="0.05"><circle cx="30" cy="30" r="3"/></g></svg>'); }
.search-container { display: flex; gap: 20px; max-width: 1200px; margin: 0 auto; height: 500px; position: relative; z-index: 1; }
.search-form-container { flex: 1; background: linear-gradient(145deg, #ffffff, #f0f4f8); padding: 30px; border-radius: 15px; display: flex; flex-direction: column; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); border: 1px solid rgba(255, 255, 255, 0.5); }
.search-form-container h3 { font-size: 24px; margin-bottom: 20px; color: #374151; text-align: center; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); }

.form-group { margin-bottom: 20px; }
.form-group label { display: block; margin-bottom: 8px; font-weight: bold; color: #374151; text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.5); }
.form-group input, .form-group select { width: 100%; padding: 12px; border: 2px solid #e2e8f0; border-radius: 8px; font-size: 16px; transition: all 0.3s ease; background: linear-gradient(145deg, #ffffff, #f8fafc); box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05); }
.form-group input:focus, .form-group select:focus { outline: none; border-color: #667eea; box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1), inset 0 2px 4px rgba(0, 0, 0, 0.05); transform: translateY(-1px); }

.btn-secondary { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #fff; padding: 12px 24px; border: none; border-radius: 8px; cursor: pointer; transition: all 0.3s ease; width: 100%; font: bold 16px inherit; box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3); text-transform: uppercase; letter-spacing: 1px; }
.btn-secondary:hover { background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4); }
.btn-secondary:active { transform: translateY(0); box-shadow: 0 2px 10px rgba(102, 126, 234, 0.3); }

.cities-section { padding: 40px 20px; background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%); }
.cities-section h2 { text-align: center; font-size: 32px; margin-bottom: 30px; color: #374151; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); }
.cities-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 25px; max-width: 1200px; margin: 0 auto; }
.city-card { background: linear-gradient(145deg, #ffffff, #f8fafc); border: 1px solid rgba(255, 255, 255, 0.8); border-radius: 15px; overflow: hidden; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1); transition: all 0.3s ease; }
.city-card:hover { transform: translateY(-8px) scale(1.02); box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2); }
.city-card img { width: 100%; height: 180px; object-fit: cover; transition: all 0.3s ease; }
.city-card:hover img { transform: scale(1.05); }
.city-card-content { padding: 25px; background: linear-gradient(145deg, #ffffff, #f8fafc); }
.city-card h3 { font-size: 22px; margin-bottom: 10px; color: #374151; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05); }
.city-card p { color: #6b7280; margin-bottom: 15px; font-size: 14px; line-height: 1.6; }
.city-card-btn { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #fff; padding: 10px 20px; border: none; border-radius: 8px; text-decoration: none; font-size: 14px; transition: all 0.3s ease; display: inline-block; box-shadow: 0 4px 15px rgba(102, 126, 234, 0.2); text-transform: uppercase; font-weight: bold; letter-spacing: 0.5px; }
.city-card-btn:hover { background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%); color: #fff; transform: translateY(-2px); box-shadow: 0 6px 20px rgba(102, 126, 234, 0.3); }

.features { padding: 80px 0; background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); position: relative; }
.features::before { content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: url('data:image/svg+xml,<svg width="80" height="80" viewBox="0 0 80 80" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><g fill="%23ffffff" fill-opacity="0.03"><polygon points="40 0 80 40 40 80 0 40"/></g></svg>'); }
.section-title { text-align: center; margin-bottom: 60px; position: relative; z-index: 1; }
.section-title h2 { font-size: 2.5rem; color: #2c3e50; margin-bottom: 15px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); }
.section-title p { font-size: 1.2rem; color: #666; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05); }
.features-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 40px; position: relative; z-index: 1; }
.feature-card { background: linear-gradient(145deg, #ffffff, #f0f4f8); padding: 40px 30px; border-radius: 20px; text-align: center; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1); transition: all 0.3s ease; border: 1px solid rgba(255, 255, 255, 0.5); position: relative; overflow: hidden; }
.feature-card::before { content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent); transition: left 0.6s ease; }
.feature-card:hover::before { left: 100%; }
.feature-card:hover { transform: translateY(-15px) scale(1.02); box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15); }
.feature-icon { width: 80px; height: 80px; margin: 0 auto 25px; background: linear-gradient(135deg, #667eea, #764ba2); border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3); transition: all 0.3s ease; }
.feature-card:hover .feature-icon { transform: scale(1.1) rotate(360deg); box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4); }
.feature-icon i { font-size: 36px; color: #fff; }
.feature-card h3 { font-size: 1.5rem; color: #2c3e50; margin-bottom: 15px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05); }
.feature-card p { color: #666; line-height: 1.6; }

.how-it-works { padding: 80px 0; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }
.steps-container { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 40px; margin-top: 50px; }
.step { text-align: center; position: relative; background: linear-gradient(145deg, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7)); padding: 30px 20px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); transition: all 0.3s ease; }
.step:hover { transform: translateY(-5px); box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15); }
.step-number { width: 60px; height: 60px; background: linear-gradient(135deg, #ff6b6b, #ee5a24); color: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; font: bold 1.5rem inherit; margin: 0 auto 20px; box-shadow: 0 8px 25px rgba(255, 107, 107, 0.3); transition: all 0.3s ease; }
.step:hover .step-number { transform: scale(1.1); box-shadow: 0 12px 35px rgba(255, 107, 107, 0.4); }
.step h3 { font-size: 1.3rem; color: #2c3e50; margin-bottom: 15px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.05); }
.step p { color: #666; }

.acccontainer { max-width: 100%; width: 100%; padding: 0; margin: 0; }
.faq-header { background: linear-gradient(135deg, #374151 0%, #4b5563 100%); color: #fff; padding: 1rem; text-align: center; margin-bottom: 0; width: 100%; }
.faq-header h1 { font: 600 1.4rem inherit; margin: 0; }
.accordion { border: none; width: 100%; }
.accordion-item { border: none; border-bottom: 1px solid #e9ecef; }
.accordion-item:last-child { border-bottom: none; }
.accordion-button { background: #fff; border: none; padding: 1.5rem 2rem; font-weight: 500; color: #495057; box-shadow: none; width: 100%; }
.accordion-button:not(.collapsed) { background: #f8f9fa; color: #667eea; }
.accordion-button:focus { border: none; box-shadow: 0 0 0 2px rgba(102, 126, 234, .25); }
.accordion-body { padding: 1.5rem 2rem; background: #f8f9fa; color: #6c757d; line-height: 1.6; }
.brand-name { color: #667eea; font-weight: 600; }
.highlight { background: #e3f2fd; padding: .25rem .5rem; border-radius: 4px; color: #1976d2; font-weight: 500; }

footer { background: #374151; color: #fff; padding: 40px 0; }
.footer-content { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; }
.footer-section h4 { font-size: 20px; margin-bottom: 15px; }
.footer-section p, .footer-section a { color: #d1d5db; text-decoration: none; margin-bottom: 8px; display: block; }
.footer-section a:hover { color: #fff; }
.social-links { display: flex; gap: 15px; margin-top: 15px; }
.social-links a { font-size: 24px; color: #d1d5db; transition: color .3s; }
.social-links a:hover { color: #fff; }
.footer-bottom { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid #4b5563; color: #9ca3af; }

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
    .carousel { margin-top: 40px; }
    .carousel-item { height: 300px; }
    .carousel-caption-custom { padding: 20px; }
    .carousel-caption-custom h2 { font-size: 1.8rem; }
    .carousel-caption-custom p { font-size: 1rem; }
    .search-section { padding: 30px 0; }
    .search-container { flex-direction: column; height: auto; gap: 20px; }
    .search-form-container { padding: 20px; }
    .search-form-container h3 { font-size: 20px; }
    .cities-section { padding: 30px 15px; }
    .cities-section h2 { font-size: 24px; }
    .cities-grid { grid-template-columns: 1fr; gap: 15px; }
    .features { padding: 50px 0; }
    .section-title h2 { font-size: 2rem; }
    .section-title p { font-size: 1rem; }
    .features-grid { grid-template-columns: 1fr; gap: 30px; }
    .feature-card { padding: 30px 20px; }
    .how-it-works { padding: 50px 0; }
    .steps-container { grid-template-columns: 1fr; gap: 30px; }
    .faq-header { padding: 1rem; }
    .faq-header h1 { font-size: 1.2rem; }
    .accordion-button { padding: 1rem 1.5rem; }
    .accordion-body { padding: 1rem 1.5rem; }
    .footer-content { grid-template-columns: 1fr; gap: 20px; text-align: center; }
    .social-links { justify-content: center; }
}

@media (min-width: 769px) {
  
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
            .dropdown-menu { top: 60px; min-width: 200px; }         .dropdown-item { padding: 12px 16px; }          .dropdown-item a { font-size: 14px; }
    .search-container { gap: 30px; }
    .search-form-container { padding: 40px; }
    .features-grid { gap: 50px; }
    .feature-card { padding: 50px 40px; }
    .feature-card:hover { transform: translateY(-15px); }
    .city-card:hover { transform: translateY(-5px); }
    .footer-content { gap: 40px; }
}
</style>
<body>
<%String msg=request.getParameter("message");
if (msg != null) {

%>

<script>
   alert("<%= msg %>");
</script>
<%
   }
%>
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
<!-- Hero Section -->
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="images/RoadRescuebacmground.jpg">
      <div class="carousel-caption-custom">
        <h2>Emergency Roadside Assistance</h2>
        <p>Get help when you need it most - 24/7 highway support at your fingertips</p>
    <a href="contactus.jsp" class="btn btn-danger btn-lg">Get Help Now</a>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/RRbackground2.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption-custom">
        <h2>Find Nearby Garages</h2>
        <p>Locate trusted repair shops and mechanics in your area instantly</p>
    <a href="RRhomepage.jsp" class="btn btn-primary btn-lg">Search Garages</a>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/RRaboutimg1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption-custom">
        <h2>Trusted Network</h2>
        <p>Connect with verified professionals for quality service and peace of mind</p>
    <a href="Aboutus.html" class="btn btn-success btn-lg">Learn More</a>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<section class="search-section" id="search-section">
    <div class="container">
        <div class="search-container">
            <div class="search-form-container">
            
                <h3><i class='bx bx-search-alt'></i> Find Garages Near You</h3>
                <form action="RRsearch" method ="post">
                <div class="form-group">
                    <label for="location">
                        <i class='bx bx-location-plus'></i> Your Location
                    </label>
                    <input type="text" id="location" name="location" placeholder="Enter your location (e.g., Nashik , Pune)">
                </div>
                <div class="form-group">
                    <label for="radius">
                        <i class='bx bx-radar'></i> Search Radius
                    </label>
                    <select id="radius">
                        <option value="5">5 km</option>
                        <option value="10" selected>10 km</option>
                        <option value="20">20 km</option>
                        <option value="50">50 km</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="service-type">
                        <i class='bx bx-wrench'></i> Service Type
                    </label>
                    <select id="service-type">
                        <option value="all">All Services</option>
                        <option value="repair">General Repair</option>
                        <option value="tyre">Tyre Services</option>
                        <option value="battery">Battery Services</option>
                        <option value="towing">Towing Services</option>
                    </select>
                </div>
                <button  class="btn-secondary">
                    <i class='bx bx-search'></i> Search Garages
                </button>
                </form>
              
            </div>           
        </div>
    </div>
</section>
<section class="cities-section">
    <h2>Popular Cities</h2>
    <div class="cities-grid">
        <div class="city-card">
            <img src="images/beed.jpg" alt="Beed City">
            <div class="city-card-content">
                <h3>Beed</h3>
                <p>Find reliable garage services in Beed city. Quick fixes to major repairs available.</p>
                <a href="beedservices.html" class="city-card-btn">View Garages</a>
            </div>
        </div>
        <div class="city-card">
            <img src="images/sambhajinagar.jpg" alt="Chhatrapati Sambhajinagar">
            <div class="city-card-content">
                <h3>Chhatrapati Sambhajinagar</h3>
                <p>Professional automotive services in the historic city. Quality repairs available.</p>
                <a href="sambhajinagarservices.html" class="city-card-btn">View Garages</a>
            </div>
        </div>
        <div class="city-card">
            <img src="images/nashik.jpg" alt="Nashik City">
            <div class="city-card-content">
                <h3>Nashik</h3>
                <p>Wine city's automotive repair network. Expert technicians ready to help.</p>
                <a href="nashikservices.html" class="city-card-btn">View Garages</a>
            </div>
        </div>
        <div class="city-card">
            <img src="images/pune.jpg" alt="pune city" >
            <div class="city-card-content">
                <h3>Pune</h3>
                <p>Local automotive expertise in Pune. Personalized service from local mechanics.</p>
                <a href="puneservices.html" class="city-card-btn">View Garages</a>
            </div>
        </div>
    </div>
</section>
<!-- why choose section Section -->
<section class="features" id="services">
    <div class="container">
        <div class="section-title">
            <h2>Why Choose RoadRescue ?</h2>
            <p>The most comprehensive network of highway assistance services</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class='bx bx-map'></i>
                </div>
                <h3>GPS Location Tracking</h3>
                <p>Instantly find the nearest garage based on your exact highway location with real-time GPS tracking.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class='bx bx-phone-call'></i>
                </div>
                <h3>24/7 Emergency Hotline</h3>
                <p>Round-the-clock support with direct connection to emergency services and towing companies.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class='bx bx-check-shield'></i>
                </div>
                <h3>Verified Partners</h3>
                <p>All garages are thoroughly vetted, licensed, and insured for your safety and peace of mind.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class='bx bx-time-five'></i>
                </div>
                <h3>Real-Time Updates</h3>
                <p>Get live updates on technician arrival times, service progress, and estimated completion.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class='bx bx-badge-check'></i>
                </div>
                <h3>Quality Guarantee</h3>
                <p>All services come with our satisfaction guarantee and comprehensive warranty coverage.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class='bx bx-money'></i>
                </div>
                <h3>Transparent Pricing</h3>
                <p>Upfront pricing with no hidden fees. Compare rates and services before you commit.</p>
            </div>
        </div>
    </div>
</section>
<!-- acordian section Section -->
<section class="how-it-works">
    <div class="acccontainer">
        <div class="section-title">
            <h2>How It Works</h2>
            <p>Get roadside assistance in three simple steps</p>
        </div>
        <div class="steps-container">
            <div class="step">
                <div class="step-number">1</div>
                <h3>Share Your Location</h3>
                <p>Tell us where you are on the highway or let GPS find you automatically</p>
            </div>
            <div class="step">
                <div class="step-number">2</div>
                <h3>Choose Your Service</h3>
                <p>Select from towing, jump-start, tire change, fuel delivery, or repairs</p>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <h3>Get Connected</h3>
                <p>We connect you with the nearest verified garage and track their arrival</p>
            </div>
        </div>
    </div>
</section>
<!-- acordian section Section -->
   <div class="acccontainer">
        <div class="faq-header">
            <h1>Frequently Asked Questions</h1>
        </div>
        
        <div class="accordion accordion-flush" id="faqAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#question1" aria-expanded="false" aria-controls="question1">
                        How can I join RoadRescue?
                    </button>
                </h2>
                <div id="question1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        To join <span class="brand-name">RoadRescue</span> as a garage partner, follow these simple steps:
                        <br><br>
                        1. Register for a <span class="brand-name">RoadRescue</span> account<br>
                        2. Log in to your account<br>
                        3. Go to your profile page<br>
                        4. Click the <span class="highlight">"Add Garage"</span> button
                        <br><br>
                        By partnering with us, you can expand your garage business and reach more customers in need of roadside assistance.
                    </div>
                </div>
            </div>
            
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#question2" aria-expanded="false" aria-controls="question2">
                        What are the benefits of using RoadRescue?
                    </button>
                </h2>
                <div id="question2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <span class="brand-name">RoadRescue</span> provides immediate assistance when you experience vehicle breakdowns, especially on highways. Our platform allows you to:
                        <br><br>
                        • Quickly locate nearby garages and service providers<br>
                        • Access direct contact information for garage owners<br>
                        • Get help during emergency situations<br>
                        • Save valuable time when you need assistance most
                        <br><br>
                        We solve the critical problem of finding reliable roadside assistance when you're stranded.
                    </div>
                </div>
            </div>
            
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#question3" aria-expanded="false" aria-controls="question3">
                        Can I use RoadRescue anytime?
                    </button>
                </h2>
                <div id="question3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <strong>Yes!</strong> <span class="brand-name">RoadRescue</span> is available <span class="highlight">24/7</span> to ensure you get help whenever you need it.
                        <br><br>
                        Our service is designed with a primary focus on saving your time during emergency situations, providing round-the-clock access to roadside assistance and garage services.
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- footer Section -->
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
    // Close dropdown when clicking outside
    window.onclick = function(event) {
        if (!event.target.matches('.profile-icon') && !event.target.matches('.profile-icon i')) {
            const dropdown = document.getElementById('dropdown');
            if (dropdown.classList.contains('show')) {
                dropdown.classList.remove('show');
            }
        }
    }
</script>
</body>
</html>