//A cuboid with a tapered top
//w - width
//l - length
//h - height
//taper - how much to taper the each edge at the top by

module tapered_cuboid(w, l, h, taper) {
	ho = taper;
	hw = w - taper;
	hl = l - taper;
	polyhedron( points=[
		[ 0,  0, 0],
		[ho, ho, h],
		[hw, ho, h],
		[ w,  0, 0],
		[ 0,  l, 0],
		[ho, hl, h],
		[hw, hl, h],
		[ w,  l, 0]
	], triangles = [
		//side face
		[0, 1, 2],
		[2, 3, 0],
		//side face
		[3, 2, 6],
		[6, 7, 3],
		//side face
		[7, 6, 5],
		[5, 4, 7],
		//side face
		[4, 5, 1],
		[1, 0, 4],
		//top face
		[1, 5, 2],
		[2, 5, 6],
		//bottom face
		[4, 0, 3],
		[7, 4, 3],
	] );
}

tapered_cuboid(4, 4, 2, 0.3);
