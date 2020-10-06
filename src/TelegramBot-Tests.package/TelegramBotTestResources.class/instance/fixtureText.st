fixtures
fixtureText

	^ ('{1} normal <b>bold</b> <i>italic</i> <u>underline</u> <s>struck</s> <a href="http://myip.is/">link</a> normal <br/> <b><i>Bold AND italic</i></b>'
		format: {self. DateAndTime now}
	) asTextFromHtml