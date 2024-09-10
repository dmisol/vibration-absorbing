PrintMic = false;//true;

H = 15;

Dmic = 9.8;
Dspk = 11.9;

module frame(){
minkowski(){
    cylinder(d=3,h=H/2,$fn=32, center=true);
    cube([25.5+5, 35,H/2],center=true);
    }
}

module spring(){
    difference(){
        cylinder(d=18,h=15,$fn=128);
        translate([0,0,10])cylinder(d1=12,d2=15,h=5,$fn=64);
    }
}
difference(){
    frame();
    difference(){
        translate([-25.5/2,-13,-H/2-0.1]) cube([25.5,25,H+0.2]);
        rotate(90,[1,0,0]) translate ([0,0,10]) cylinder(d=18,h=10,$fn=128);
    }
    rotate(90,[1,0,0]) cylinder(d=5.5, h=40, center=true, $fn=32);
    rotate(90,[1,0,0]) spring();    

    if (PrintMic){
        rotate(-90,[1,0,0]) cylinder(d=Dmic,h=50,$fn=128);

        translate([4.8,0,9.7/2]) rotate(-90,[1,0,0]) cylinder(d=2.4,h=50,$fn=16);
        translate([4.8,0,-9.7/2]) rotate(-90,[1,0,0]) cylinder(d=2.4,h=50,$fn=16);
    } else {
        rotate(-90,[1,0,0]) cylinder(d=Dspk,h=50,$fn=128);
    }

}