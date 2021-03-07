accessing
disableWebPagePreview

	^ self options at: #disableWebPagePreview ifAbsent: [nil]