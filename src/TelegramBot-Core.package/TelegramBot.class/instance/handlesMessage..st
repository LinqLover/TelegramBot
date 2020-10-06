update handling
handlesMessage: aMessage

	"Define this global in your image to protect yourself from any boogeymen"
	Smalltalk at: #TBTestBotChatIds ifPresent: [:chatIds |
		(chatIds includes: aMessage from id) ifFalse: [
			^ false]].
	
	aMessage mentionedUsername ifNotNil: [:mentionee |
		mentionee = self name ifFalse: [
			^ false]].
	
	^ true