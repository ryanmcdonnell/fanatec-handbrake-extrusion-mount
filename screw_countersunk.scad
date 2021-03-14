// Based on https://gist.github.com/Stemer114/af8ef63b8d10287c825f
// model countersunk screw for 3d printing
// useful for creating attachement bores
// which fit these screws
// default values are for 3mm x 20mm screw with 6mm head (3.2mm bore for tolerance)
module screw_countersunk(
        l=20,   //length
        dh = 6,   //head dia
        lh = 3,   //head length
        ds = 3.2,  //shaft dia
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        translate([0,0,lh - 0.01])
          cylinder(h=l + 0.01, d=ds);
        translate([0,0,-1])
          cylinder(h=1.01, d=dh);
    }
}