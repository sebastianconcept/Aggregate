queries
basicFrom: start to: end
	"Answers aggregates found in this index 
	related to the given interval (as occurrences)."

	| sets bunchSize answer |
	#deprecated.
	self assert: end >= start.
	
	bunchSize := (end - start) +1.
	sets := self indexingSupport fromPosition: 1 to: end.
	answer := TreeSet sortSelector: selector equalitySelector: #isIdenticalTo:.

	"1. Adds all as if starts were always 1 (one)"
	1 to: sets size do:[:i|
		answer size > end ifFalse:[|nextOne|
			nextOne := sets at:i.
			answer addAll: nextOne]].

	"2. remove spurious elements at the beggining of those results (from 1 to start)"
	start > 1 ifTrue:[
		(start - 1) timesRepeat: [
			answer remove: answer first]].

	"3. remove spurious elements at the end of those results"
	answer size > bunchSize ifTrue:[|spurious|
		spurious := answer size - bunchSize.
		spurious timesRepeat: [
			answer remove: answer last]].
	
	^ answer 
	