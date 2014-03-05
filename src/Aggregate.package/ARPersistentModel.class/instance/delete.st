actions
delete
	"The receiver is going to be marked as deleted in the repository.
	Usually a safe operation: the aggregate will still be undeletable.
	This is for usability reasons. Use to destroy to vanish the aggregate."

	| persistent |
	
	self onAboutToDelete.

	self isNew
		ifTrue:[
			self refresh.
			isDeleted := true.
			self storage add: self]
		ifFalse:[
			self isODBPersistent
				ifTrue:[persistent := self]
				ifFalse:[persistent := self fresh.
						self onAboutToEnsureValuesIn: persistent from: self.
						self class ensureValuesIn: persistent from: self].
			persistent beDeleted.
			self currentTransaction markDirty: persistent.
			self storage update: persistent.
			persistent onAfterDelete]			
