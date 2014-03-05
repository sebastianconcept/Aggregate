accessing
odbGetOID
	"Answers the omnibase object ID for this persistent object.
	Note that this overrides OmniBase default way to get the object id by:
	1. trying  the 'fabricated' object ID using the container and index data, BWT ~x8 faster than
	2. falling back to the OmniBase's way"
		
	^ self hasOid 
		ifTrue:[self makeObjectID]
		ifFalse:[super odbGetOID]
	
