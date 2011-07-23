module prism(l, w, h) { 
	polyhedron(points = [
		[0, 0, 0],
		[0, 0, h],
		[w, 0, 0],
		[0, l, 0],
		[w, l, 0],
		[0, l, h]],
		triangles = [
			//left
			[0, 1, 2],
			//Hypoteneuse
			[1, 5, 2],
			[2, 5, 4],
			//right
			[4, 5, 3],
			//back
			[3, 5, 1],
			[3, 1, 0],
			//base
			[0, 2, 3],
			[2, 4, 3],
		]); 
}

//prism(5, 3, 2);