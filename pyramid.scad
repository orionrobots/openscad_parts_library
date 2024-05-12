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
		[0, 1, 4],
		[1, 3, 4],
		[3, 2, 4],
		[2, 0, 4],
		//base
		[2, 1, 0],
		[3, 1, 2]
	]);
}

//pyramid(4,4,4);
//pyramid(6, 5, 2);