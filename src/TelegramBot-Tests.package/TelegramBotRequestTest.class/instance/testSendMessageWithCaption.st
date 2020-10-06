tests - sending
testSendMessageWithCaption

	| form caption chatId request |
	form := self resource fixturePhoto.
	caption := 'foo' asText allBold.
	chatId := self resource botChatId.
	
	mockBot sendPhoto: form withCaption: caption toChat: chatId.
	
	self assert: mockBot requests size = 1.
	request := mockBot requests first.
	
	self
		assert: '<b>foo</b>' equals: request value caption;
		assert: 'html' equals: request value parseMode.