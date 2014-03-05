private
containerNameFor: anAggregate
	"Answers the name of the container to be used for anAggregate"
	
	^ containerPolicy containerNameFor: anAggregate in: self