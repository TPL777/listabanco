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

DELIMITER //
CREATE TRIGGER atualiza_nome_cliente
AftER UPDATE ON Clientes
FOR EAch ROW
bEGIN
    IF NEW.nome != OLD.nome THEN
        INSERT INTO Auditoria (mensagem)
        VALUES (CONCAT('Nome do cliente atualizado de "', OLD.nome, '" para "', NEW.nome, '" em ', NOW()));
    END IF;
END;
//
DELIMITER ;
