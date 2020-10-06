converting
htmlReplacements
	"Replacements to be applied after converting a text using HTMLReadWriter. Used to resolve HTML artifacts not supported by the API."

	^ {
		{String cr. String lf}.
		"&nbsp; is not supported by the API, see HTMLReadWriter>>#writeContent:."
		{'&nbsp;&nbsp;&nbsp;&nbsp;'. String tab}
	}