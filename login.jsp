<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Road Rescue - Login</title>
</head>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: 'Arial', sans-serif; min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 10px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #4a90e2 100%); background-attachment: fixed; }
.login-container { background: white; border-radius: 15px; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2); padding: 20px 30px; width: 100%; max-width: 400px; text-align: center; }
.logo { margin-bottom: 20px; }
.website-title { font-size: 28px; color: #1e3c72; font-weight: bold; margin-bottom: 5px; }
.subtitle { color: #666; margin-bottom: 25px; font-size: 14px; }
.form-group { margin-bottom: 15px; text-align: left; }
.form-group label { display: block; margin-bottom: 5px; color: #333; font-weight: bold; font-size: 14px; }
.form-group input { width: 100%; padding: 12px 15px; border: 2px solid #e1e1e1; border-radius: 8px; font-size: 16px; transition: border-color 0.3s ease; }
.form-group input:focus { outline: none; border-color: #2a5298; box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1); }
.login-btn { width: 100%; padding: 14px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; border: none; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer; transition: transform 0.2s ease, box-shadow 0.3s ease; margin: 20px 0 15px 0; }
.login-btn:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(42, 82, 152, 0.3); }
.login-btn:active { transform: translateY(0); }
.forgot-password { color: #2a5298; text-decoration: none; font-size: 14px; transition: color 0.3s ease; display: block; margin-bottom: 15px; }
.forgot-password:hover { color: #1e3c72; text-decoration: underline; }
.signup-link { margin-top: 15px; padding-top: 15px; border-top: 1px solid #e1e1e1; color: #666; font-size: 14px; }
.signup-link a { color: #2a5298; text-decoration: none; font-weight: bold; }
.signup-link a:hover { text-decoration: underline; }
@media (max-width: 768px) {
body { padding: 5px; }
.login-container { padding: 15px 20px; margin: 5px; max-width: 350px; }
.logo { margin-bottom: 15px; }
.website-title { font-size: 24px; margin-bottom: 5px; }
.subtitle { margin-bottom: 20px; }
.form-group { margin-bottom: 12px; }
.form-group input { padding: 10px 12px; font-size: 14px; }
.login-btn { padding: 12px; font-size: 14px; margin: 15px 0 10px 0; }
.signup-link { margin-top: 10px; padding-top: 10px; }
}
@media (min-width: 769px) {
.login-container { max-width: 450px; padding: 25px 40px; }
.logo { margin-bottom: 25px; }
.website-title { font-size: 32px; }
.form-group input { padding: 14px 18px; font-size: 18px; }
.login-btn { padding: 16px; font-size: 18px; }
}
</style>
<body>
    <div class="login-container">
        <div class="logo">
            <img src="images/RRlogo.png" alt="Road Rescue Logo" style="width: 150px; height: 150px;">
            <h1 class="website-title">Road Rescue</h1>
            <p class="subtitle">Your trusted roadside assistance</p>
        </div>
        <form id="loginForm" action="RRlogin" method="post">
            <div class="form-group">
                <label for="email">Username</label>
                <input type="text" id="text" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="text" id="password" name="password" required>
            </div>
            <button type="submit" class="login-btn">Log In</button>
          
            <div class="signup-link">
                Don't have an account? <a href="signup.jsp">Sign up here</a>
            </div>
        </form>
    </div>
</body>
</html>