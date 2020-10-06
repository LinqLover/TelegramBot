update processing
handleUpdateType: aSymbol with: anObject

	(#(message editedMessage channelPost editedChannelPost) includes: aSymbol) ifTrue: [
		| message |
		message := self unwrapMessage: (anObject at: aSymbol).
		^ aSymbol caseOf: {
			[#message] -> [self handleMessage: message].
			[#editedMessage] -> [self handleEditedMessage: message].
			[#channelPost] -> [self handleChannelPost: message].
			[#editedChannelPost] -> [self handleEditedChannelPost: message] }].
	
	^ self handleUnknownUpdateType: aSymbol with: anObject