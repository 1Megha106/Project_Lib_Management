-- Create Database
CREATE DATABASE library_management_system;

-- Use the created Database
USE library_management_system;

-- Admin Table
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    membership_id INT,
    FOREIGN KEY (membership_id) REFERENCES memberships(id)
);

-- Memberships Table
CREATE TABLE memberships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL
);

-- Books Table
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    available BOOLEAN DEFAULT TRUE
);

-- Movies Table
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    available BOOLEAN DEFAULT TRUE
);

-- Transactions Table
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    fine DECIMAL(10, 2) DEFAULT 0,
    status ENUM('issued', 'returned', 'overdue') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Active Issues Table
CREATE TABLE active_issues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    issue_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Overdue Returns Table
CREATE TABLE overdue_returns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    fine DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Issue Requests Table
CREATE TABLE issue_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    request_date DATE,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Maintenance Requests Table
CREATE TABLE maintenance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    issue VARCHAR(255) NOT NULL,
    reported_date DATE,
    status ENUM('open', 'closed') DEFAULT 'open',
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Book Issues Table 
CREATE TABLE book_issues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    issue_date DATE NOT NULL,
    return_date DATE,
    status ENUM('issued', 'returned') DEFAULT 'issued',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Reports Table 
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_name VARCHAR(255) NOT NULL,
    generated_date DATE NOT NULL,
    details TEXT
);

-- Master List of Books 
CREATE TABLE master_books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    edition VARCHAR(50),
    publication_year INT
);

-- Master List of Movies
CREATE TABLE master_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255),
    release_year INT
);

-- Master List of Memberships
CREATE TABLE master_memberships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    membership_type VARCHAR(100) NOT NULL,
    description TEXT,
    fee DECIMAL(10, 2)
);

