tests - sending
testSendAudio

	| sound chatId request document |
	sound := self resource fixtureAudio.
	chatId := self resource botChatId.
	
	mockBot sendAudio: sound toChat: chatId.
	request := self receiveMockBotRequest.
	
	self assert: 'sendAudio' equals: request key.
	self assert: chatId equals: request value chatId.
	document := request value audio.
	self
		assert: 'audio/x-wav' equals: document contentType;
		assert: (ByteArray streamContents: [:stream |
				stream nextPutAll: document contentStream])
			equals: (ByteArray streamContents: [:stream |
				sound storeWAVSamplesOn: stream]).