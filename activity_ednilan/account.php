<?php
session_start();
include("db_connect.php");

// Redirect to login if the user is not logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$user_type = $_SESSION['user_type'];

// Fetch user information based on user type
if ($user_type === 'employee') {
    $stmt = $conn->prepare("SELECT EmployeeID, EmployeeName, EmployeeContactInfo FROM employee WHERE EmployeeID = ?");
} else if ($user_type === 'customer') {
    $stmt = $conn->prepare("SELECT CustomerID, CustomerName, CustomerEmail, CustomerBirthday FROM customer WHERE CustomerID = ?");
}

$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/account.css"

    <nav>
    <div class="navigation-container">
        <img src="images/logo.png" alt="LOGO" class="logo-nav"> 
        
        <div class="nav-wrapper">
            <ul class="nav-links">
                <li><a href="homepage.php">Home</a></li>
                <li><a href="about.php">About us</a></li>
                <li><a href="menu.php">Menu</a></li>
                <li><a href="location.php">Store Location</a></li>
                <li><a href="account.php">Account</a></li>
            </ul>
        </div>
    </div>

</nav>
<style>
.navigation-container {
    display: flex;
    align-items: center;
    justify-content: space-between; 
    
    background-color: #1b3c3d;
}

.logo-nav {
    height: 120px;
}

.nav-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
}

.nav-links {
    display: flex;
    gap: 25px;
    list-style: none;
    padding: 0;
    margin: 0;
}

.nav-links li {
    list-style: none;
    font-size: 18px;
    font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
    font-weight: 400;
    transition: color 0.3s ease;
}

.nav-links a {
    text-decoration: none;
    color: rgb(190, 196, 106);
    font-size: 18px;
    transition: color 0.3s ease;
}

.nav-links a:hover {
    color: #fff;
}

    <style>

        
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .account-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 200px 100px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .account-container h2 {
            margin-bottom: 20px;
        }
        .account-info p {
            font-size: 18px;
            margin: 10px 0;
        }
        .button-container {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            padding: 10px 70px;
        }
        .button-container a {
            text-decoration: none;
        
        }
        .button-container button {
            padding: 10px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button-container .btn-edit {
            background-color: #007bff;
            color: white;
        }
        .button-container .btn-logout {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="account-container">
        <h2>Account Information</h2>
        <div class="account-info">
            <?php if ($user_type === 'employee'): ?>
                <p><strong>Employee ID:</strong> <?php echo $user['EmployeeID']; ?></p>
                <p><strong>Name:</strong> <?php echo $user['EmployeeName']; ?></p>
                <p><strong>Contact Info:</strong> <?php echo $user['EmployeeContactInfo']; ?></p>
            <?php elseif ($user_type === 'customer'): ?>
                <p><strong>Customer ID:</strong> <?php echo $user['CustomerID']; ?></p>
                <p><strong>Name:</strong> <?php echo $user['CustomerName']; ?></p>
                <p><strong>Email:</strong> <?php echo $user['CustomerEmail']; ?></p>
                <p><strong>Birthday:</strong> <?php echo $user['CustomerBirthday']; ?></p>
            <?php endif; ?>
        </div>
        <div class="button-container">
            <a href="edit_account.php"><button class="btn-edit">Edit</button></a>
            <a href="logout.php"><button class="btn-logout">Log-out</button></a>
        </div>
    </div>

    <section class="opening-container">
                                <img src="images/logo.png" alt="Bakery Logo" class="logo">

                                <!---Contact us na section-->
                                    <div class="contact">
                                        <h1>Contact Us</h1>
                                        <p><i class="fa-solid fa-phone"></i>09693628992</p>
                                        <p><i class="fa-solid fa-envelope"></i>thepastrykitchen@gmail.com</p>

                                    </div>
                                <div class="opening-times">
                                    <h2>Opening Times</h2>
                                    <div><span class="day">MON</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">TUE</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">WED</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">THU</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">FRI</span> <span class="time">11:00am - 11:00pm</span></div>
                                    <div><span class="day">SAT</span> <span class="time">10:00am - 11:00pm</span></div>
                                    <div><span class="day">SUN</span> <span class="time">11:00am - 8:00pm</span></div>
                                </div>
                            </section>
                            
                                </div>

                    
</html>