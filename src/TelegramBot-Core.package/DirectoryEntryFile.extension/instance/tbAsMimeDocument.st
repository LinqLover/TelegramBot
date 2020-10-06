*TelegramBot-Core-converting
tbAsMimeDocument

	| stream document |
	stream := self readStream binary.
	document := [MIMELocalFileDocument
		contentType: (MIMELocalFileDocument guessTypeFromExtension: self extension)
		content: stream contents
		url: stream asUrl] ensure: [stream close].
	
	document setField: 'content-disposition' toString: 'attachment'.
	(document fieldNamed: 'content-disposition' ifAbsent: [self error])
		parameterAt: 'filename' put: self name.
	
	^ document