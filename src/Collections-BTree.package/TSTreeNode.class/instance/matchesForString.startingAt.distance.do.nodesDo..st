private
matchesForString: aString startingAt: i distance: d do: aBlock nodesDo: nodeBlock
	
	| char d2 |
	nodeBlock value: self.
	d < 0 ifTrue: [^ self].
	
	char := aString at: i.
	(d > 0 or: [char < key])
		ifTrue: [low ifNotNil: [low matchesForString: aString startingAt: i distance: d do: aBlock nodesDo: nodeBlock]].
		
	d2 := char = key ifTrue: [d] ifFalse: [d-1].
	(i + d2 = aString size and: [value notNil]) ifTrue: [aBlock value: value].
	equal ifNotNil: [equal matchesForString: aString startingAt: (i+1 min: aString size) distance: d2 do: aBlock nodesDo: nodeBlock].
	
	(d > 0 or: [char > key])
		ifTrue: [high ifNotNil: [high matchesForString: aString startingAt: i distance: d do: aBlock nodesDo: nodeBlock]]