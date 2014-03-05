private
ensureValuesIn: anAggregate from: anEditedAggregate
	"Ensures the changes of anEditedAggregate to be present in anAggregate.
	Note that we assume that every instVar of an aggregate has its ideal accessor (and mutator).
	We count on that for getting the fresh value and setting it.
	Beside, we'll check if those instVars are holding a collection to retrieve a fresh collected version of its elements."

	anAggregate class persistentlyMutableInstanceVariables do:[:attribute|
			self ensureValueOf: attribute in: anAggregate from: anEditedAggregate]
	
