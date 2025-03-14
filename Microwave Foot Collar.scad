/**
 * A collar to place under a microwave's foot (along with some double-sided tape)
 * so that it doesn't slide around the counter.
 *
 * This will raise the microwave up $collar_base_thickness mm. $collar_inner_diameter
 * should be set big enough to allow the microwave feet to fit inside of it.
 * $collar_max_height should be less than the height of the microwave's existing foot
 * so that the foot reaches the bottom of the collar opening.
 *
 * I'm using 2-inch carpet tape, so I chose a $collar_outer_diameter of two inches.
 */

$fa = 1; $fs = 0.05;

collar_outer_diameter = 25.4 * 2;
collar_inner_diameter = 25.4 * ( 5 / 8 );
collar_max_height = 25.4 * ( 1 / 4 );
collar_base_thickness = 25.4 * ( 1 / 16 );

// The non-conic portion of the base.
cylinder( h = collar_base_thickness, d = collar_outer_diameter );

// The sloping foot.
translate( [ 0, 0, collar_base_thickness ] ) {
	difference() {
		// Use a cylinder as the basis for the upper part of the foot.
		cylinder( d = collar_outer_diameter, h = collar_max_height );

		// Subtract out a torus to give the foot sides a gentle concave slope.
		translate( [ 0, 0, collar_max_height ] ) {
			resize([2 * collar_outer_diameter, 2 * collar_outer_diameter,collar_max_height * 2 ]) {
				rotate_extrude() {
					translate( [ ( collar_inner_diameter + collar_outer_diameter ) / 2, 0, 0 ] ) {
						circle( r = collar_outer_diameter / 2 );
					}
				}
			}
		}

		// Remove the center where the microwave foot sits.
		cylinder( d = collar_inner_diameter, h = collar_max_height );
	}
}