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
    <title>Edit Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .edit-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .edit-container h2 {
            margin-bottom: 20px;
        }
        .edit-container label {
            font-weight: bold;
        }
        .edit-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .edit-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h2>Edit Account Information</h2>
        <form action="update_account.php" method="post">
            <?php if ($user_type === 'employee'): ?>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<?php echo $user['EmployeeName']; ?>" required>
                
                <label for="contact_info">Contact Info:</label>
                <input type="text" id="contact_info" name="contact_info" value="<?php echo $user['EmployeeContactInfo']; ?>" required>
            <?php elseif ($user_type === 'customer'): ?>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<?php echo $user['CustomerName']; ?>" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<?php echo $user['CustomerEmail']; ?>" required>
                
                <label for="birthday">Birthday:</label>
                <input type="date" id="birthday" name="birthday" value="<?php echo $user['CustomerBirthday']; ?>" required>
            <?php endif; ?>
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>