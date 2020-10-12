running
setUp

	super setUp.
	
	self setUpBot.
	self setUpClient.
	
	"Send a dummy message because receiveClientMessages fails before sending the first message"
	self sendClientMessage: ('{2} {1}' format: {self. DateAndTime now}).
	bot doOneCycleNow.
	self receiveClientMessages.