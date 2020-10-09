scripts
installPreviewDependencies

	| dependencies installer |
	self flag: #workaround. "As soon as the versions listed here get merged, this should be removed"
	
	dependencies := #(
		(inbox 'WebClient-Core-ct.125') "UTF-8 conversion for multipart/form-data"
		(inbox 'WebClient-Core-ct.127') "Moves WebClient utility methods to instance side"
		(inbox 'Collections-ct.915') "Adds accessor and constructor for TextURL"
		(inbox 'Kernel-ct.1303') "#on:satisfying:do:"
		(inbox 'Graphics-ct.443') "storing an animated GIF file via AnimatedGIFReadWriter"
		
		"Deprecate SyntaxErrorNotification >> #errorMessage"
		'http://forum.world.st/attachment/5121789/0/SyntaxErrorNotification%20errorMessage.1.cs'
	).
	
	installer := Installer new.
	dependencies
		do: [:dep |
			dep isString
				ifTrue: [(WebClient httpGet: dep) content readStream fileIn]
				ifFalse: [installer
					primMerge: dep second , '.mcz'
					from: (MCRepository in: dep first)]]
		displayingProgress: [:name |
			'Installing preview dependencies... ({1})' format: {name}].