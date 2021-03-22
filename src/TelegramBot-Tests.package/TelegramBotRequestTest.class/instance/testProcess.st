tests
testProcess

	| chatId text |
	chatId := 42.
	text := 'Hello Squeak'.
	
	self assertProcessInvariantDuring: [
		mockBot spawnNewProcessAt: Processor activePriority.
		
		[Processor yield.
		self assert: 0 equals: mockBot receivedMessages size.
		
		mockBot addUpdate: (self mockMessageFor: text id: 1 chatId: chatId).
		Processor yield.
		self assert: 1 equals: mockBot receivedMessages size.
		
		mockBot shutDown: false.
		[mockBot addUpdate: (self mockMessageFor: text id: 2 chatId: chatId).
		Processor yield.
		self assert: 1 equals: mockBot receivedMessages size]
			ensure: [mockBot startUp: false].
		Processor yield; yield; yield. "compensate the magic in Process>>pvtSignal:list:"
		self assert: 2 equals: mockBot receivedMessages size.
		
		mockBot addUpdate: (self mockMessageFor: text id: 3 chatId: chatId).
		Processor yield.
		self assert: 3 equals: mockBot receivedMessages size]
			ifCurtailed: [mockBot terminate].
		
		mockBot terminate.
		mockBot addUpdate: (self mockMessageFor: text id: 4 chatId: chatId).
		Processor yield.
		self assert: 3 equals: mockBot receivedMessages size].