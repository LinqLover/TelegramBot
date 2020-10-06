running
initializeSecrets

	^ self isCiSetup
		ifFalse: [self initializeLocalSecrets]
		ifTrue: [self initializeSecretsFromCi]