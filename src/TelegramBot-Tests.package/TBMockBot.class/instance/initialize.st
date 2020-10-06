initialize-release
initialize

	super initialize.
	
	requests := OrderedCollection new.
	updates := OrderedCollection new.
	receivedMessages := OrderedCollection new.