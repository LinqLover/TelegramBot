system startup
shutDown: quitting
	"The system is being shut down. Do some context magic to create the effect of an execute around method for the receiver in #shutDown:during:."

	| ctxt |
	ctxt := thisContext.
	^ self shutDown: quitting during: [
		startUpContext := thisContext sender cut: ctxt.
		thisContext privSender: ctxt]