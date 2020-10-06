asserting
shouldBotAsked: inputs answer: expectedOutputs

	^ self shouldBotAsked: inputs answersSatisfy: [:actualOutputs |
		self assert: expectedOutputs asArray equals: actualOutputs asArray]