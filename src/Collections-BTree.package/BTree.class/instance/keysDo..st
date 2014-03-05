enumerating
keysDo: aBlock
	root allLeavesDo: [:ea | ea keysDo: aBlock]