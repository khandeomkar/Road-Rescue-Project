<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Road Rescue - Sign Up</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Arial', sans-serif; min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #4a90e2 100%); background-attachment: fixed; }
        .signup-container { background: white; border-radius: 15px; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1); padding: 15px 40px 25px 40px; width: 100%; max-width: 600px; text-align: center; }
        .logo { margin-bottom: 20px; }
        .website-title { font-size: 24px; color: #1e3c72; font-weight: bold; margin-bottom: 5px; }
        .subtitle { color: #666; margin-bottom: 20px; font-size: 14px; }
        .form-row { display: flex; gap: 15px; margin-bottom: 15px; }
        .form-group { margin-bottom: 15px; text-align: left; flex: 1; }
        .form-group label { display: block; margin-bottom: 5px; color: #333; font-weight: bold; font-size: 14px; }
        .form-group input { width: 100%; padding: 10px 12px; border: 2px solid #e1e1e1; border-radius: 8px; font-size: 14px; transition: border-color 0.3s ease; }
        .form-group input:focus { outline: none; border-color: #2a5298; box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1); }
        .form-group input.error { border-color: #e74c3c; box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.1); }
        .error-message { color: #e74c3c; font-size: 12px; margin-top: 5px; display: none; }
        .signup-btn { width: 100%; padding: 12px; background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: bold; cursor: pointer; transition: transform 0.2s ease, box-shadow 0.3s ease; margin-bottom: 15px; margin-top: 10px; }
        .signup-btn:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(42, 82, 152, 0.3); }
        .signup-btn:active { transform: translateY(0); }
        .login-link { margin-top: 5px; padding-top: 8px; border-top: 1px solid #e1e1e1; color: #666; font-size: 14px; }
        .login-link a { color: #2a5298; text-decoration: none; font-weight: bold; }
        .login-link a:hover { text-decoration: underline; }
        @media (max-width: 768px) {
            .signup-container { padding: 10px 20px 25px 20px; margin: 10px; max-width: 350px; }
            .website-title { font-size: 24px; }
            .form-group input { padding: 10px 12px; font-size: 14px; }
            .signup-btn { padding: 12px; font-size: 14px; }
            .form-row { flex-direction: column; gap: 0; }
        }
        @media (min-width: 769px) {
            .signup-container { max-width: 650px; padding: 20px 50px 35px 50px; }
            .website-title { font-size: 28px; }
            .form-group input { padding: 12px 15px; font-size: 16px; }
            .signup-btn { padding: 14px; font-size: 16px; }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="logo">
            <img src="images/RRlogo.png" alt="Road Rescue Logo" style="width: 150px; height: 150px;">
            <h1 class="website-title">Road Rescue</h1>
            <p class="subtitle">Create your account for roadside assistance</p>
        </div>
        <form id="signupForm" action="crudoperation.jsp" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullname" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile Number</label>
                    <input type="text" id="mobile" name="mobile" required>
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="text" id="confirmPassword" name="confirmpassword" required>
                    <div class="error-message" id="passwordError">Passwords do not match</div>
                </div>
            </div>
            <button type="submit" class="signup-btn">Sign Up</button>
            <div class="login-link">
                Already have an account? <a href="RRlogin.html">Login here </a>
            </div>
        </form>
    </div>

    <script>
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        const passwordError = document.getElementById('passwordError');
        const signupForm = document.getElementById('signupForm');

        function validatePasswords() {
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            if (confirmPassword && password !== confirmPassword) {
                confirmPasswordInput.classList.add('error');
                passwordError.style.display = 'block';
                return false;
            } else {
                confirmPasswordInput.classList.remove('error');
                passwordError.style.display = 'none';
                return true;
            }
        }

        // Real-time validation as user types
        confirmPasswordInput.addEventListener('input', validatePasswords);
        passwordInput.addEventListener('input', validatePasswords);

        // Form submission validation
        signupForm.addEventListener('submit', function(e) {
            if (!validatePasswords()) {
                e.preventDefault();
                alert('Please ensure both passwords match before submitting.');
                return false;
            }
            
        });
    </script>
</body>
</html>