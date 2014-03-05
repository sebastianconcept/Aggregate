testing
hasRoot

	^ [self readOnly:[self root notNil]] on: Error do:[:x| ^ false]