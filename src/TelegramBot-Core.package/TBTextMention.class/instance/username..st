accessing
username: aString

	(aString beginsWith: '@') ifTrue: [
		^ self username: aString allButFirst].
	
	username := aString.
	self urlChanged.