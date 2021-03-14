use <roundedcube.scad>
use <screw_countersunk.scad>

// Drilling template from Fanatec:
// https://fanatec.com/media/pdf/fd/d4/ae/CS-Handbrake_DrillingTemplate.pdf
// 

$fn = 60;
$fs = 0.1;

baseW = 60;

difference() {
  roundedcube([154,baseW,8], radius = 3, apply_to="z");
  translate([12,12.5,0]) 
    m6(l=16);
  translate([12,baseW - 12.5,0])
    m6(l=16);
  translate([142,baseW/2,0])
    m6(l=16);
}

translate([154,(baseW/2) - 15,0])
  support();

translate([0,(baseW/2) - 15,0])
  mirror([1,0,0])
    support();

module support() {
  union() {
    translate([-3,0,0])
      difference() {
        roundedcube([30,30,8], radius = 3, apply_to="z");
        translate([15,15,8])
          mirror([0,0,1])
            m6();
      }
    translate([0,-12,0])
      difference() {
        cube([12,12,8]);
        translate([12,0,-1])
          cylinder(12, r = 12);
      }
    translate([0,30,0])
      difference() {
        cube([12,12,8]);
        translate([12,12,-1])
          cylinder(12, r = 12);
      }
  }
}

module m6(l = 16) {
  screw_countersunk(l, dh=13.44, lh=4, ds=6.3);
}