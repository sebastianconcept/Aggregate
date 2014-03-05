public
equalitySelector
	^ equalsKey ifNil: [equalsKey := self class defaultEqualitySelector]