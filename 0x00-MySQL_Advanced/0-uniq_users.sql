-- Create a table users if it doesn't exist

CREATE TABLE IF NOT EXISTS `users`(
    id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255)
);
