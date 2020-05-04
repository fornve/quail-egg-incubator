module rod(rotatex,movex, movey) {
    translate([movex, movey, 0])
        rotate([rotatex,90,0])
            cylinder(h=150, r=1);
}

difference() {
//    cube([150,150,10]);
    translate([1,1,1])
        union() {
           for(i = [0 : 21]) {
             rod(0, 0, i * 7.1);
           }
           
           for(i = [0 : 21]) {
             rod(-90, i * 7.1, 0);
           }

        }
    
}
