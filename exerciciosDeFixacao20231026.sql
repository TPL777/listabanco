DELIMITER //
CREATE TRIGGER insere_cliente
AFTER INSRT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem)
    VALUES (CONCAT('Novo cliente inserido em ', NOW()));
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGger tentativa_exclusao_cliente
BEFORE DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem)
    VALUES (CONCAT('Tentativa de exclusão de cliente em ', NOW()));
   
END;
//
DELIMITER ;
