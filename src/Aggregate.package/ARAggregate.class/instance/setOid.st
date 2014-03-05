private
setOid
	"Sets the object id value of this persistent object in the omnibase repository container.
	This message assumes that it has been made persistent in the current transaction."
	
	| theOid |

	theOid := super odbGetOID.

	self assert: theOid notNil.

	oid := theOid containerID -> theOid index