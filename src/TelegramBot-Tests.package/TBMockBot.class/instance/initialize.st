initialize-release
initialize

	super initialize.
	
	requests := OrderedCollection new.
	updates := SharedQueue new.
	receivedMessages := OrderedCollection new.