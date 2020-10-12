private
comparingStringBetween: expected and: actual

	^ 'Expected {1} but was {2}.' translated
		format: {
			expected printStringLimitedTo: 100.
			actual printStringLimitedTo: 100 }