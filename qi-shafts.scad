
module qiShaftArm() {
    difference() {
        union() {
            cylinder(5, r=5);
            
            translate([15, 0, 0])
                cylinder(3, r=4);
            
            translate([4, -3, 0])
                cube([11, 6, 3]);
        }
        
        union() {
            translate([0, 0, 3])
                cylinder(5, r=3.4);
            
            translate([0, 0, -2])
                cylinder(7, r=1);
            
            translate([15, 0, -1])
                cylinder(5, r=2.2);
        }
    }
}

module qiShaftTransmission() {
    difference() {
        union() {
            cylinder(3, r=4);
            
            translate([30, 0, 0])
                cylinder(3, r=3);
            
            translate([0, -3, 0])
                cube([30, 6, 3]);
        }
        
        union() {            
            translate([0, 0, -2])
                cylinder(7, r=2.2);
            
            translate([30, 0, -1])
                cylinder(5, r=0.7);
        }
    }
}

module qiShafts() {
    qiShaftArm();

    for(i = [0 : 1]) {
        translate([0, i * -15, 0])
            qiShaftArm();
        
        translate([30, i * -15, 0])
            qiShaftTransmission();
    }
}


translate([-10, 50, 0])
    qiShafts();