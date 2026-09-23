$fn=128;
// parameter:
r1 = 20;            // radius of torus
r2 = 4;         // radius of polygon/ thickness of torus
s = 360;            // sections per 360 deg
p = 128;          // points on polygon
a = 30;                 // angle of the first point on Polygon

numero_ext = 3;
numero_int = 14;


// points on cross-section
// angle = 360*i/p + startangle, x = r2*cos(angle), y = 0, z = r2*sin(angle)
function cs_point(i) = [r1 + r2*cos(360*i/p + a), 0, r2*sin(360*i/p + a)];

// returns to the index in the points - vector the section number and the number of the point on this section
function point_index(i) = [floor(i/p), i - p*floor(i/p)];

// returns the points  x-, y-, z-coordinates by rotatating the corresponding point from crossection around the z-axis 
function iterate_cs(i) = [cs[point_index(i)[1]][0]*cos(360*floor(i/p)/s), cs[point_index(i)[1]][0]*sin(360*floor(i/p)/s), cs[point_index(i)[1]][2]];

// for every point find neighbour points to build faces, ( + p: point on the next cross-section), points ordered clockwise
// to connect point on last section to corresponding points on first section 
function item_add1(i) = i >= (s - 1)*p ? -(s)*p : 0; 
// to connect last point on section to first points on the same and the next section
function item_add2(i) = i - p*floor(i/p) >= p-1 ? -p : 0;
// build faces
function find_neighbours1(i) = [i, i + 1 + item_add2(i), i + 1 + item_add2(i) + p + item_add1(i)];
function find_neighbours2(i) = [i, i + 1 + + item_add2(i) + p + item_add1(i), i + p + item_add1(i)];

cs = [for (i = [0:p-1]) cs_point(i)];
points = [for (i = [0:s*p - 1]) iterate_cs(i)];
faces1 = [for (i = [0:s*p - 1]) find_neighbours1(i)];
faces2 = [for (i = [0:s*p - 1]) find_neighbours2(i)];
faces = concat(faces1, faces2);

module letterBox(txt=16, cadre =true)
{

	if(cadre){
		
		difference()
		{
			cylinder(h=2, d=1.25*r2, center=true);
			linear_extrude(height = 3, center = true)
			{
				text(str(txt), size = 0.5*r2, font = "Liberation Sans",halign="center", valign="center");
			}
			
		}
	
	}
	else {
		linear_extrude(height = 3, center = true)
			{
				text(str(txt), size = r2, font = "Liberation Sans",halign="center", valign="center");
			}
	}
}







module quartExterieur(){

	translate([r1+(r2*0.75),0,r2/1.4]) rotate([45,0,90])
		letterBox(numero_ext,true);
		
		rotate([0,0,-45])
	difference()
	{
		intersection()
		{
		cube([r1+r2,r1+r2,r2]);
		polyhedron(points = points, faces = faces);
		}
		cylinder(h=2*r2, r=r1, center = true);
	}
}

module quartInterieur(){

	union(){
		translate([r1-(r2*0.75),0,r2/1.4]) rotate([45,0,-90])
		letterBox(numero_int,true);
		
		rotate([0,0,-45])
		intersection()
		{
		cylinder(h=2*r2, r=r1, center = true);
		cube([r1+r2,r1+r2,r2]);
		polyhedron(points = points, faces = faces);
		}
	}
}

color("red",1.0) quartInterieur();

rotate([0,0,180])
color("blue",1.0) quartExterieur();
