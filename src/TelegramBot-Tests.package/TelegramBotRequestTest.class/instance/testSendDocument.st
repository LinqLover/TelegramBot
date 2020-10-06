tests - sending
testSendDocument

	| file chatId request document |
	file := self resource fixtureFile.
	chatId := self resource botChatId.
	
	mockBot sendDocument: file toChat: chatId.
	
	self assert: mockBot requests size = 1.
	request := mockBot requests first.
	
	self assert: 'sendDocument' equals: request key.
	self assert: chatId equals: request value chatId.
	document := request value document.
	self assert: document content equals: (file readStreamDo: [:stream | stream binary contents]).