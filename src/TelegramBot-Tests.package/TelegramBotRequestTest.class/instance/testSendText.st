tests - sending
testSendText

	| text chatId request |
	text := 'normal <b>bold</b> <br />	second line <b><i>bold AND italic</b>' asTextFromHtml.
	chatId := self resource botChatId.
	
	mockBot sendText: text toChat: chatId.
	request := self receiveMockBotRequest.
	
	self assert: 'sendMessage' equals: request key.
	self
		assert: chatId equals: request value chatId;
		assert: (WebUtils jsonStringFrom: '"normal <b>bold</b> \n\tsecond line <b><i>bold AND italic</i></b>"' readStream) equals: request value text;
		assert: 'html' equals: request value parseMode.