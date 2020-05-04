

module leg() {
    difference() {
        cube([5,80,35]);
        union() {
            translate([-1, 10, 32])
                union() {
                    rotate([0,90,0])
                        cylinder(10, r=4);
                    
                    translate([0,-4,0])
                        cube([8,8,8]);
                }
                
            translate([-1, 70, 32])
                union() {
                    rotate([0,90,0])
                        cylinder(10, r=4);
                    
                    translate([0,-4,0])
                        cube([8,8,8]);
                }

        }
    }
}

module uiCupsStand() {
    translate([-25,-10,0])
        leg();

    translate([152,-10,0])
        leg();

    translate([-25, 15, 0])
        cube([180,30,5]);
}
