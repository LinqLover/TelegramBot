update handling
handleUnknownCommand: aSymbol message: message
	"Hook. Subclasses may override this."

	^ self messageReceived: message