// source image
image="litho.png";

// lithophane height
//H = 2.6;
H = 2.6;

// dimensions
L = 80;
W = 80;

// border width
T = 1.2;

// bottom height
O = 0.8;

// border inset
C = 0.4;

// scale of image
S = .04;

need_frame = true;
need_crop = true;

module frame() {
    difference() {
        translate([-T/2, -T/2, 0])
            cube([L+T, W+T, H + O]);
        translate([C/2, C/2, 0])
            cube([L-C, W-C, H+O*2]);
    }
    
        cube([L, W, O]);
}

	if(need_crop){
		intersection()
		{
				cube([L,W, H*2]);
				translate([L/2, W/2, O])
				scale([S, S, H/100])
					surface(file = image, center = true, invert = false, convexity = 5);
		}
	}
	else{
		translate([L/2, W/2, O])
				scale([S, S, H/100])
					surface(file = image, center = true, invert = false, convexity = 5);
	}


if(need_frame)
	frame();