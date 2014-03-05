private
cullNode: aNode
	low == aNode ifTrue: [^ low := nil].
	equal == aNode ifTrue: [^ equal := nil].
	high == aNode ifTrue: [^ high := nil]