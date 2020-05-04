difference() {
    union() {
        cylinder(30, r=12);
        
        translate([-20, -20, 0])
            cube([120, 40, 5]);
        
          
        translate([85, -20, 4.4])
            rotate([0, 25, 0])
                cube([9, 40, 5]);
      
        
        translate([40, -10, 5])
            cube([10, 20, 45]);
         
        translate([50, -10, 5])
            cube([2, 20, 23]);
        
       
    }
    
    union() {
        translate([0,0, 5])
            cylinder(26, r=9);
        
        translate([0,0, -5])
            cylinder(26, r=2);
        
        translate([25, 0, -5])
            cylinder(26, r=2.7);
        
        translate([75, 0, -5])
            cylinder(26, r=2.7);
        
        translate([42.1, -8, 18])
            cube([8, 16, 33]);
        
        translate([45, -5, -1])
            cube([4, 10, 33]);
              
        translate([48, -4, 22])
            rotate([0, 90,0])
                cylinder(5, r=2);

    }

}

 