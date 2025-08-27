CREATE DATABASE student_management;

USE student_management;
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    grade VARCHAR(10) NOT NULL
);
INSERT INTO teachers (username, password) VALUES ('admin', 'admin');



CREATE TABLE edited_students (
    id INT PRIMARY KEY
);


INSERT INTO teachers (username, password) VALUES ('admin', 'admin')
ON DUPLICATE KEY UPDATE username='admin', password='admin';

use student_management;

INSERT INTO students (name, age, grade) VALUES
('Aarav Sharma', 14, '8A'),
('Ishaan Verma', 15, '9B'),
('Riya Patel', 13, '7C'),
('Kabir Gupta', 16, '10A'),
('Sneha Iyer', 12, '6B'),
('Ananya Kapoor', 14, '8C'),
('Devansh Mehta', 15, '9A'),
('Meera Nair', 13, '7B'),
('Aryan Joshi', 16, '10C'),
('Niharika Sinha', 12, '6A'),
('Vedant Malhotra', 14, '8B'),
('Simran Kaur', 15, '9C'),
('Rahul Deshmukh', 13, '7A'),
('Tanvi Reddy', 16, '10B'),
('Yash Chauhan', 12, '6C'),
('Madhav Saxena', 14, '8A'),
('Pooja Dubey', 15, '9B'),
('Rohan Tiwari', 13, '7C'),
('Aditi Bansal', 16, '10A'),
('Karan Bajaj', 12, '6B'),
('Jhanvi Aggarwal', 14, '8C'),
('Nitin Prasad', 15, '9A'),
('Esha Pillai', 13, '7B'),
('Harsh Yadav', 16, '10C'),
('Neha Kulkarni', 12, '6A'),
('Aayush Srivastava', 14, '8B'),
('Swati Goswami', 15, '9C'),
('Tushar Khanna', 13, '7A'),
('Rachit Arora', 16, '10B'),
('Bhavna Menon', 12, '6C'),
('Kunal Sethi', 14, '8A'),
('Priya Choudhary', 15, '9B'),
('Akshay Mishra', 13, '7C'),
('Soumya Rao', 16, '10A'),
('Varun Dutta', 12, '6B'),
('Sanya Saxena', 14, '8C'),
('Gaurav Bhardwaj', 15, '9A'),
('Trisha Nanda', 13, '7B'),
('Siddharth Sen', 16, '10C'),
('Muskan Malhotra', 12, '6A'),
('Aditya Thakur', 14, '8B'),
('Sakshi Gupta', 15, '9C'),
('Naveen Soni', 13, '7A'),
('Preeti Sharma', 16, '10B'),
('Vikas Tandon', 12, '6C'),
('Mitali Saxena', 14, '8A'),
('Parth Bhatia', 15, '9B'),
('Roshni Vyas', 13, '7C'),
('Shivam Rathore', 16, '10A'),
('Aarushi Bhaskar', 12, '6B');

