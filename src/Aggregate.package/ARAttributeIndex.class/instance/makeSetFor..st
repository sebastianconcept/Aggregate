private
makeSetFor: anAggregateOrValue 
	"Answers a new persisted set to store 
	the (potentially big quantity of) indexed aggregates."

	| set |	
		
	(self hasSortSelector not and:[
	anAggregateOrValue respondsTo: #id])
		ifTrue:[set := ARTreeSet sortSelector: #id equalitySelector: #=]
		ifFalse:[
			self hasSortSelector not ifTrue:[
				set := ARTreeSet sortSelector: #hash equalitySelector: #isIdenticalTo:]].
		

	"Note (sas): I can't tell right now if the values got using 
	sortSelector are persistently updateables so maybe is better 
	to use it only with immutable values (like creation date time)"
	self hasSortSelector ifTrue: [
		self assert: sortSelector isSymbol.
		set := ARTreeSet sortSelector: sortSelector equalitySelector: #=].

	^ set makePersistent