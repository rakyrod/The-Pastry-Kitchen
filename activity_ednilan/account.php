<?php
include "config.php";
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];
$sql = "SELECT * FROM users WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Page</title>
    <link rel="stylesheet" href="css/.css">
</head>
<body>
    <div class="account-container">
        <div class="profile-card">
            <img src="profile-placeholder.png" alt="Profile Picture" class="profile-pic">
            <h2><?php echo $user['username']; ?></h2>
            <p>Email: <?php echo $user['email']; ?></p>
            <a href="logout.php" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>
