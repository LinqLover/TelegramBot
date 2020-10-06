running
initializeSecretsFromEnvironment

	^ self initializeSecretsFromEnvironmentGetter: (
		MessageSend
			receiver: ((Smalltalk classNamed: #OSProcess) perform: #thisOSProcess)
			selector: #environmentAt:)