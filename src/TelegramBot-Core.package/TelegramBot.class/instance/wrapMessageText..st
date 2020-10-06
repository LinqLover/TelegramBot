converting
wrapMessageText: aStringOrText
	"Wrap aStringOrText and answer an HTML representation suitable for the API."

	| text html |
	text := aStringOrText asText copy.
	text removeAttributesThat: [:attrib :start :stop |
		(attrib isTelegramBotAttribute
			and: [attrib isRedundantForString: (text string copyFrom: start to: stop)])
			or: [attrib isSupportedByTelegramBot
				ifFalse: [self notify: ('Skipping unsupported attribute {1}' format: {attrib})];
				not]].
	
	html := String streamContents: [:stream |
		(HtmlReadWriter on: stream)
			breakLines: false;
			nextPutText: text].
	html := self htmlReplacements inject: html into: [:newHtml :replacement |
		newHtml copyReplaceAll: replacement first with: replacement second].
	^ html