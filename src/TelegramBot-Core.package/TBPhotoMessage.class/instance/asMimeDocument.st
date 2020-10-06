converting
asMimeDocument

	^ MIMEDocument
		contentType: 'image/png'
		content: (ByteArray streamContents: [:stream |
			PNGReadWriter putForm: self form onStream: stream])
		url: (FileUrl absoluteFromText: 'data.png')