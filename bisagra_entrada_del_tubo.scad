/******************************************************/
/* peristaltic extruder for 3d printing     		  */
/* file: bisagra_entrada_del_tubo.scad			 	  */
/* author: luis rodriguez				 	          */
/* version: 0.2						 		          */
/* w3b: tiny.cc/lyu     					 		  */
/* info:				    				 		  */
/******************************************************/
// @todo: - 

use <modulo_bisagra.scad>

/* ~~ Parámetros ~~ */

altura = 10;
radio_exterior = 36;
radio_interior = 24;

ancho_boquilla = 10;
largo_boquilla = 20;

radio_bisagra = 8;
diametro_tornillo = 3.4;

radio_tubo = 3;

//suavizar_salida_tubo = 10;
grosor_pared_pinza = 2;
altura_pinza = 6;
holgura_pinza = 0.3;


/* ~~ Pieza ~~ */

difference(){
	bisagra_extrusor( altura , radio_exterior , radio_interior ,
		ancho_boquilla, largo_boquilla , radio_bisagra ,
		diametro_tornillo , radio_tubo );

// Taladro entrada del tubo
color("LightSlateGray")
translate( [ radio_exterior*0.707 , -radio_exterior*0.707 , altura/2 ] )
rotate(a=[0,90,-45]) { 
	cylinder( r = radio_tubo , largo_boquilla , $fn = 100, center = true );
}
}

// Pinza entre bisagras

difference(){
// Exterior
cube( [ altura + ( holgura_pinza + grosor_pared_pinza ) * 2 ,
  ( ancho_boquilla + holgura_pinza + grosor_pared_pinza ) * 2, 
  altura_pinza + grosor_pared_pinza ]);
  // Interior
  translate([ grosor_pared_pinza , grosor_pared_pinza, grosor_pared_pinza]){
cube( [ altura + holgura_pinza * 2 ,
  ( ancho_boquilla + holgura_pinza ) * 2, 
  altura_pinza  ]);  }
  
  // Agujero tubo out
  translate([ (altura + ( holgura_pinza + grosor_pared_pinza ) * 2 ) / 2,
  ancho_boquilla + holgura_pinza + grosor_pared_pinza,
  0]){
  cylinder( r = radio_tubo , largo_boquilla , $fn = 100, center = true );
  }
  
  
  }
  