L=2000; //Le cube est de largeur 3L
H=6000; //le cube est de hauteur  H
//translate([-20,0,0]) cube([10,5,5]);

esc4();
/*
difference()
{translate ([0,0,0]) esc0();
    translate([3*L/2,3*L/2,-1]) cylinder(h=2000,r=425);
}
*/

//translate([0,0,0]) esc1();

//difference()
//{translate ([0,0,0]) esc1();
//    translate([3*L/2,3*L/2,-1]) cylinder(h=H/3,r=425);
//}

//translate([0,0,0]) esc2();

//difference()
//{translate ([0,0,0]) esc2();
//    translate([3*L/2,3*L/2,-1]) cylinder(h=H/3,r=425);
//}

//translate ([0,0,0]) esc3();

//difference()
//{translate ([0,0,0]) esc3();
//    translate([3*L/2,3*L/2,-1]) cylinder(h=2000,r=425);
//}

//translate ([0,0,0]) esc4();

//difference()
//{translate ([0,0,0]) esc4();
//    translate([3*L/2,3*L/2,-1]) cylinder([0,0],h=2000,r=425);
//}




module esc0(){
    render(){
    translate([0,L,0]) cube([L,L,H/9]);
    translate([0,2*L,0]) cube([L,L,2*H/9]);
    translate([L,2*L,0]) cube([L,L,3*H/9]);
    translate([L,L,0]) cube([L,L,4*H/9]);
    translate([L,0,0]) cube([L,L,5*H/9]);
    translate([2*L,0,0]) cube([L,L,6*H/9]);
    translate([2*L,L,0]) cube([L,L,7*H/9]);
    translate([2*L,2*L,0]) cube([L,L,8*H/9]);
    }
}

module marche1(){
    scale([1/3,1/3,1/9])  esc0();
}    
module revmarche1(){
    translate([L,0,0]) scale([-1/3,1/3,1/9])  esc0();
}    
module symmarche1(){
    translate([0,L,0]) scale([1/3,-1/3,1/9])  esc0();
}    
module revsymmarche1(){
    translate([L,L,0]) scale([-1/3,-1/3,1/9])  esc0();
}    

module esc1(){
    render(){
     esc0();
    marche1();
    translate([0,L,H/9]) revmarche1();
    translate([0,2*L,2*H/9]) marche1();
    translate([L,2*L,3*H/9]) symmarche1();
    translate([L,L,4*H/9]) revsymmarche1();
    translate([L,0,5*H/9]) symmarche1();
    translate([2*L,0,6*H/9]) marche1();
    translate([2*L,L,7*H/9]) revmarche1();
    translate([2*L,2*L,8*H/9]) marche1();
    }
}
module marche2(){
    scale([1/3,1/3,1/9])  esc1();
}
module revmarche2(){
    translate([L,0,0]) scale([-1/3,1/3,1/9])  esc1();
}    
module symmarche2(){
    translate([0,L,0]) scale([1/3,-1/3,1/9])  esc1();
}    
module revsymmarche2(){
    translate([L,L,0]) scale([-1/3,-1/3,1/9])  esc1();
}    
module esc2(){
    render(){
     esc0();
    marche2();
    translate([0,L,H/9]) revmarche2();
    translate([0,2*L,2*H/9]) marche2();
    translate([L,2*L,3*H/9]) symmarche2();
    translate([L,L,4*H/9]) revsymmarche2();
    translate([L,0,5*H/9]) symmarche2();
    translate([2*L,0,6*H/9]) marche2();
    translate([2*L,L,7*H/9]) revmarche2();
    translate([2*L,2*L,8*H/9]) marche2();
    }
}
module marche3(){
    scale([1/3,1/3,1/9])  esc2();
}
module revmarche3(){
    translate([L,0,0]) scale([-1/3,1/3,1/9])  esc2();
}     
module symmarche3(){
    translate([0,L,0]) scale([1/3,-1/3,1/9])  esc2();
}    
module revsymmarche3(){
    translate([L,L,0]) scale([-1/3,-1/3,1/9])  esc2();
}    
module esc3(){
    render(){
     esc0();
    marche2();
    translate([0,L,H/9]) revmarche3();
    translate([0,2*L,2*H/9]) marche3();
    translate([L,2*L,3*H/9]) symmarche3();
    translate([L,L,4*H/9]) revsymmarche3();
    translate([L,0,5*H/9]) symmarche3();
    translate([2*L,0,6*H/9]) marche3();
    translate([2*L,L,7*H/9]) revmarche3();
    translate([2*L,2*L,8*H/9]) marche3();
    }
}
module marche4(){
    scale([1/3,1/3,1/9])  esc3();
}

module revmarche4(){
    translate([L,0,0]) scale([-1/3,1/3,1/9])  esc3();
}     
module symmarche4(){
    translate([0,L,0]) scale([1/3,-1/3,1/9])  esc3();
}    
module revsymmarche4(){
    translate([L,L,0]) scale([-1/3,-1/3,1/9])  esc3();
}    
module esc4(){
    render(){
     esc0();
    marche4();
    translate([0,L,H/9]) revmarche4();
    translate([0,2*L,2*H/9]) marche4();
    translate([L,2*L,3*H/9]) symmarche4();
    translate([L,L,4*H/9]) revsymmarche4();
    translate([L,0,5*H/9]) symmarche4();
    translate([2*L,0,6*H/9]) marche4();
    translate([2*L,L,7*H/9]) revmarche4();
    translate([2*L,2*L,8*H/9]) marche4();
    }
}


