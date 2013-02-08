//The top point will be centred
module pyramid(w, l, h) {
	mw = w/2;
	ml = l/2;
	polyhedron(points = [
		[0,  0,  0],
		[w,  0,  0],
		[0,  l,  0],
		[w,  l,  0],
		[mw, ml, h]
	], triangles = [
		[4, 1, 0],
		[4, 3, 1],
		[4, 2, 3],
		[4, 0, 2],
		//base
		[0, 1, 2],
		[2, 1, 3]
	]);
}

//pyramid(4,4,4);
//pyramid(6, 5, 2);
