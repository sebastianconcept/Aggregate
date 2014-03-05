private
exclusiveCommit: aBlock readOnly: aBoolean
	"Evaluates aBlock commiting any change to the repository.
	Read only or not depends on aBoolean's value"

	^ self exclusiveEvaluate: aBlock readOnly: aBoolean commit: true