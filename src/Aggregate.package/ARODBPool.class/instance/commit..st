actions
commit: aBlock
	"Evaluates aBlock in an atomic 
	transactional environment that actually can write things"
	^ self commit: aBlock readOnly: false