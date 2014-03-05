*aggregate
copyFrom: start to: end
	| results |
	results := self species sortSelector: sortKey equalitySelector: equalsKey.
	start to: (self size min: end) do:[:i|
		results add: (self atIndex: i)].

	^ results