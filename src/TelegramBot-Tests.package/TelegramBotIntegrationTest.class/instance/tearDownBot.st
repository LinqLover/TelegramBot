running
tearDownBot
	 "Make sure unprocessed updates are processed now so that they won't appear again the next time."

	bot
		processUpdatesLimitedTo: 1000
		chunkSize: 100
		do: [:update |].