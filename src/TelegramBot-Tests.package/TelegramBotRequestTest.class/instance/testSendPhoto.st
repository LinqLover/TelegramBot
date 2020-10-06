tests - sending
testSendPhoto

	| form chatId request document |
	form := self resource fixturePhoto.
	chatId := self resource botChatId.
	
	mockBot sendPhoto: form toChat: chatId.
	
	self assert: mockBot requests size = 1.
	request := mockBot requests first.
	
	self assert: 'sendPhoto' equals: request key.
	self assert: chatId equals: request value chatId.
	document := request value photo.
	self
		assert: document isPng;
		assert: (Form fromBinaryStream: document contentStream) bits equals: form bits.