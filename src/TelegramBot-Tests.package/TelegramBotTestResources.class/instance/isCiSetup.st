testing
isCiSetup

	^ (Smalltalk classNamed: #SmalltalkCI)
		ifNil: [false]
		ifNotNil: [:sci | (sci perform: #getEnv: with: #CI) = #true]