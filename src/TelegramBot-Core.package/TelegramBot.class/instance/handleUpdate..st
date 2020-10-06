update processing
handleUpdate: anUpdate

	(anUpdate keys copyWithout: #updateId) do: [:key |
		self handleUpdateType: key with: anUpdate].