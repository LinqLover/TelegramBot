converting
asMimeDocument

	^ MIMEDocument
		contentType: 'image/gif'
		content: self bytes
		url: (FileUrl absoluteFromText: 'data.gif')