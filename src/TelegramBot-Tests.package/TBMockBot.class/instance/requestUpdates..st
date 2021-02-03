requests
requestUpdates: args

	| allowedUpdates limit result |
	allowedUpdates := args at: #allowedUpdates ifAbsent: [#()].
	limit := args at: #limit ifAbsent: [].
	
	result := OrderedCollection new.
	[result size < limit and: [updates isEmpty]] whileFalse: [
		(allowedUpdates notEmpty ==> [allowedUpdates includes: updates peek key])
			ifFalse: [^ result].
		result addLast: updates nextOrNil].
	^ result