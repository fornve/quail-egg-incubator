module cup() {
    difference() {
        difference() {
            union() {
                sphere(r=18);

            }
            
            translate([-40,-40,5]) {
                cube(80);
            }
        }
        union() {
            translate([-25,-25,-30])
                cube([50,50,20]);
            
            sphere(r=15);
            
                        
            translate([-40,40,-2])
                rotate([45,90,0])
                    cylinder(80, r=4);
            
            translate([-40,-40,-2])
                rotate([-45,90,0])
                    cylinder(80, r=4);
            
            translate([0,40,-2])
                rotate([90,90,0])
                    cylinder(80, r=4);

        }
    }
}

module qiCups() {
    union() {
        translate([0, 0, 0]) 
            cup();

        translate([33, 0, 0]) 
            cup();

        translate([66, 0, 0]) 
            cup();

        translate([99, 0, 0]) 
            cup();

        translate([132, 0, 0]) 
            cup();
        
        translate([-26,0,0])
            rotate([0,90,0])
                difference() {
                    cylinder(10, r=3.3);
                    translate([0,0,-5])
                        cylinder(13, r=1);
                }
                
        translate([-26,-0.6,2])
            cube([10,1.2,3]);
        
        translate([150,0,0])
            rotate([0,90,0])
                 difference() {
                    cylinder(10, r=3.3);
                    translate([0,0,5])
                        cylinder(13, r=1);
                }
                
        translate([148,-0.6, 2])
            cube([12,1.2, 3]);

    }
}
