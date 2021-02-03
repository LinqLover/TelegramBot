priv handling
defaultAction

	(self exception isKindOf: NetworkError) ifFalse: [^ super defaultAction].
	
	^ self defaultActionWithDelay