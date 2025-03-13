<?php
session_start();
include("db_connect.php");

if (isset($_POST["submit"])) {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_EMAIL);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);
    $remember = isset($_POST['remember']) ? true : false;

    // First check employee login
    $employee_stmt = $conn->prepare("SELECT EmployeeID, EmployeePassword, EmployeeContactInfo FROM employee WHERE EmployeeContactInfo = ?");
    $employee_stmt->bind_param("s", $username);
    $employee_stmt->execute();
    $employee_result = $employee_stmt->get_result();

    if ($employee_result->num_rows > 0) {
        $employee = $employee_result->fetch_assoc();
        if ($password === $employee['EmployeePassword']) {
            $_SESSION['user_id'] = $employee['EmployeeID'];
            $_SESSION['user_type'] = 'employee';
            
            if ($remember) {
                setcookie('user_login', $username, time() + (86400 * 30), "/"); // 30 days
            }
            
            header("Location: index.php");
            exit();
        }
        $error = "Invalid password";
    } else {
        // Check customer login
        $customer_stmt = $conn->prepare("SELECT CustomerID, CustomerEmail, CustomerPassword FROM customer WHERE CustomerEmail = ?");
        $customer_stmt->bind_param("s", $username);
        $customer_stmt->execute();
        $customer_result = $customer_stmt->get_result();

        if ($customer_result->num_rows > 0) {
            $customer = $customer_result->fetch_assoc();
            if ($password === $customer['CustomerPassword']) {
                $_SESSION['user_id'] = $customer['CustomerID'];
                $_SESSION['user_type'] = 'customer';
                
                if ($remember) {
                    setcookie('user_login', $username, time() + (86400 * 30), "/");
                }
                
                header("Location: homepage.php");
                exit();
            }
            $error = "Invalid password";
        } else {
            $error = "Email not found";
        }
    }
    
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Cookie Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            background-color: #f8f9fa;
        }
        .login-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        .login-form {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        .image-container {
            flex: 1;
            background-size: cover;
            background-position: center;
            display: flex;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .password-field {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #6c757d;
        }
        @media (max-width: 768px) {
            .image-container {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-form">
            <h2 class="text-center mb-4">Login</h2>
            
            <?php if (isset($error)): ?>
                <div class="alert alert-danger" role="alert">
                    <?php echo $error; ?>
                </div>
            <?php endif; ?>

            <form action="login.php" method="post" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="username" required>
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="password-field">
                        <input type="password" class="form-control" id="password" name="password" required>
                        <i class="toggle-password fas fa-eye" onclick="togglePasswordVisibility()"></i>
                    </div>
                </div>
                
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="remember" name="remember">
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>
                
                <button type="submit" name="submit" class="btn btn-primary w-100">Sign In</button>
                
                <div class="text-center mt-3">
                    <a href="create.php" class="text-decoration-none">Create Account</a>
                </div>
            </form>
        </div>
    </div>
    
    <div class="image-container">
        <img src="images/image-row.jpeg" alt="login">
    </div>

    <script>
        function validateForm() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            if (!email.includes('@')) {
                alert('Please enter a valid email address.');
                return false;
            }
            
            if (password.length < 6) {
                alert('Password must be at least 6 characters long.');
                return false;
            }
            
            return true;
        }

        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>