ldd = 1;

//all these in ldu's
stud_out_diam = 3.0;
stud_in_diam = 2;
stud_height = 1;
pin_diam = 3.0;
pin_rim_diam = 3.5;
brick_width = 5.0;
brick_height = 6.0;
plate_height = 2.0;
skin_width = 1.0;
white = [1,1,1];
trans_red = [1,0,0, 0.2];

module closed_stud() {
	//outer cylinder
	cylinder( h = stud_height, r = stud_out_diam /2);
}

module open_stud() {
	difference () {
		closed_stud();
		//inner cylinder
		cylinder( h = stud_height, r = stud_in_diam /2);
	}
}

module plate1by1() {
	inner_width = brick_width - (skin_width * 2);
	half_width = brick_width / 2;
	difference() {
		union() {
			difference() {
				cube(size = [brick_width, brick_width, plate_height]);
				translate(v = [skin_width, skin_width, -0.1]) {
					cube(size = [inner_width, inner_width,
				 		plate_height - skin_width + 0.2]);
				}
			}
			translate(v = [half_width, half_width, plate_height]) {
				closed_stud();
			}
		}
		translate(v=[half_width, half_width, plate_height - skin_width]) {
			cylinder( h = skin_width, r = skin_width );
		}
	}
}

scale(ldd) {
	color(trans_red) plate1by1();
	translate(v=[0, 0, plate_height]) {
		color(white)
		plate1by1();
	}
}
