accessing
chat: aChat

	chat := aChat isDictionary
		ifFalse: [JsonObject new
			at: #id put: aChat;
			yourself]
		ifTrue: [aChat].