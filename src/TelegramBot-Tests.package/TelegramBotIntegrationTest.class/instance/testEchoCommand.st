tests
testEchoCommand

	self
		shouldBotAsked: {'/start'}
		answersSatisfy: [:answers |
			self assert: 1 equals: answers size.
			self assert: ['Welcome*' match: answers first]].