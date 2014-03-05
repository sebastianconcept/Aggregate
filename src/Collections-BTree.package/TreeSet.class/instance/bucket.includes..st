private
bucket: anArray includes: anObject
	^ anArray anySatisfy: [:ea | (self value: anObject matches: ea)]