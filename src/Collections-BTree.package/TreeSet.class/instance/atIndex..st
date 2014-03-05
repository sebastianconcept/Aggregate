public
atIndex: index
	| count |
	count := 0.
	self do: [:ea | (count := count + 1) = index ifTrue: [^ ea]].
	self error: 'No item at index: ', index asString.