tests - receiving
testReceiveMessage

	| chatId messageId text message |
	chatId := 42.
	messageId := 43.
	text := 'Hello Squeak'.
	
	mockBot handleUpdate: (
		self mockMessageFor: text id: messageId chatId: chatId).
	
	self assert: mockBot receivedMessages size = 1.
	message := mockBot receivedMessages first.
	
	self
		assert: chatId equals: message chat id;
		assert: messageId equals: message messageId;
		assert: text equals: message text.