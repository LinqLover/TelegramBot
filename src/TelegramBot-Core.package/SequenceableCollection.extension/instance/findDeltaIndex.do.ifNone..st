*TelegramBot-Core-enumerating-override
findDeltaIndex: aBlock do: actionBlock ifNone: exceptionBlock
	"Search for an element in the receiver using interpolation search with a linear interpolation function.
	The argument aBlock is a one-element block returning
		0 	- if the element is the one searched for;
		<0	- the distance to the searched value, if the search should continue in the first half;
		>0	- the distance to the searched, if the search should continue in the second half.
	If found, evaluate actionBlock with the index as argument. If no matching element is found, evaluate exceptionBlock, with the indexes of the 'bounding' elements as optional arguments.
	Warning: Might give invalid indexes, see examples below.
	Practical performance of interpolation search depends on whether the reduced number of probes is outweighed by the more complicated calculations needed for each probe. For more information, read the Wikipedia article (which the previous sentence was cited from).
	
	Examples:
		#(1 3 5 7 11 15 23)
			findDeltaIndex: [ :arg | 11 - arg ]
			do: [ :found | found ]
			ifNone: [ :a :b | ('between: ', {a. b} printString)]
		#(1 3 5 7 11 15 23)
			findDeltaIndex: [ :arg | 12 - arg ]
			do: [ :found | found ]
			ifNone: [ :a :b | ('between: ', {a. b} printString) ]
		#(1 3 5 7 11 15 23) d
			findDeltaIndex: [ :arg | 0.5 - arg ]
			do: [ :found | found ]
			ifNone: [ :a :b | ('between: ', {a. b} printString) ]
		#(1 3 5 7 11 15 23)
			findDeltaIndex: [ :arg | 25 - arg ]
			do: [ :found | found ]
			ifNone: [ :a :b | ('between: ',{a. b} printString) ]
	"
	| index low high delta |
	low := 1.
	high := self size.
	index := low + high // 2.
	[ index between: low and: high ] whileTrue: [ | range |
		index := ((delta := aBlock value: (self at: index)) < 0
			ifTrue: [
				high := index - 1.
				(range := (self at: index) - (self at: low)) = 0
					ifTrue: [ high ]
					ifFalse: [ high + (high - low * delta // range) ] ]
			ifFalse: [ 0 < delta ifTrue: [
				low := index + 1.
				(range := (self at: high) - (self at: index)) = 0
					ifTrue: [ low ]
					ifFalse: [ low + (high - low * delta // range) ] ]
			ifFalse: [ "delta = 0"
				^ actionBlock value: index ] ]) min: high max: low.
		].
	^ exceptionBlock cull: high cull: low