actions
readOnly: aBlock
	"Evaluates aBlock in an atomic 
	transactional environment that can't write anything"
	^ self evaluate: aBlock readOnly: true