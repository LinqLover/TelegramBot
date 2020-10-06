update handling
handleCommand: aCommand message: aMessage
	"Hook. Subclasses may override this."

	^ self handleUnknownCommand: aCommand message: aMessage