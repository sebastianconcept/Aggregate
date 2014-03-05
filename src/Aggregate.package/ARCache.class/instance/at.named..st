actions
at: aTransaction named: aString
	"Answers the active records in the results stored 
	in the query results named aString related to a aTransaction
	or.. nil if none found."

	^ self protection critical:[|answer|
		answer := self support at: aTransaction ifAbsent:[nil].
		answer isNil 
			ifTrue:[answer]
			ifFalse:[answer results]]