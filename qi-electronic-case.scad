module shitInside() {
    //relays
    cube([77,58,20]);
        
    // nodemcu
    translate([90, 0, 0])
        cube([28,50,20]);
}

module case() {
    difference() {
        union() {
            // bottom
            translate([-5,-5,-5])
                cube([130,68,3]);

            // front
            translate([-5,-5,-5])
                cube([130,3,30]);

            // back
            translate([-5,60,-5])
                cube([130,3,30]);
                
            // left
            translate([-5,-5,-5])
                cube([3,68,30]);
                
            // right
            translate([122,-5,-5])
                cube([3,68,30]);
                
            // middle
            translate([80,-5,-5])
                cube([3,68,10]);
        }
        
        union() {
            
            translate([104,2,7])
                rotate([90,0,0])
                    cylinder(10, r=6);

            translate([15,67,7])
                rotate([90,0,0])
                    cylinder(10, r=6);

            translate([30,67,7])
                rotate([90,0,0])
                    cylinder(10, r=6);


            translate([47,67,7])
                rotate([90,0,0])
                    cylinder(10, r=6);

            translate([62,67,7])
                rotate([90,0,0])
                    cylinder(10, r=6);


            translate([104,67,7])
                rotate([90,0,0])
                    cylinder(10, r=6);

        }
    }

}

/*
color("blue", 0.7)   
    shitInside();
*/

color("silver", 0.5)
    case();
