//hc-sr04 sensor mount plates with cutouts for transducers.
// This is a 2d version - for extruding or otherwise projecting on your own designs.
module hcsr04_mount() {
	difference() {
		square([45, 20], center=true);
		translate([13.5, 0, 0]) circle(8);
		translate([-13.5, 0, 0]) circle(8);
	}
}

//hcsr04_mount();
