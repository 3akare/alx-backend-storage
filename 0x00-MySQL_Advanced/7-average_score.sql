-- Create a procedure ComputeAverageScoreForUser that computes and store the avarage score for a student

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE freq INT DEFAULT 0;
    DECLARE total INT DEFAULT 0;

    SELECT COUNT(score) INTO freq FROM corrections WHERE corrections.user_id = user_id;
    SELECT SUM(score) INTO total FROM corrections WHERE corrections.user_id = user_id;  

    UPDATE users
    SET users.average_score = total/freq
    WHERE users.id = user_id;
END $$
DELIMITER ;