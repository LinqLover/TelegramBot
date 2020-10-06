tests
testSendMedia: media
	"Basically a crash test, only. Test whether the client receives any update if the media is sent from the bot."

	| actualOutputs |
	bot sendObject: media toChat: self resource botChatId.
	
	actualOutputs := self receiveClientMessages.
	
	self assert: #('message type not supported yet') equals: actualOutputs asArray.