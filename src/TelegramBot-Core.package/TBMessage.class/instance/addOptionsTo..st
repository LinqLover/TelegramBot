private
addOptionsTo: args

	#(disableNotification disableWebPagePreview) do: [:optionName |
		self options at: optionName ifPresent: [:value |
			self assert: value isBoolean.
			args at: optionName put: value]].