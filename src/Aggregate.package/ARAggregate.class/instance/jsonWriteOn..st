private
jsonWriteOn: aStream

	| referencer |
	
	referencer := [ :referenceable | 
						JsonObject new 
							referenceId: referenceable id;
							aggregateClass: referenceable class name;
							yourself ].

	^ ([:json|
		self class allInstVarNames do:[:name| |content|
			content := self instVarNamed: name.
			
			"This is limited but I'm in  a hurry and your help is welcomed :)"
			"1. if it's a subaggregate"
			content isAggregate ifTrue:[
				content := referencer value: content].

			"2. if it's a collection of subaggregates"
			(content class ~= JsonObject and:[
			content isAggregate not and:[
			content isCollection and:[
			content isString not and:[
			content isSymbol not ]]]]) ifTrue:[
				content := content collect:[:e| 
							e isAggregate 
								ifTrue:[referencer value: e]
								ifFalse:[ e ]]].
			
			json at: name put: content].
		json ] value: JsonObject new) jsonWriteOn: aStream
