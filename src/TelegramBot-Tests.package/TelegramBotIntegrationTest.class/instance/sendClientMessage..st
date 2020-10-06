support
sendClientMessage: aString

	client
		sendMessage: aString to: self resource clientChatId;
		tbUpdateAll.
	
	self
		assert: {aString} equals: self receiveClientMessages asArray
		description: 'Client did not receive its own message'.