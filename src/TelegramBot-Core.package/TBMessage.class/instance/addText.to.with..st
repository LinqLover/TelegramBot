private
addText: aStringOrText to: args with: aBot

	| wrappedText |
	wrappedText := self truncated
		ifFalse: [aBot wrapMessageText: aStringOrText]
		ifTrue: [aBot wrapAndTruncateMessageText: aStringOrText].
	args
		at: self textSelector put: wrappedText;
		at: #parseMode put: 'html'.