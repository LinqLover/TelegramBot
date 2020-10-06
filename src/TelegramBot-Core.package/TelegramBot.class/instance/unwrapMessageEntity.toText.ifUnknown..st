converting
unwrapMessageEntity: messageEntity toText: aText ifUnknown: aBlock

	| attribute end start subtext |
	start := messageEntity offset + 1. "Off by one ..."
	end := start + messageEntity length - 1.
	subtext := aText copyFrom: start to: end.
	attribute := self
		unwrapMessageEntity: messageEntity
		toAttributeFor: subtext
		ifUnknown: [^ aBlock value].
	aText addAttribute: attribute from: start to: end.