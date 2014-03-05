actions
removeIndexOf: aSelector in: anAggregateClass
	"Removes all the indices dedicated to anAggregateClass in this storage."

	| exIndex |

	exIndex := self indexFor: anAggregateClass selector: aSelector ifAbsent:[^nil].
	self removeIndex: exIndex
	