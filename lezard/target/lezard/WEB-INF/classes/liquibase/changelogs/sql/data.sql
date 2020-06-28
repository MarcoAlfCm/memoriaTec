-- ====================================== ROLES ======================================
INSERT INTO ROL (ID_ROL, NOMBRE, DESCRIPCION) VALUES (SEQ_ROL.NEXTVAL, 'ROLE_ADMINISTRADOR', 'ADMINISTRADOR');
INSERT INTO ROL (ID_ROL, NOMBRE, DESCRIPCION) VALUES (SEQ_ROL.NEXTVAL, 'ROLE_MAESTRO', 'MAESTRO');
INSERT INTO ROL (ID_ROL, NOMBRE, DESCRIPCION) VALUES (SEQ_ROL.NEXTVAL, 'ROLE_ALUMNO', 'ALUMNO');

-- ====================================== USUARIOS ======================================
INSERT INTO USUARIO (ID_USUARIO,CLAVE,CORREO ,NOMBRE, AP_PATERNO, AP_MATERNO, NOMBRE_COMPLETO,TELEFONO, ESTATUS, FALLOS)
VALUES (SEQ_USUARIO.NEXTVAL,'177368', 'macampos@gmail.com' ,'MARCO ALFREDO', 'CAMPOS', 'MENDOZA', 'MARCO ALFREDO CAMPOS MENDOZA','4423839814','ACTIVO', 0);

-- ====================================== ROLES_USUARIOS ======================================
INSERT INTO ROL_USUARIO(ID_ROL, ID_USUARIO) VALUES (1, 1);


COMMIT;