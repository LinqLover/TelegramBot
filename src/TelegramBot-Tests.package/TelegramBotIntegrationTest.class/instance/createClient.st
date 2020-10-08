support
createClient

	| core process |
	core := TCCCore new.
	
	"Stop background process of the client, we will trigger it manually during testing to avoid synchronisation issues."
	Processor yield.
	process := Process allInstances detect: [:proc |
		proc suspendedContext notNil and: [
			proc suspendedContext receiver == core]].
	process terminate.
	
	^ core