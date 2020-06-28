-- ==================================== TABLES ====================================
CREATE TABLE ROL (
    ID_ROL NUMBER(15) NOT NULL,
    NOMBRE VARCHAR2(50) NOT NULL,
    DESCRIPCION VARCHAR2(70) NOT NULL,
    CONSTRAINT PK_ROL PRIMARY KEY (ID_ROL)
);

CREATE TABLE USUARIO (
    ID_USUARIO NUMBER(15) NOT NULL,
    CLAVE  VARCHAR2(50),
    CORREO VARCHAR2(50) NOT NULL,
    NOMBRE VARCHAR2(50) NOT NULL,
    AP_PATERNO VARCHAR2(50) NOT NULL,
    AP_MATERNO VARCHAR2(50),
    NOMBRE_COMPLETO VARCHAR2(150) NOT NULL,
    TELEFONO VARCHAR2(10) NOT NULL,
    -- ACTIVO, ELIMINADO, BLOQUEADO
    ESTATUS VARCHAR2(30) NOT NULL,
    FALLOS NUMBER(1) NOT NULL,
    CONSTRAINT PK_USUARIO PRIMARY KEY (ID_USUARIO),
    CONSTRAINT UC_USUARIO UNIQUE (CORREO)
);

CREATE TABLE ROL_USUARIO (
    ID_ROL NUMBER(15) NOT NULL,
    ID_USUARIO NUMBER(15) NOT NULL,
    CONSTRAINT PK_ROL_USUARIO PRIMARY KEY (ID_ROL, ID_USUARIO),
    CONSTRAINT FK_RU_ROL FOREIGN KEY (ID_ROL)
        REFERENCES ROL(ID_ROL),
    CONSTRAINT FK_RU_USUARIO FOREIGN KEY (ID_USUARIO)
        REFERENCES USUARIO(ID_USUARIO)
);

-- ====================================== SEQUENCES ======================================
CREATE SEQUENCE SEQ_ROL
START WITH 1
INCREMENT BY 1 NOCACHE NOCYCLE;


CREATE SEQUENCE SEQ_USUARIO
START WITH 1
INCREMENT BY 1 NOCACHE NOCYCLE;
