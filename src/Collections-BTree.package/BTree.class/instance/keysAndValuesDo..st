enumerating
keysAndValuesDo: aBlock
	root allLeavesDo: [:ea | ea keysAndValuesDo: aBlock]