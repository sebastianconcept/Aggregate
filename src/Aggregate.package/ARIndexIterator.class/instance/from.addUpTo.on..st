private
from: someSets addUpTo: endPosition on: someElements
	 "Adds to someElements the elements on the last set
	of someSets but limited to an endPosition (if reacheable)"
	
	| offset |
	
	"1. Calculate the size of the sum of all the sets 
	(drawing the segment helps to get why; it's about the offset)."
	offset := someSets inject: 0 into: [:sum :pair| sum + pair value].
	
	"2. Decide what to add regarding to endPosition 
	and the last set (which is not processed yet)"
	endPosition >= offset 
		ifTrue:[
			"All the elements of the last set must be added"
			someElements addAll: someSets last key]
		ifFalse:[|relativePosition firstSegmentOffset|
			"Some elements of last set must be added, so..
			calculate the relative position of the end of the iteration"
			firstSegmentOffset := someSets allButLast inject: 0 into: [:sum :pair| 
									sum + pair value].
			relativePosition := endPosition - firstSegmentOffset.
			"..and add that little bunch"
			someElements addAll: (someSets last key copyFrom: 1 to: relativePosition)]
	
