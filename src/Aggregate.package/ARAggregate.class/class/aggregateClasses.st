accessing
aggregateClasses
	"Answers the set of classes which are concrete aggregates.
	Note: deprecated or abstract ones are going to be excluded"

	^ self withAllSubclasses reject: [ :aClass | aClass isAbstract or: [ aClass isDeprecated ] ]