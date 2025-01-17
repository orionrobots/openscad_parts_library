module slot_2d(neck_width, material_thickness, slot_top_width, slot_base_width, slot_depth) {
    // Create the profile of a single slot
    //    The opening, or neck goes from the slot out to the surface.
    //    The slot is a rectangle with a trapezoidal cross section.
    //    The top width, faces the surface, and the base width is the width at the bottom.
    //    slot_depth is the depth of the trapezoid.
    fillet = 0.5;
    offset(r = -fillet) offset(r = +fillet) {
        union() {
            /* make the neck */
            translate([0, material_thickness/2 ,0]) {
                square(size=[neck_width, material_thickness+1], center=true);
            }
            /* simple rect slot */
            translate([0, material_thickness, 0]) {
                // trapezoid(size=[slot_top_width, slot_base_width, slot_depth], center=true);
                // square(size=[slot_top_width, slot_depth], center=true);
                // Make a trapezoid with a polygon
                // additional thickness is same as the material_thickness
                polygon(points=[
                    [-slot_top_width/2,  0],
                    [slot_top_width/2,   0],
                    [slot_top_width/2,   material_thickness],
                    [slot_base_width/2,  slot_depth],
                    [-slot_base_width/2, slot_depth],
                    [-slot_top_width/2,  material_thickness],
                ]);
            }
        }
    }
}

module extrusion_profile(profile_side_length, neck_width, material_thickness, slot_top_width, slot_base_width, slot_depth, hole_radius) {
    difference() {
        square(size=[profile_side_length, profile_side_length], center=true);
        translate([0, -profile_side_length/2, 0]) {
            slot_2d(neck_width, material_thickness, slot_top_width, slot_base_width, slot_depth);
        }
        rotate([0, 0, 90]) {
            translate([0, -profile_side_length/2, 0]) {
                slot_2d(neck_width, material_thickness, slot_top_width, slot_base_width, slot_depth);
            }
        }
        rotate([0, 0, 180]) {
            translate([0, -profile_side_length/2, 0]) {
                slot_2d(neck_width, material_thickness, slot_top_width, slot_base_width, slot_depth);
            }
        }
        rotate([0, 0, 270]) {
            translate([0, -profile_side_length/2, 0]) {
                slot_2d(neck_width, material_thickness, slot_top_width, slot_base_width, slot_depth);
            }
        }
        // Make the center hole
        translate([0, 0, 0]) {
            circle(r=hole_radius, $fn=20);
        }
    }
}

// extrusion_profile(20, 5.26, 1.5, 11.99, 5.9, 4.7, 2.5);

linear_extrude(height=80) {
    extrusion_profile(20, 5.26, 1.5, 11.99, 5.9, 4.7, 2.5);
}