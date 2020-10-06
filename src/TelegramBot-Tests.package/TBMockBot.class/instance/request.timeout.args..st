requests
request: type timeout: timeout args: args

	self
		assert: [timeout isKindOf: Duration];
		assert: [timeout positive].
	
	type = 'getUpdates' ifTrue: [
		^ self requestUpdates: args].
	
	requests addLast: type -> (JsonObject newFrom: args).
	^ JsonObject new
		at: #from put: (JsonObject new
			at: #username put: self name;
			yourself);
		at: #messageId put: #todo;
		yourself