DROP SCHEMA bb_db_bonzano;
CREATE SCHEMA bb_db_bonzano;
USE bb_db_bonzano;
 
-- TABLE CREATE banco_sangre
	
   CREATE TABLE banco_de_sangre (
		bankname_id VARCHAR(50) ,
        bank_adress VARCHAR (80) NOT NULL,
        bankunidad_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY NOT NULL 
        
    );


	-- TABLA UNIDAD
	CREATE TABLE unidad (
        unidad_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		rh 	TINYTEXT  NOT NULL,
        grupo_sang 	TINYTEXT NOT NULL

        );

-- TABLA DONANTE 
		CREATE TABLE donante (
		id_donante BIGINT NOT NULL AUTO_INCREMENT,
		fullname TINYTEXT NOT NULL,
		nacimiento DATE NOT NULL ,
		peso INT NOT NULL,
		email VARCHAR(45),
        fechadonac DATE NOT NULL, 
		
        FOREIGN KEY (id_donante) REFERENCES unidad (unidad_id)
    
		);
        
-- CHILD DE UNIDAD 
	
    CREATE TABLE tipo_unidad(
		tip_unid_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        tip_unid_fk BIGINT NULL, 
        plaquetas TINYTEXT ,
        sangre TINYTEXT,
        cerologia TINYTEXT NOT NULL,
        FOREIGN KEY (tip_unid_fk) REFERENCES unidad (unidad_id)
        );
        
       
-- TABLA HOSPITAL
	 

         CREATE TABLE hospital (
			pacientehp_legajo BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            nombre_hp VARCHAR (50) NOT NULL, 
            adress_hp VARCHAR (50) NOT NULL,
			pte_solicitiud INT NULL
			
);
            
            
-- PACIENTE TABLA

	CREATE TABLE pacientehp (
		legajo BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
        dni_pte VARCHAR(255),
        nombre_pt TINYTEXT NOT NULL,
        nac_pte DATE NOT NULL,
        legajo_hp BIGINT NULL,
       
       FOREIGN KEY (legajo_hp) REFERENCES  hospital (pacientehp_legajo)
	
        );
        
                
			-- tabla solicitud hosp banco
		
        CREATE TABLE hp_banco_solicitud(
        soplicitudbbpk INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
        solicitud_hp BIGINT NOT NULL,
        solicitud_bd BIGINT NOT NULL,
        
									-- Relacion bnaco de sangre hop solicitud 
        
			 FOREIGN KEY (solicitud_hp) REFERENCES  hospital (pacientehp_legajo),
             FOREIGN KEY (solicitud_bd) REFERENCES  banco_de_sangre (bankunidad_id)

  );
  
  
CREATE TABLE deposito_banco(
        doposito_bankpk BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
        unidad_storage BIGINT NOT NULL,
        unidad_bank BIGINT NOT NULL,
        
									-- Relacion UNIDAD-BANCO DE SANGRE 
        
			 FOREIGN KEY (unidad_storage) REFERENCES  banco_de_sangre (bankunidad_id),
             FOREIGN KEY (unidad_bank) REFERENCES  unidad (unidad_id)
             

             );
             
             
             
             -- TABLA TRANSPORTE 
	CREATE TABLE transporte_unid (
		transporte BIGINT NOT NULL PRIMARY KEY,
        solicitud_transporte DATE NOT NULL,
        unidad_transporte  INT NOT NULL
        
	);
    
		-- TABLA TIPO DE TRANSPORTE
	CREATE TABLE vehiculo (
     patente_vehiculo BIGINT NOT NULL,
     marca_transporte TINYTEXT NOT NULL,
     dni_chofer TINYINT NOT NULL,
	
    FOREIGN KEY (patente_vehiculo) REFERENCES transporte_unid (transporte) 
    
    );
    
     -- TABLA CHOFER UNID
     
     CREATE TABLE chofer_id (
     legajo_chofer BIGINT NOT NULL AUTO_INCREMENT,
     cuit_chofer INT NOT NULL,
     nac_chofer DATE NOT NULL,
     contacto_chofer varchar (50),
     carnet_conduc INT NOT NULL,
     
     FOREIGN KEY (legajo_chofer) REFERENCES transporte_unid (transporte) 


     
     );

    -- Relacion TRANSPORTE UNIDAD 
		
        CREATE TABLE solicit_aprob(
        solict_pk INT PRIMARY KEY NOT NULL, 
        transporte_a_hp BIGINT NOT NULL,
        unidad_a_transportar BIGINT NOT NULL,
        
									-- TRANSPORTE A HOSPITAL
        
			 FOREIGN KEY (transporte_a_hp) REFERENCES  HOSPITAL (pacientehp_legajo),
             FOREIGN KEY (unidad_a_transportar) REFERENCES  transporte_unid (transporte)
             
	);
