tests - sending
testSendAnimation

	| animation chatId request document |
	animation := self resource fixtureAnimation.
	chatId := self resource botChatId.
	
	mockBot sendMessage: (mockBot messageWithAnimation: animation) toChat: chatId.
	
	self assert: mockBot requests size = 1.
	request := mockBot requests first.
	
	self assert: 'sendAnimation' equals: request key.
	self assert: chatId equals: request value chatId.
	document := request value animation.
	self
		assert: document isGif;
		assert: document content equals: animation.