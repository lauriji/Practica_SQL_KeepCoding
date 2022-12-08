
---1.  Nombre modelo, marca y grupo de coches (los nombre de todos)
---2. Fecha de compra
---3. Matricula
---4.  Nombre del color del coche
---5.  Total kilómetros
---6.  Nombre empresa que esta asegurado el coche
---7.  Numero de póliza
		  

SELECT cf.car_id, cm.model_name , cm.brand_name , cm.manufacturer , cf.purchase_dt, cf.plate_number, cc.name, cf.total_km, id.policy_number 
FROM laurajimenez.car_fleet cf
     INNER JOIN laurajimenez.car_manufacturer cm
ON cf.model_id  = cm.model_id
     INNER JOIN laurajimenez.color_codes cc
ON cf.color_id  = cc.color_id
     INNER JOIN laurajimenez.hist_car_insurance hci 
ON hci.car_id  = cf.car_id
 	INNER JOIN laurajimenez.insurance_details id 
ON id.policy_id = hci.policy_id  

