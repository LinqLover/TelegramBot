tests - sending
testMessageBlocked

	| chatId |
	chatId := self resource botChatId.
	
	mockBot sendText: 'block' toChat: chatId.
	self assert: [mockBot blockedMessages size = 1].