-- ======================================================
-- TABLA ALUMNO
-- ======================================================

CREATE TABLE ALUMNO
( 
	alu_id               INT  NOT NULL ,
	alu_nombre           varchar2(100)  NOT NULL ,
	alu_direccion        varchar2(100)  NOT NULL ,
	alu_telefono         varchar2(20)  NULL ,
	alu_email            varchar2(50)  NULL 	
);


-- ======================================================
-- TABLA CURSO
-- ======================================================

CREATE TABLE CURSO
( 
	cur_id               INT NOT NULL ,
	cur_nombre           varchar2(100)  NOT NULL ,
	cur_vacantes         int  NOT NULL ,
	cur_matriculados     int  NOT NULL ,
	cur_profesor         varchar2(100)  NULL ,
	cur_precio           decimal(10,2)  NOT NULL 
);



-- ======================================================
-- TABLA MATRICULA
-- ======================================================


CREATE TABLE MATRICULA
( 
	cur_id               INT  NOT NULL ,
	alu_id               INT  NOT NULL ,
	mat_fecha            date  NOT NULL ,
	mat_precio           decimal(10,2)  NOT NULL ,
	mat_cuotas           int  NOT NULL ,
	mat_nota             int  NULL 
);


-- ======================================================
-- TABLA PAGO
-- ======================================================

CREATE TABLE PAGO
( 
	cur_id               INT  NOT NULL ,
	alu_id               INT  NOT NULL ,
	pag_cuota            int  NOT NULL ,
	pag_fecha            date  NOT NULL ,
	pag_importe          decimal(10,2)  NOT NULL 
);


-- ======================================================
-- RESTRICCIONES DE LA TABLA ALUMNO
-- ======================================================

ALTER TABLE ALUMNO
	ADD CONSTRAINT PK_ALUMNO 
	PRIMARY KEY (alu_id);


ALTER TABLE ALUMNO
	ADD CONSTRAINT U_ALUMNO_EMAIL 
	UNIQUE (alu_email);


ALTER TABLE ALUMNO
	ADD CONSTRAINT U_ALUMNO_NOMBRE 
	UNIQUE (alu_nombre);


INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 1,'YESENIA VIRHUEZ','LOS OLIVOS','986412345','yesenia@hotmail.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 2,'OSCAR ALVARADO FERNANDEZ','MIRAFLORES',NULL,'oscar@gmail.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 3,'GLADYS REYES CORTIJO','SAN BORJA','875643562','gladys@hotmail.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 4,'SARA RIEGA FRIAS','SAN ISIDRO',NULL,'sara@yahoo.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 5,'JHON VELASQUEZ DEL CASTILLO','LOS OLIVOS','78645345','jhon@movistar.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 6,'RODRIGUEZ ROJAS, RENZO ROBERT','SURCO','673465235','rrodrigiez@gmail.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 7,'CALERO MORALES, EMELYN DALILA','LA MOLINA','896754652','ecalero@peru.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 8,'KAREN FUENTES','San Isidro','555-5555','KAFUENTES@HOTMAIL.COM');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES( 9,'Yamina Ruiz','San Isidro','965-4521','yami_ruiz@gmail.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES(10,'MARIA EULALIA VELASQUEZ TORVISCO','SURCO','6573456','mvelasques@gmail.com');

INSERT INTO ALUMNO (alu_id, alu_nombre, alu_direccion, alu_telefono, alu_email )
VALUES(11,'FIORELLA LIZET VITELLA REYES','SAN BORJA','5468790','fvitela@outlook.com');


-- ======================================================
-- RESTRICCIONES DE LA TABLA CURSO
-- ======================================================

-- CLAVE PRIMARIA

ALTER TABLE CURSO
	ADD CONSTRAINT pk_curso 
	PRIMARY KEY (cur_id);


-- El nombre del curso es único

ALTER TABLE CURSO
	ADD CONSTRAINT u_curso_nombre 
	UNIQUE (cur_nombre);


-- Vacantes mayor que cero

ALTER TABLE CURSO
	ADD CONSTRAINT  chk_curso_vacantes
	CHECK  ( cur_vacantes > 0 ); 


-- Matriculados mayor o igual que cero, y menor o igual que las vacantes

ALTER TABLE CURSO
	ADD CONSTRAINT  chk_curso_matriculados
	CHECK  ( cur_matriculados >= 0 AND cur_matriculados <= cur_vacantes ) ;


-- Precio mayor que cero
ALTER TABLE CURSO
	ADD CONSTRAINT  chk_curso_precio
	CHECK  ( cur_precio > 0 );



-- Matriculados por defecto es CERO

ALTER TABLE CURSO
  MODIFY cur_matriculados default 0;


-- Insertar Datos

INSERT INTO CURSO(CUR_ID,CUR_NOMBRE,CUR_VACANTES,CUR_PRECIO,CUR_PROFESOR)
VALUES(1,'SQL Server Implementación',24,1000.0,'Gustavo coronel');

INSERT INTO CURSO(cur_id,cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES(2,'SQL Server Administración',24,1000.0,' ');

INSERT INTO CURSO(cur_id,cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES(3,'Inteligencia de Negocios',24,1500.0,'Sergio Matsukawa');

INSERT INTO CURSO(cur_id,cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES(4,'Programación Transact-SQL',24,1200.0,NULL);

INSERT INTO CURSO(cur_id,cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES(5,'Java Fundamentos',24,1600.0,'Gustavo Coronel');

INSERT INTO CURSO(cur_id,cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES(6,'Java Cliente-Servidor',24,1600.0,'Gustavo Coronel');

INSERT INTO CURSO(CUR_ID,CUR_NOMBRE,CUR_VACANTES,CUR_PRECIO,CUR_PROFESOR)
VALUES(7,'GESTION DE PROYECTOS',24,2200.0,'RICARDO MARCELO');

INSERT INTO CURSO(CUR_ID,CUR_NOMBRE,CUR_VACANTES,CUR_PRECIO,CUR_PROFESOR)
VALUES(8,'ORACLE DATABASE SQL',24,2600.0,'GUSTAVO CORONEL');

INSERT INTO CURSO(CUR_ID,CUR_NOMBRE,CUR_VACANTES,CUR_PRECIO,CUR_PROFESOR)
VALUES(9,'ORACLE DATABASE PL-SQL',24,2600.0,'GUSTAVO CORONEL');


-- ======================================================
-- RESTRICCIONES DE LA TABLA MATRICULA
-- ======================================================

ALTER TABLE MATRICULA
	ADD CONSTRAINT PK_MATRICULA 
	PRIMARY KEY (cur_id,alu_id);


ALTER TABLE MATRICULA
	ADD CONSTRAINT FK_MATRICULA_CURSO 
	FOREIGN KEY (cur_id) 
	REFERENCES CURSO(cur_id);


ALTER TABLE MATRICULA
	ADD CONSTRAINT FK_MATRICULA_ALUMNO 
	FOREIGN KEY (alu_id) 
	REFERENCES ALUMNO(alu_id);


ALTER TABLE MATRICULA
	ADD CONSTRAINT  CHK_MATRICULA_PRECIO
	CHECK  ( MAT_PRECIO > 0.0 );


ALTER TABLE MATRICULA
	ADD CONSTRAINT  CHK_MATRICULA_CUOTAS
	CHECK  ( MAT_CUOTAS > 0 );


ALTER TABLE MATRICULA
	ADD CONSTRAINT  CHK_MATRICULA_NOTA
	CHECK  ( (MAT_NOTA = NULL) OR (MAT_NOTA BETWEEN 0 AND 20) );


DECLARE 

   anio VARCHAR(10);
   
BEGIN

  anio :=  to_char(sysdate, 'YYYY');

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(1, 5, to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'), 800.0, 1, 15);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(1, 3, to_date( anio || '0416 11:45','YYYYMMDD HH24:MI'), 1000.0, 2, 18);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(1, 4, to_date( anio || '0418 08:33','YYYYMMDD HH24:MI'), 1200.0, 3, 12);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(2, 1, to_date( anio || '0415 12:33','YYYYMMDD HH24:MI'),800.0,1,16);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(2, 2, to_date( anio || '0501 15:34','YYYYMMDD HH24:MI'),1000.0,2,10);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(2, 3, to_date( anio || '0503 16:55','YYYYMMDD HH24:MI'), 1300.0, 3, 14);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(2, 4, to_date( anio || '0504 17:00','YYYYMMDD HH24:MI'), 400.0, 1, 18);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(2, 5, to_date( anio || '0506 13:12','YYYYMMDD HH24:MI'), 750.0, 1, 17);

  INSERT INTO MATRICULA ( cur_id, alu_id, mat_fecha, mat_precio, mat_cuotas, mat_nota ) 
  VALUES(3, 7, to_date( anio || '0602 13:12','YYYYMMDD HH24:MI'), 950.0, 2, 15);

END;
/

-- ======================================================
-- Actualizar la columna matriculados en la tabla curso
-- ======================================================

UPDATE CURSO
SET cur_matriculados = (
	SELECT COUNT(*) FROM MATRICULA
	WHERE MATRICULA.cur_id = CURSO.cur_id );

-- ======================================================
-- RESTRICCIONES EN LA TABLA PAGO
-- ======================================================

-- Clave Primaria

ALTER TABLE PAGO
	ADD CONSTRAINT PK_PAGO 
	PRIMARY KEY (cur_id,alu_id,pag_cuota);


-- Clave Foránea

ALTER TABLE PAGO
	ADD CONSTRAINT FK_PAGO_MATRICULA 
	FOREIGN KEY (cur_id,alu_id) 
	REFERENCES MATRICULA(cur_id,alu_id);


-- Cargar Datos


DECLARE 

  anio VARCHAR(10);
   
BEGIN

  anio :=  to_char(sysdate, 'YYYY');
  
  insert into PAGO values(1,3,1,to_date( anio || '0406','YYYYMMDD'),500);
  insert into PAGO values(1,3,2,to_date( anio || '0516','YYYYMMDD'),500);
  insert into PAGO values(1,4,1,to_date( anio || '0418','YYYYMMDD'),400);
  insert into PAGO values(1,4,2,to_date( anio || '0518','YYYYMMDD'),400);
  insert into PAGO values(2,1,1,to_date( anio || '0415','YYYYMMDD'),800);
  insert into PAGO values(2,2,1,to_date( anio || '0501','YYYYMMDD'),500);
  insert into PAGO values(2,3,1,to_date( anio || '0503','YYYYMMDD'),430);
  insert into PAGO values(2,3,2,to_date( anio || '0603','YYYYMMDD'),430);
  insert into PAGO values(2,4,1,to_date( anio || '0504','YYYYMMDD'),400);
  insert into PAGO values(2,5,1,to_date( anio || '0506','YYYYMMDD'),750);

END;
/

--######################################################################
-- ==========================================================
-- Crear la Tabla de Puestos de Trabajo: cargo
-- ==========================================================

CREATE TABLE cargo (
    idcargo     CHAR(3) NOT NULL,
    nombre      VARCHAR2(20) NOT NULL,
    sueldo_min  NUMBER(6) NOT NULL,
    sueldo_max  NUMBER(6) NOT NULL,
    CONSTRAINT pk_cargo PRIMARY KEY ( idcargo )
);

-- ==========================================================
-- Crear la Tabla de Oficinas: ubicacion
-- ==========================================================

CREATE TABLE ubicacion (
    idubicacion   char(3) NOT NULL,
    ciudad        VARCHAR2(15) NOT NULL,
    direccion     VARCHAR2(40) NOT NULL,
    CONSTRAINT pk_ubicacion PRIMARY KEY ( idubicacion )
);

-- ==========================================================
-- Crear la Tabla de Departamentos: departamento
-- ==========================================================

CREATE TABLE departamento (
    iddepartamento  NUMBER(3) NOT NULL,
    nombre          VARCHAR2(20) NOT NULL,
    idubicacion     CHAR(3) NOT NULL,
    CONSTRAINT pk_departamento 
        PRIMARY KEY ( iddepartamento ),
    CONSTRAINT fk_departamento_ubicacion 
        FOREIGN KEY ( idubicacion ) 
        REFERENCES ubicacion ( idubicacion )
);

-- ==========================================================
-- Crear la Tabla de Empleados: empleado
-- ==========================================================

CREATE TABLE empleado (
    idempleado     CHAR(5)     NOT NULL,
    apellido       VARCHAR2(20) NOT NULL,
    nombre         VARCHAR2(20) NOT NULL,
    fecingreso     date        NOT NULL,
    email          VARCHAR2(50) NULL,
    telefono       VARCHAR2(20) NULL,
    idcargo        CHAR(3)     NOT NULL,
    iddepartamento NUMBER(3)  NOT NULL,
    sueldo         NUMBER(6)  NOT NULL,
    comision       NUMBER(6)  NULL,
    jefe           CHAR(5)     NULL,
    CONSTRAINT pk_empleado 
        PRIMARY KEY ( idempleado ),
    CONSTRAINT fk_empleado_cargo 
        FOREIGN KEY ( idcargo ) 
        REFERENCES cargo ( idcargo ),
    CONSTRAINT fk_empleado_departamento 
        FOREIGN KEY ( iddepartamento ) 
        REFERENCES departamento ( iddepartamento ),
    CONSTRAINT fk_empleado_empleado 
        FOREIGN KEY ( jefe ) 
        REFERENCES empleado ( idempleado )
);

-- ==========================================================
-- Crear la Tabla de Parametros: control
-- ==========================================================

CREATE TABLE control (
    parametro   VARCHAR2(20) NOT NULL,
    valor       VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_control PRIMARY KEY ( parametro )
);

-- ==========================================================
-- Cargar datos a la tabla: cargo
-- ==========================================================

INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C01', 'Gerente General', 15000, 50000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C02', 'Gerente', 10000, 15000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C03', 'Empleado', 7000, 10000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C04', 'Analista', 5000, 7000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C05', 'Vendedor', 3000, 5000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C06', 'Oficinista', 1500, 3000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C07', 'Programador', 2500, 6000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C08', 'Investigador', 6000, 8000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C09', 'Digitador', 1000, 1500 );

-- ==========================================================
-- Cargar datos a la tabla: ubicacion
-- ==========================================================

INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U01', 'Lima', 'Av. Benavides 534 - Miraflores' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U02', 'Trujillo', 'Calle Primavera 1235 - Cercado' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U03', 'Arequipa', 'Av. Central 2517 - Cercado' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U04', 'Lima', 'Av. La Marina 3456 - San Miguel' );

-- ==========================================================
-- Cargar datos a la tabla: departamento
-- ==========================================================

INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 100, 'Gerencia', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 101, 'Contabilidad', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 102, 'Investigacion', 'U03' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 103, 'Ventas', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 104, 'Operaciones', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 105, 'Sistemas', 'U04' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 106, 'Recursos Humanos', 'U04' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 107, 'Finanzas', 'U01' );

-- ==========================================================
-- Cargar datos a la tabla: empleado
-- ==========================================================

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0001', 'Coronel', 'Gustavo', to_date('20000401','YYYYMMDD'), 'gcoronel@desarrollasoftware.com', '9666-4457', 'C01', 100, 25000, NULL, NULL );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0002', 'Fernandez', 'Claudia', to_date('20000501','YYYYMMDD'), 'cfernandez@desarrollasoftware.com', '9345-8365', 'C03', 100, 8000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0003', 'Matsukawa', 'Sergio', to_date('20000401','YYYYMMDD'), 'smatsukawa@desarrollasoftware.com', '9772-8369', 'C02', 102, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0004', 'Diaz', 'Mariela', to_date('20000410','YYYYMMDD'), 'mdiaz@desarrollasoftware.com', '8654-6734', 'C06', 102, 1800, NULL, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0005', 'Martinez', 'Roberto', to_date('20000405','YYYYMMDD'), 'rmartinez@desarrollasoftware.com', NULL, 'C08', 102, 7000, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0006', 'Espinoza', 'Miguel', to_date('20000406','YYYYMMDD'), 'mespinoza@desarrollasoftware.com', NULL, 'C08', 102, 7500, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0007', 'Ramos', 'Vanessa', to_date('20020406','YYYYMMDD'), 'vramos@desarrollasoftware.com', '9456-3456', 'C08', 102, 7000, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0008', 'Flores', 'Julio', to_date('20000401','YYYYMMDD'), 'jflores@desarrollasoftware.com', NULL, 'C07', 102, 3500, 1000, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0009', 'Marcelo', 'Ricardo', to_date('20000401','YYYYMMDD'), 'rmarcelo@desarrollasoftware.com', '9936-2966', 'C02', 101, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0010', 'Barrios', 'Guisella', to_date('20010115','YYYYMMDD'), 'gbarrios@desarrollasoftware.com', '9023-4512', 'C03', 101, 8000, NULL, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0011', 'Cuellar', 'Lucy', to_date('20030218','YYYYMMDD'), 'lcuellar@desarrollasoftware.com', NULL, 'C06', 101, 2000, NULL, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0012', 'Valencia', 'Hugo', to_date('20000501','YYYYMMDD'), 'hvalencia@desarrollasoftware.com', '9732-5601', 'C02', 105, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0013', 'Veliz', 'Fortunato', to_date('20000505','YYYYMMDD'), 'fveliz@desarrollasoftware.com', '9826-7603', 'C04', 105, 6000, NULL, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0014', 'Aguero', 'Octavio', to_date('20000515','YYYYMMDD'), 'oaguero@desarrollasoftware.com', NULL, 'C07', 105, 3000, 300, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0015', 'Rosales', 'Cesar', to_date('20030315','YYYYMMDD'), 'crosales@desarrollasoftware.com', NULL, 'C07', 105, 2500, 300, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0016', 'Villarreal', 'Nora', to_date('20000501','YYYYMMDD'), 'nvillarreal@desarrollasoftware.com', '9371-3641', 'C02', 103, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0017', 'Romero', 'Alejandra', to_date('20000503','YYYYMMDD'), 'aromero@desarrollasoftware.com', '8345-9526', 'C03', 103, 7500, NULL, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0018', 'Valdiviezo', 'Jennifer', to_date('20000612','YYYYMMDD'), 'jvaldiviezo@desarrollasoftware.com', '9263-5172', 'C06', 103, 2000, NULL, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0019', 'Muchotrigo', 'Omar', to_date('20000512','YYYYMMDD'), 'omuchotrigo@desarrollasoftware.com', '9963-5542', 'C05', 103, 3500, 500, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0020', 'Baltazar', 'Victor', to_date('20000518','YYYYMMDD'), 'vbaltazar@desarrollasoftware.com', '9893-4433', 'C05', 103, 3000, 800, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0021', 'Castillo', 'Ronald', to_date('20010518','YYYYMMDD'), 'rcastillo@desarrollasoftware.com', '9234-3487', 'C05', 103, 3000, 800, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0022', 'Espilco', 'Luis', to_date('20020417','YYYYMMDD'), 'lespilco@desarrollasoftware.com', '9554-3456', 'C05', 103, 3000, 300, 'E0016' );

-- ==========================================================
-- Cargar datos a la tabla: control
-- ==========================================================

INSERT INTO control ( parametro, valor ) VALUES ( 'Cargo', '9' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Ubicacion', '4' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Departamento', '107' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Empleado', '22' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Empresa', 'Desarrolla Software' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Site', 'www.devsoftware.com' );

COMMIT;

