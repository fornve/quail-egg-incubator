include <qi-cups.scad>;
include <qi-cups-stand.scad>;

/*
color("red") {
    translate([0,0,35])
        qiCups();
    
    translate([0,60,35])
        qiCups();
}

color("green")
    uiCupsStand();
*/


module qiServoMount() {
    difference() {
        union() {
            translate([20, 0, 0])
                cube([45, 50, 5]);
            
            translate([40,0,5])
                cube([10,50,31]);
        }
        
        union() {
            translate([35,7,25])
                cube([20,24.5,20]);
            
            translate([45,25,32])
                rotate([90,90,90])
                    servo();
            
            translate([35,5,32])
                rotate([0,90,0])
                    cylinder(20, r=1.2);
            
            translate([35,33.6,32])
                rotate([0,90,0])
                    cylinder(20, r=1.2);
            
            translate([44.5,2.5,25])
                cube([3.5,34,20]);

        }
    }
}


translate([-90,5,0])
    qiServoMount();

