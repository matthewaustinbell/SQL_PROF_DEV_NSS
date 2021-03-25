-- Adding 5 brand new 2021 Honda CR-Vs to the inventory. They have I4 engines and are classified as a Crossover SUV or CUV.
-- All of them have beige interiors but the exterior colors are
-- Lilac, Dark Red, Lime, Navy and Sand. The floor price is $21,755 and the MSR price is $18,999.

do $$ 
DECLARE 
  NewVehicleId integer;
 	NewVehicleBodyTypeID integer;
	NewVehicleModelID integer;
	NewVehicleMakeID integer;
	NewVehicleTypeID integer;
	
BEGIN

INSERT INTO public.vehiclebodytypes(name)
	VALUES ('CUV')
	RETURNING vehicle_body_type_id INTO NewVehicleBodyTypeID ;

INSERT INTO public.vehiclemodels(name)
	VALUES ('CR-Vs')
	RETURNING vehicle_model_id INTO NewVehicleModelID ;

INSERT INTO public.vehiclemakes(name)
	VALUES ('Honda')
	RETURNING vehicle_make_id INTO NewVehicleMakeID ;	
	
INSERT INTO public.vehicletypes(
	body_type_id, model_id, make_id)
	VALUES (
	NewVehicleBodyTypeID ,
	NewVehicleModelID ,
	NewVehicleMakeID ) 
	RETURNING vehicle_type_id INTO NewVehicleTypeID ;

INSERT INTO public.vehicles(
	vin,
	engine_type,
	vehicle_type_id,
	exterior_color,
	interior_color, 
	floor_price,
	msr_price,
	miles_count,
	year_of_car)
	VALUES ( '456789', 'I4', NewVehicleTypeID, 'Lilac', 'beige', 21755, 18999, 0, 2021),
	( '9876', 'I4', NewVehicleTypeID, 'Dark Red', 'beige', 21755, 18999, 0, 2021),
	( '56700', 'I4', NewVehicleTypeID, 'Lime', 'beige', 21755, 18999, 0, 2021),
	( '1234', 'I4', NewVehicleTypeID, 'Navy', 'beige', 21755, 18999, 0, 2021),
	( '9876', 'I4', NewVehicleTypeID, 'Sand', 'beige', 21755, 18999, 0, 2021);

-- ROLLBACK;
 COMMIT;
END;

$$ language plpgsql;