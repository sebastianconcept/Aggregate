actions
asJsonObject
	"Answers a JsonObject with the information of this aggregate.
	Subaggregates and collections of subaggregates are returned as references"

	^ [:json|
		self class allInstVarNames do:[:name| |content|
			content := self instVarNamed: name.
			json at: name put: content].
		json ] value: JsonObject new 
