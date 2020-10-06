converting
unwrapMessage: message
	"Unwrap an incoming JsonObject and answer a Smalltalk representation of the message."

	| unwrapped |
	message text ifNil: [^ message].
	message entities ifNil: [^ message].
	
	unwrapped := message copy.
	
	unwrapped text: message text asText.
	unwrapped entities: (Array streamContents: [:remainingEntities |
		message entities do: [:entity |
			self
				unwrapMessageEntity: entity
				toText: unwrapped text
				ifUnknown: [
					self notify: ('Skipping unknown text entity {1}' format: {entity}).
					remainingEntities nextPut: entity]]]).
	
	^ unwrapped	