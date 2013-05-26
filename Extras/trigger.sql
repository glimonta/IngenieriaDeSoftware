CREATE OR REPLACE FUNCTION agrega_cliente_plan()
RETURNS TRIGGER
AS $agrega_cliente_plan$

DECLARE c_tipo CHAR;
DECLARE actual CURSOR FOR
SELECT cli.tipo
FROM contrata cont, cliente cli, plan p, producto pro
WHERE p.codigo_plan = cont.codigo_plan AND cont.tipo = cli.tipo AND cont.nro = cli.nro AND pro.nroserie = cont.nroserie;

BEGIN

  OPEN actual;
  FETCH actual INTO c_tipo;

  IF NOT FOUND THEN
    INSERT INTO contrata VALUES(NEW.tipo,NEW.nro,NEW.codigo_plan,NEW.fecha);
  ELSE
    RAISE NOTICE 'El cliente ya tiene plan asociado';
  END IF;

CLOSE actual;
END;
$agrega_cliente_plan$
LANGUAGE plpgsql;

CREATE TRIGGER agrega_cliente_plan BEFORE INSERT
ON contrata FOR EACH STATEMENT
EXECUTE PROCEDURE agrega_cliente_plan();
