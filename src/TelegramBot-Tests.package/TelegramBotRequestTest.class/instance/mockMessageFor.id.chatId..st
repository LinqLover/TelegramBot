mocking
mockMessageFor: text id: messageId chatId: chatId

	^ JsonObject new
		at: #message put: (JsonObject new
			at: #messageId put: messageId;
			at: #date put: DateAndTime now asUnixTime;
			at: #chat put: (JsonObject new
				at: #id put: chatId;
				yourself);
			at: #text put: text;
			yourself);
		at: #updateId put: messageId;
		yourself