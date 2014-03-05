actions
destroy
	"The receiver is going to be permanently removed from the repository.
	CAUTION: there is no undo for this action and it may leave inconsistences in the repository.
	Please be extremely aware of what you are doing when asking an aggregate to be destroyed."

	| persistent |	
	self onAboutToDestroy.

	self isNew ifTrue:[^self onAfterDestroy].

	self isODBPersistent
		ifTrue:[persistent := self]
		ifFalse:[persistent := self fresh].

	persistent ifNotNil:[
		self storage remove: persistent.
		persistent onAfterDestroy]