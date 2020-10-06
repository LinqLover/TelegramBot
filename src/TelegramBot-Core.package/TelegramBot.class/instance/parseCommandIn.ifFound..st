private
parseCommandIn: aMessage ifFound: aBlock

	(aMessage text isText ifTrue: [aMessage text attributesAt: 1] ifFalse: [#()])
		detect: [:attrib | attrib isTelegramBotAttribute and: [
			attrib isTelegramBotMention]]
		ifFound: [:attrib |
			aMessage at: #mentionedUsername put: attrib username.
			aMessage at: #mainText put: (
				aMessage text allButFirst: (aMessage text rangeOf: attrib startingAt: 1) stop)
					withoutLeadingBlanks.
			attrib isTelegramBotCommand ifTrue: [
				^ aBlock value: attrib]]
		ifNone: [aMessage at: #mainText put: aMessage text].