initialization
readFrom: aStream

	aStream isStream ifFalse: [
		^ self readFrom: aStream readStream].
	
	self assert: aStream next = $/.
	self assert: aStream atEnd not.
	self key: (aStream upTo: $@) asSymbol.
	aStream atEnd ifFalse: [
		self botName: aStream upToEnd].