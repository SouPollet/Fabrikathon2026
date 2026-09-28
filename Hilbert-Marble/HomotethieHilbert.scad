sizeCube = 200;
module modele()
{
	import("/Users/pollet1/Documents/GitHub/Fabrikathon2026/Hilbert-Marble/Blender_Stl/Untitled-P_Descendant.stl",center=true);
}
  
  
module modeleA()
{
	intersection(){
		translate([0,0,10.7]) modele();
		translate([-sizeCube/2,-sizeCube/2,0]) cube(sizeCube);
		
	}
}

module modeleB()
{
	difference(){
		translate([0,0,10.7]) modele();
		translate([-sizeCube/2,-sizeCube/2,0]) cube(sizeCube);
		
	}
}
//color("blue")
//modeleA();
//modeleB();

module homotethieA(){
	scale([1/2,1/2,1/3]) modeleA();
}

//homotethieA();
//modeleB();

module demiB(){
	intersection(){
		cube(64, center = true);
		modeleB();
	}
}

union(){
homotethieA();
cadre();
demiB();
}

module cadre(){
	translate([0,0,0-2.3])
	difference()
	{	
		cube([64,64,1.8], center = true);
		cube([64-(2*1.8),64-(2*1.8),3], center = true);
	}
}

