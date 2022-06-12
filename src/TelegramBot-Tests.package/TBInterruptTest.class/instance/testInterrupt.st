tests
testInterrupt

	self assert: 42 equals: (self targetClass signal: [6 * 7]).