message sending
sendDocument: aDirectoryEntryFile toChat: aChat

	^ self
		sendMessage: (self messageWithDocument: aDirectoryEntryFile)
		toChat: aChat