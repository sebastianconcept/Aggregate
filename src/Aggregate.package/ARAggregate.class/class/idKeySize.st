private
idKeySize
	"Answers the default size for keys on indices.
	It assumes it's about an UUID value asString36 which
	seems to need 25 bytes, so we're being wasty in 1 byte just in case..

	self assert: (UUID new asString36 asBtreeKeyOfSize: 26) last = 0"

	^ 26