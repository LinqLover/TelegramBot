asserting
shouldBotAsked: inputs answersSatisfy: aBlock

	| actualOutputs |
	inputs do: [:input |
		self sendClientMessage: input].
	
	self flag: #wish. "Ideally, we should skip older updates here because if one of them is errorneous, all tests fail"
	bot doOneCycleNow.
	actualOutputs := self receiveClientMessages.
	
	self deny: [(aBlock value: actualOutputs) == false].