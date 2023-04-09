-- Create a procedure AddBonus that adds a new correction or a student

DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(30), IN score FLOAT)

BEGIN
    DECLARE num_of_project INT DEFAULT 0;
    DECLARE new_project_id INT DEFAULT 0;

    SELECT COUNT(id) INTO num_of_project FROM projects WHERE name = project_name;
    IF num_of_project = 0 THEN
    INSERT INTO projects(name) VALUES (project_name);
    END IF;

    SELECT id INTO new_project_id FROM projects 
    WHERE name = project_name;
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, new_project_id, score);
END $$
DELIMITER ;