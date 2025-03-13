<?php
// Database Connection
$servername = "localhost"; // Change if using a remote DB
$username = "root"; // Default XAMPP MySQL user
$password = ""; // Default is empty
$dbname = "your_database_name"; // Change this to your actual DB name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
