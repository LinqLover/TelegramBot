tests
testInterruptDefered

	| x y |
	x := 1.
	self targetClass deferDuring:
		[self targetClass signal: [y := x + 3]. x := 2].
	self assert: 5 equals: y.