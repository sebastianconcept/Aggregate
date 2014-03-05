enumerating
valuesDo: aBlock
	root allLeavesDo: [:ea | ea valuesDo: aBlock]