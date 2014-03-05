private
canBeCulled
	^ self value isNil and: [ low isNil and: [ equal isNil and: [ high isNil ] ] ]