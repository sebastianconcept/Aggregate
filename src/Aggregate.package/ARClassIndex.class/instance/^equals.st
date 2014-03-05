testing
= anIndex
	"Answers true if this index stores the same as anIndex"
	^ self aggregateClassName = anIndex aggregateClassName and:[
	self selector = anIndex selector]