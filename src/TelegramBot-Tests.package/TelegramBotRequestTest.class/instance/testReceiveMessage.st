tests - receiving
testReceiveMessage

	| chatId messageId text message |
	chatId := 42.
	messageId := 43.
	text := 'Hello Squeak'.
	
	mockBot handleUpdate: (JsonObject new
		at: #message put: (JsonObject new
			at: #messageId put: messageId;
			at: #date put: DateAndTime now asUnixTime;
			at: #chat put: (JsonObject new
				at: #id put: chatId;
				yourself);
			at: #text put: text;
			yourself);
		yourself).
	
	self assert: mockBot receivedMessages size = 1.
	message := mockBot receivedMessages first.
	
	self
		assert: chatId equals: message chat id;
		assert: messageId equals: message messageId;
		assert: text equals: message text.