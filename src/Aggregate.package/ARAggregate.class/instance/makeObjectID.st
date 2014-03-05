actions
makeObjectID
	"Answers the fabricated instance of ODBObjectID 
	given the container and index data of this persistent aggregate."
	
	^ oid notNil 
		ifTrue:[ODBObjectID containerID: oid key index: oid value]
		ifFalse:[nil]