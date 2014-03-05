queries
from: startPosition to: endPosition
	"Answers the aggregates found in the index 
	in the given interval (as ocurrences)"

	| tree sets current target offset relativeStart relativeEnd elements |
	
	tree := index indexingSupport.
	sets := OrderedCollection new.
	elements := TreeSet sortSelector: index selector equalitySelector: #isIdenticalTo:.

	"1. get the first element"
	current := tree getFirst value.
	"the sets are stored in association to nil
	but then nil will be its (cached) size"
	sets add: current -> current size.	

	"2. iterate until the target set is found.
	The target set is the one at which the element
	located at startPosition can be found."
	[target isNil] whileTrue:[
		(self inSegment: sets isIncluded: startPosition) 
			ifTrue:[target := current]
			ifFalse:[
				current := tree getNext value.
				sets add: current -> current size]].

	"3. Calculate the size of the sum of all the sets 
	previous to the target (drawing the segment 
	helps to get why; it's about the offset)."
	offset := sets allButLast inject: 0 into: [:sum :pair| sum + pair value].

	"4. Know the position to start fetching 
	relative to the target set."
	relativeStart := startPosition - offset.
	relativeStart isZero ifTrue: [
		relativeStart := 1].

	relativeEnd := sets last value min: (endPosition - offset).		

	"5. fetch the elements of the target set
	This gets discernable in 2 seconds if you sketch 
	the sgments."
	elements addAll: (target 
						copyFrom: relativeStart 
						to: relativeEnd).

	"6. if the endPosition is inside the target set then we
	can return the fetched elements by now."
	endPosition <= (sets inject: 0 into: [:sum :pair| sum + pair value]) ifTrue:[
		^ elements].

	"7. iterate until the set including the endPosition is found,
	adding elements as it goes."
	[sets last value <= endPosition] whileTrue:[
		current := tree getNext.
		current 
			ifNil:[
				"End of the index reached!"
				^elements]
			ifNotNil:[current := current value].
		sets add: current -> current size.
		self from: sets addUpTo: endPosition on: elements].
	
	"8. Return the precious results :)"
	^ elements 