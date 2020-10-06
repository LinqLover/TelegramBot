running
initializeSecretsFromCi

	^ self initializeSecretsFromEnvironmentGetter: (
		MessageSend receiver: (Smalltalk classNamed: #SmalltalkCI) selector: #getEnv:)