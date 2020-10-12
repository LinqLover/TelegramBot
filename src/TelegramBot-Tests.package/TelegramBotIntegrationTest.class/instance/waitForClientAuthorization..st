support
waitForClientAuthorization: aBlock

	[[(aBlock cull: client authHandler)
		ifFalse: [
			client tbUpdateAll.
			1 second wait];
		yourself
	] whileFalse] valueWithin: self clientAuthTimeout onTimeout: [
		self error: 'Could not authorize client, authState is ' , client authHandler authState].