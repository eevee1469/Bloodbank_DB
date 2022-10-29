create SCHEMA bb_db_bonzano;
USE bb_db_bonzano;
 
-- TABLE CREATE banco_sangre
	
   CREATE TABLE banco_de_sangre (
		bankname_id VARCHAR(16) ,
        bank_adress VARCHAR (80) NOT NULL,
        bankunidad_id INT NOT NULL PRIMARY KEY NOT NULL
        
    );


	-- TABLA UNIDAD
	CREATE TABLE unidad (
        unidad_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		rh 	TINYTEXT  NOT NULL,
        grupo_sang 	TINYTEXT NOT NULL

        );

-- TABLA DONANTE 
		CREATE TABLE donante (
		id_donante INT NOT NULL AUTO_INCREMENT,
		fullname TINYTEXT NOT NULL,
		nacimiento DATE NOT NULL ,
		peso INT NOT NULL,
		email VARCHAR(45),
		FOREIGN KEY (id_donante) REFERENCES unidad (unidad_id)
    
		);
        
-- CHILD DE UNIDAD 
	
    CREATE TABLE tipo_unid(
		tip_unid_id INT  NOT NULL, 
        plaquetas TINYTEXT ,
        sangre TINYTEXT,
        cerologia TINYTEXT NOT NULL,
        FOREIGN KEY (tip_unid_id) REFERENCES unidad (unidad_id)
        
        );
        
       
-- TABLA HOSPITAL
	 

         CREATE TABLE hospital (
			nombre_hp VARCHAR (50) NOT NULL, 
            adress_hp VARCHAR (50) NOT NULL,
			pte_solcitiud INT NOT NULL,
				pacientehp_legajo INT NOT NULL PRIMARY KEY
            );
            
            
-- PACIENTE TABLA

	CREATE TABLE pacientehp (
		legajo INT AUTO_INCREMENT,
        dni_pte TINYINT,
        nombre_pt TINYTEXT NOT NULL,
        nac_pte DATE NOT NULL,
       
       FOREIGN KEY (legajo) REFERENCES  hospital (pacientehp_legajo)
	
        );
        
                
			-- tabla solicitud hosp banco
		
        CREATE TABLE hp_banco_solicitud(
        solicitud_hp INT NOT NULL,
        solicitud_bd INT NOT NULL,
        
									-- Relacion bnaco de sangre hop solicitud 
        
			 FOREIGN KEY (solicitud_hp) REFERENCES  hospital (pacientehp_legajo),
             FOREIGN KEY (solicitud_bd) REFERENCES  banco_de_sangre (bankunidad_id)

  );
  
  
CREATE TABLE deposito_banco(
        unidad_storage INT NOT NULL,
        unidad_bank INT NOT NULL,
        
									-- Relacion UNIDAD-BANCO DE SANGRE 
        
			 FOREIGN KEY (unidad_storage) REFERENCES  banco_de_sangre (bankunidad_id),
             FOREIGN KEY (unidad_bank) REFERENCES  unidad (unidad_id)
             

             );
             
             
             
             -- TABLA TRANSPORTE 
	CREATE TABLE transporte_unid (
		transporte TINYINT NOT NULL PRIMARY KEY,
        solicitud_transporte DATE NOT NULL,
        unidad_transporte  INT NOT NULL
        
	);
    
		-- TABLA TIPO DE TRANSPORTE
	CREATE TABLE vehiculo (
     patente_vehiculo TINYINT NOT NULL,
     marca_transporte TINYTEXT NOT NULL,
     dni_chofer TINYINT NOT NULL,
	
    FOREIGN KEY (patente_vehiculo) REFERENCES transporte_unid (transporte) 
    
    );
    
     -- TABLA CHOFER UNID
     
     CREATE TABLE chofer_id (
     legajo_chofer TINYINT NOT NULL AUTO_INCREMENT,
     cuit_chofer INT NOT NULL,
     nac_chofer DATE NOT NULL,
     contacto_chofer varchar (50),
     carnet_conduc INT NOT NULL,
     
     FOREIGN KEY (legajo_chofer) REFERENCES transporte_unid (transporte) 


     
     );

    -- Relacion TRANSPORTE UNIDAD 
		
        CREATE TABLE solicit_aprob(
        transporte_a_hp INT NOT NULL,
        unidad_a_transportar TINYINT NOT NULL,
        
									-- TRANSPORTE A HOSPITAL
        
			 FOREIGN KEY (transporte_a_hp) REFERENCES  HOSPITAL (pacientehp_legajo),
             FOREIGN KEY (unidad_a_transportar) REFERENCES  transporte_unid (transporte)
             
	);

             
	
  
