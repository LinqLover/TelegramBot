private
addText: aStringOrText to: args with: aBot

	aStringOrText ifNil: [^ self "media caption is optional"].
	
	^ super addText: aStringOrText to: args with: aBot