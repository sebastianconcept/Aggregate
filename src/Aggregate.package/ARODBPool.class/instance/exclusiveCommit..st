actions
exclusiveCommit: aBlock
	"Evaluates aBlock in an atomic 
	transactional environment that actually can write things"
	^ self exclusiveCommit: aBlock readOnly: false