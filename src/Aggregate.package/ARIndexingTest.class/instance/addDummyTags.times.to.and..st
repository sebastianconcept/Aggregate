actions
addDummyTags: anInteger times: anotherInteger to: aPool and: aSet

	1 to: anotherInteger do:[:i|
		aPool commit:[
			1 to: anInteger do:[:j| |tag|
				tag := ARDummyTag new.
				aSet add: tag.
				tag save]]]