*TelegramBot-Core-converting-override
removeAttributesThat: removalBlock replaceAttributesThat: replaceBlock by: convertBlock
	"Enumerate all attributes in the receiver. Remove those passing removalBlock and replace those passing replaceBlock after converting it through convertBlock"
	| added removed |
	self flag: #compatibility. "Copied from Collections-ct.914 (inbox). If merged, remove this override."
	"Deliberately optimized for the no-op default."
	added := removed := nil.
	runs withStartStopAndValueDo: [ :start :stop :attribs | 
		attribs do: [ :attrib | | new |
			(removalBlock cull: attrib cull: start cull: stop) ifTrue:[
				removed ifNil:[removed := WriteStream on: #()].
				removed nextPut: {start. stop. attrib}.
			] ifFalse:[
				(replaceBlock cull: attrib cull: start cull: stop) ifTrue:[
					removed ifNil:[removed := WriteStream on: #()].
					removed nextPut: {start. stop. attrib}.
					new := convertBlock cull: attrib cull: start cull: stop.
					added ifNil:[added := WriteStream on: #()].
					added nextPut: {start. stop. new}.
				].
			].
		].
	].
	(added == nil and:[removed == nil]) ifTrue:[^self].
	"otherwise do the real work"
	removed ifNotNil:[removed contents do:[:spec|
		self removeAttribute: spec last from: spec first to: spec second]].
	added ifNotNil:[added contents do:[:spec|
		self addAttribute: spec last from: spec first to: spec second]].