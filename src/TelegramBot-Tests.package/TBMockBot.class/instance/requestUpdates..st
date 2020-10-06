requests
requestUpdates: args

	| allowedUpdates limit result |
	allowedUpdates := args at: #allowedUpdates ifAbsent: [].
	limit := args at: #limit ifAbsent: [].
	
	result := OrderedCollection new.
	updates removeAllSuchThat: [:update |
		result size >= limit ifTrue: [^ result].
		(allowedUpdates notNil ==> [allowedUpdates includes: update key])
			ifTrue: [result addLast: update value];
			yourself].
	^ result