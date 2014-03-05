accessing
containerFor: anAggregate in: aStorage
	"Answers the container to be used for anAggregate"

	^ [:container|
		container notNil
			ifTrue:[container containerNamed: self defaultContainerName ifAbsent: [
						self error: 'Something unexpected (and basic) is not right about this repository']]
			ifFalse:[self error: 'Can''t decide which container to use :(']] value: ARCurrentClient value