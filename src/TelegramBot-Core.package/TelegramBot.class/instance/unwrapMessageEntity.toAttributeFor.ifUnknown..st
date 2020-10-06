converting
unwrapMessageEntity: messageEntity toAttributeFor: aText ifUnknown: aBlock

	| type |
	type := messageEntity type tbApiKeyToSqueak.
	
	(#(code pre) includes: type) ifTrue: [
		"Support the ShoutAttribute changeset which has not yet been added to Trunk: http://forum.world.st/Changeset-ShoutAttribute-amp-semi-styling-td5106776.html"
		^ Smalltalk
			at: #TextCodeStyle
			ifPresent: [:class | class inlined: type ~=#pre]
			ifAbsent: [nil]].
	
	^ type
		caseOf: {
			[#bold] -> [TextEmphasis bold].
			[#italic] -> [TextEmphasis italic].
			[#underline] -> [TextEmphasis underlined].
			[#strikethrough] -> [TextEmphasis struckOut].
			[#url] -> [TextURL url: aText].
			[#textLink] -> [TextURL url: messageEntity url].
			
			[#mention] -> [TBTextURL mention: aText string].
			[#textMention] -> [TBTextURL mention: messageEntity user].
			[#hashtag] -> [TBTextTag hashtag: aText string].
			[#cashtag] -> [TBTextTag cashtag: aText string].
			[#botCommand] -> [TBTextCommand
				readFrom: aText string
				forBotNamed: self name].
			[#email] -> [TBTextURL email: aText string].
			[#phoneNumber] -> [TBTextURL phoneNumber: aText string] }
		otherwise: [aBlock value]