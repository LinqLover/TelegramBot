accessing
disableNotification

	^ self options at: #disableNotification ifAbsent: [nil]