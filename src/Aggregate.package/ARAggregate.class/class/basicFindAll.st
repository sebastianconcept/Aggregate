private
basicFindAll
	"Answers all stored instances of this kind aggregate
	including the ones of its subclasses."

	| subaggregateClasses |

	subaggregateClasses := self aggregateClasses.
	^  self basicFindAllFor: subaggregateClasses
