update handling
handleUnknownUpdateType: aSymbol with: anObject

	self notify: ('Skipping unknown update of type {1}' format: {aSymbol}).