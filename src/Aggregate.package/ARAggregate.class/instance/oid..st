accessing
oid: anObject

	"Note: reject setting nil."
	(oid notNil and:[
	anObject isNil]) ifTrue:[^self].

	"(oid notNil and:[
	anObject notNil]) ifTrue:[self halt]."

	"oid ifNotNil:[
		self assert: anObject notNil]."
	
	oid := anObject