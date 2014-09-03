actions
undelete
	"The receiver is going to be unmarked from deleted in the repository."

	| persistent |
	
	self onAboutToUndelete.

	self isNew
		ifTrue:[
			self refresh.
			isDeleted := false.
			self storage add: self]
		ifFalse:[
			self isODBPersistent
				ifTrue:[persistent := self]
				ifFalse:[persistent := self fresh.
						self onAboutToEnsureValuesIn: persistent from: self.
						self class ensureValuesIn: persistent from: self].
			persistent beUndeleted.
			self currentTransaction markDirty: persistent.
			self storage update: persistent.
			persistent onAfterUndelete]			
