tests - sending
testDisableWebPagePreview

	| text chatId request |
	text := self name.
	chatId := self resource botChatId.
	
	mockBot
		sendMessage: ((mockBot messageWithText: text)
			disableWebPagePreview: true;
			yourself)
		toChat: chatId.
	request := self receiveMockBotRequest.
	
	self assert: 'sendMessage' equals: request key.
	self assert: true equals: request value disableWebPagePreview.