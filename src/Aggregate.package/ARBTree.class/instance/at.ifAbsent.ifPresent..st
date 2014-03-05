actions
at: key ifAbsent: absentReaction ifPresent: presentReaction
	"Lookup the given key in the receiver. 
	If it is present, answer the value of evaluating 
	presentReaction block with the value associated with the key. 
	Otherwise, evaluate absentReaction block."

	^ presentReaction value: (self at: key ifAbsent: absentReaction)
