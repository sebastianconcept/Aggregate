actions
removeAllIndicesOf: anAggregateClass
	"Removes all the indices dedicated to anAggregateClass in this storage."

	| containerName |
	
	containerName := containerPolicy containerFor: anAggregateClass in: self.
	
	ARCurrentContainer use: containerName during:[
		self indices removeKey: anAggregateClass name; markDirty.
		self markDirty]