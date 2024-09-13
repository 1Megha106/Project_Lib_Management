<?php
session_start();
include 'db.php';

$title = $_POST['title'];
$author = $_POST['author'];

$sql = "INSERT INTO books (title, author, available) VALUES ('$title', '$author', 1)";

if ($conn->query($sql) === TRUE) {
    echo "Book added successfully!";
    header("Location: admin/home.html");
    exit();
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>