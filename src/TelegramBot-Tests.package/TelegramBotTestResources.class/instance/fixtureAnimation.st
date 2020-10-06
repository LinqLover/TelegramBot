fixtures
fixtureAnimation

	^ ByteArray streamContents: [:stream |
		AnimatedGIFReadWriter
			putForms: (#(red yellow blue) collect: [:string |
				Morph new
					color: (Color fromString: string);
					imageForm])
			onStream: stream]