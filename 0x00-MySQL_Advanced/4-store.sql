-- Create a trigger that decreases rhe quantity of an item after adding a new order
DROP TRIGGER IF EXISTS orderTrigger;
DELIMITER $$
CREATE TRIGGER orderTrigger
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END $$
DELIMITER ;