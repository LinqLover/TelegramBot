fixtures
fixtureFile

	| fileName file |
	fileName := '{1}_{2}.png' format: {self className. thisContext selector}.
	self fixturePhoto writePNGfileNamed: fileName.
	file := FileDirectory default / fileName.
	cleanUps addLast: [file delete].
	^ file