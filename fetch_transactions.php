<?php
session_start();
include 'db.php';

$sql = "SELECT * FROM transactions";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Transaction ID</th><th>User ID</th><th>Book ID</th><th>Issue Date</th><th>Return Date</th><th>Fine</th><th>Status</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['id']}</td><td>{$row['user_id']}</td><td>{$row['book_id']}</td><td>{$row['issue_date']}</td><td>{$row['return_date']}</td><td>{$row['fine']}</td><td>{$row['status']}</td></tr>";
    }
    echo "</table>";
} else {
    echo "No transactions found.";
}

$conn->close();
?>