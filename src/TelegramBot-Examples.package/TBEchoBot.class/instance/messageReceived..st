update handling
messageReceived: message

	self sendText: (self answerTo: message text) toChat: message chat.