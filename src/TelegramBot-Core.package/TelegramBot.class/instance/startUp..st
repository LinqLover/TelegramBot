system startup
startUp: resuming
	"The system is being started up again. Do some context magic to create the effect of an execute around method for the receiver in #shutDown:during:."

	thisContext insertSender: startUpContext.
	startUpContext := nil.