running
setUpClient

	| process |
	client := TCCCore new.
	client
		checkAuthenticationCode: self resource clientPhoneNumber;
		checkAuthenticationCode: self resource clientAuthCode.
	
	"Stop background process of the client, we will trigger it manually during testing to avoid synchronisation issues."
	Processor yield.
	process := Process allInstances detect: [:proc |
		proc suspendedContext notNil and: [
			proc suspendedContext receiver == client]].
	process terminate.
	
	self receiveClientMessages.