/* DEFINICION TRIGGER. (Casi seguro...) */
-- Funcion
CREATE OR REPLACE FUNCTION del_user_related()
BEGIN
  DELETE FROM address WHERE id_user = OLD.id
END;
-- Trigger
CREATE TRIGGER nueva_venta
AFTER DELETE ON users
FOR EACH ROW
EXECUTE PROCEDURE del_user_related();
