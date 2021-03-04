scripts
installPreviewDependencies

	| dependencies |
	self
		flag: #workaround; "As soon as the versions listed here get merged, this should be removed"
		flag: #duplication. "See BaselineOfTelegramSmalltalkBot>>#installPreviewDependencies"
	
	dependencies := {
		self depInbox: 'WebClient-Core-ct.125'. "UTF-8 conversion for multipart/form-data"
		self depInbox: 'WebClient-Core-ct.127'. "Moves WebClient utility methods to instance side"
		self depInbox: 'Collections-ct.915'. "Adds accessor and constructor for TextURL"
		self depInbox: 'Kernel-ct.1303'. "#on:satisfying:do:"
		self depInbox: 'Graphics-ct.443'. "storing an animated GIF file via AnimatedGIFReadWriter"
		self depInbox: 'MorphicExtras-ct.284'. "AnimatedImageMorph >>#delays"
		
		"Deprecate SyntaxErrorNotification >> #errorMessage"
		self depChangeset: 'http://forum.world.st/attachment/5121789/0/SyntaxErrorNotification%20errorMessage.1.cs'
	}.
	
	dependencies
		do: [:dep | dep value value]
		displayingProgress: [:dep | 'Installing preview dependencies... ({1})' format: {dep key}].