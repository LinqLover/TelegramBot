converting
asMimeDocument

	^ MIMEDocument
		contentType: 'audio/x-wav'
		content: (ByteArray streamContents: [:stream |
			self sound storeWAVSamplesOn: stream])
		url: (FileUrl absoluteFromText: 'media.wav')