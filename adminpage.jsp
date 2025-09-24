<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Explore Maharashtra</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        * { text-decoration: none; margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; color: #333; line-height: 1.6; }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
        header .container { max-width: 100%; padding: 0 10px; }
        header { background-color: #1e40af; color: white; padding: 2px 0; width: 100%; position: fixed; top: 0; left: 0; right: 0; z-index: 1000; }
        .header-content { display: flex; justify-content: space-between; align-items: center; width: 100%; padding-right: 40px; }
        .navbar { display: flex; align-items: center; height: 55px; margin-top: 17px; }
        .logo { display: flex; align-items: center; gap: 4px; margin-bottom: 17px; }
        .logo-image { width: 125px; height: 55px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .logo-image img { width: 100%; height: 100%; object-fit: contain; margin-bottom: 13px; }
        .logo h1 { font: bold 23px/1 Arial, sans-serif; letter-spacing: 1px; margin-bottom: 13px; white-space: nowrap; }
        .logo h1 span { color: #93c5fd; }
        .right-section { display: flex; align-items: center; gap: 30px; margin-right: 20px; }
        nav { display: flex; gap: 25px; }
        nav a { color: white; text-decoration: none; font: 500 16px Arial, sans-serif; position: relative; padding: 10px 18px; border-radius: 25px; transition: all 0.3s ease; overflow: hidden; }
        nav a:hover { color: #e2e8f0; transform: translateY(-1px); box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15); }
        .profile-container { position: relative; }
        .profile-icon { display: flex; align-items: center; justify-content: center; width: 42px; height: 42px; background-color: #4d89c5; border-radius: 50%; cursor: pointer; border: 2px solid white; transition: all 0.3s ease; }
        .profile-icon:hover { background-color: #3b82f6; transform: scale(1.05); box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2); }
        .profile-icon i { font-size: 21px; color: white; transition: all 0.3s ease; }
        .dropdown-menu { position: absolute; top: 57px; left: 50%; transform: translateX(-50%); background-color: white; border-radius: 8px; border: 1px solid #ddd; min-width: 200px; display: none; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15); opacity: 0; transition: all 0.3s ease; z-index: 2000; }
        .dropdown-menu.show { display: block; opacity: 1; animation: fadeInDown 0.3s ease; }
        @keyframes fadeInDown { from { opacity: 0; transform: translateX(-50%) translateY(-10px); } to { opacity: 1; transform: translateX(-50%) translateY(0); } }
        .dropdown-item { display: flex; align-items: center; padding: 12px 16px; border-bottom: 1px solid #f0f0f0; cursor: pointer; transition: all 0.3s ease; position: relative; overflow: hidden; }
        .dropdown-item:last-child { border-bottom: none; }
        .dropdown-item:hover { background-color: #f8fafc; transform: translateX(5px); }
        .dropdown-item i { font-size: 18px; color: #4d89c5; margin-right: 12px; transition: all 0.3s ease; }
        .dropdown-item:hover i { transform: scale(1.2); color: #1e40af; }
        .dropdown-item a { color: #333; text-decoration: none; font: 500 14px Arial, sans-serif; transition: all 0.3s ease; }
        .dropdown-item:hover a { color: #1e40af; }
        .dashboard-content { max-width: 1200px; margin: 105px auto 40px; padding: 0 20px; }
        .dashboard-header { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); margin-bottom: 30px; text-align: center; }
        .dashboard-header h2 { color: #1e40af; font-size: 28px; margin-bottom: 10px; }
        .dashboard-header p { color: #666; font-size: 16px; }
        .activity-section { background: white; border-radius: 15px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); overflow: hidden; }
        .activity-header { background: #1e40af; color: white; padding: 20px 30px; }
        .activity-header h3 { font-size: 24px; margin: 0; }
        .activity-content { padding: 30px; text-align: center; }
        .action-btn { background: #1e40af; color: white; border: none; padding: 15px 30px; border-radius: 8px; cursor: pointer; font-size: 16px; transition: background 0.3s, transform 0.2s; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3); text-decoration: none; display: inline-flex; align-items: center; gap: 8px; }
        .action-btn:hover { background: #1d4ed8; transform: translateY(-2px); box-shadow: 0 6px 16px rgba(30, 64, 175, 0.4); }
        .action-btn:active { transform: translateY(0); }
        .activity-content a { text-decoration: none; }
        @media (max-width: 768px) {
            .header-content { flex-direction: column; gap: 1rem; padding-right: 10px; }
            .navbar { height: 45px; margin-top: 10px; }
            .logo-image { width: 100px; height: 45px; }
            .logo h1 { font-size: 20px; margin-bottom: 10px; }
            .logo { margin-bottom: 10px; }
            .right-section { flex-direction: column; gap: 15px; margin-right: 0; }
            nav { gap: 15px; flex-wrap: wrap; justify-content: center; }
            nav a { padding: 8px 15px; font-size: 14px; }
            .profile-icon { width: 38px; height: 38px; }
            .profile-icon i { font-size: 18px; }
            .dashboard-content { margin-top: 140px; }
        }
        @media (min-width: 769px) {
            .navbar { height: 55px; margin-top: 17px; }
            .logo { margin-bottom: 17px; }
            .logo-image { width: 125px; height: 55px; }
            .logo h1 { font-size: 23px; margin-bottom: 13px; }
            .right-section { gap: 30px; margin-right: 20px; }
            nav { gap: 25px; }
            .profile-icon { width: 42px; height: 42px; }
            .profile-icon i { font-size: 21px; }
            .dashboard-content { margin-top: 105px; }
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
                        <a href="Joinus.jsp">Add Garage</a>
                    </nav>
                    <div class="profile-container">
                        <div class="profile-icon" onclick="toggleDropdown()">
                            <i class='bx bx-user'></i>
                        </div>
                        <div class="dropdown-menu" id="profileDropdown">
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
                                <a href="AAintropage.jsp">Sign Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="dashboard-content">
        <div class="dashboard-header">
            <h2>Admin Dashboard</h2>
            <p>Monitor and manage your ROADRESCUE platform</p>
        </div>
        <div class="activity-section">
            <div class="activity-header">
                <h3>Dashboard Actions</h3>
            </div>
            <div class="activity-content">
                <a href="crudoperation.jsp">
                    <button type="button" class="action-btn">
                        <i class='bx bx-cog'></i> User Registrations
                    </button>
                </a>
            </div>
            <div class="activity-content">
                <a href="crudcontact.jsp">
                    <button type="button" class="action-btn">
                        <i class='bx bx-envelope'></i> Contact Requests
                    </button>
                </a>
            </div>
            <div class="activity-content">
                <a href="crudjoinus.jsp">
                    <button type="button" class="action-btn">
                        <i class='bx bx-user-plus'></i> Add Garage Requests
                    </button>
                </a>
            </div>
        </div>
    </div>
    <script>
        function toggleDropdown() { const dropdown = document.getElementById('profileDropdown'); dropdown.classList.toggle('show'); }
        document.addEventListener('click', function(event) { const profileContainer = document.querySelector('.profile-container'); const dropdown = document.getElementById('profileDropdown'); if (!profileContainer.contains(event.target)) { dropdown.classList.remove('show'); } });
        document.getElementById('profileDropdown').addEventListener('click', function(e) { e.stopPropagation(); });
    </script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>
</html>