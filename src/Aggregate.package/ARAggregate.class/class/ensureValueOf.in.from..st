private
ensureValueOf: attribute in: anAggregate from: anEditedAggregate
	"Ensures the changes of anEditedAggregate to be present in anAggregate.
	Note that we assume that every instVar of an aggregate has its ideal accessor (and mutator).
	We count on that for getting the fresh value and setting it.
	Beside, we'll check if those instVars are holding a collection to retrieve a fresh collected version of its elements."

	| newValue |
	
	newValue := anEditedAggregate perform: attribute asSymbol. 
	(newValue isCollection and:[
	newValue deservesPersistentRead])
		ifFalse:[ anAggregate perform: (attribute,':') asSymbol with: newValue fresh ]
		ifTrue:[|freshValues|
			"This assumes that you are using simple collections in aggregate instVars (that can normally perform a #collect:)"
			anAggregate 
				perform: (attribute,':') asSymbol 
				with: (newValue collect: [:e| |freshOne|
						freshOne := e fresh.
						freshOne ifNil:[self error: 'You probably should have saved ', e asString,' before trying to save ', anAggregate asString].
						freshOne])].
