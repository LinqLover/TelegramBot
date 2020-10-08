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
	
	[[client authHandler isAuthorizationStateReady
		ifFalse: [
			client tbUpdateAll.
			1 second wait];
		yourself
	] whileFalse] valueWithin: self clientAuthTimeout onTimeout: [
		self error: 'Could not initialize client, authState is ' , client authHandler authState].
	
	self receiveClientMessages.