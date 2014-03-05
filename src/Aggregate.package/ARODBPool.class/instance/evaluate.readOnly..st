private
evaluate: aBlock readOnly: aBoolean
	"Evaluates aBlock without commiting any change to the repository.
	Read only or not depends on aBoolean's value"
	
	^ self evaluate: aBlock readOnly: aBoolean commit: false