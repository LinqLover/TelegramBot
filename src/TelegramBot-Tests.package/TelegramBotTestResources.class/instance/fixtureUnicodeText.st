fixtures
fixtureUnicodeText

	^ 'I {1} SQUEAK' format: {String withAll: (#(16r2764 16r1F9E1 16r1F49B)
		collect: [:code | Character value: code])}