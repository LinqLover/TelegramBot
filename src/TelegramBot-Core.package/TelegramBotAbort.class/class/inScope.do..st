support
inScope: scope do: aBlock

	^ aBlock
		on: self
		satisfying: [:abort | abort scope = scope]
		do: []