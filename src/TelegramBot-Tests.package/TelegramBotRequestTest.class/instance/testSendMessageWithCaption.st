tests - sending
testSendMessageWithCaption

	| form caption chatId request |
	form := self resource fixturePhoto.
	caption := 'foo' asText allBold.
	chatId := self resource botChatId.
	
	mockBot sendPhoto: form withCaption: caption toChat: chatId.
	request := self receiveMockBotRequest.
	
	self
		assert: '<b>foo</b>' equals: request value caption;
		assert: 'html' equals: request value parseMode.