actions
save
	"Saves this Aggregate in the repository"

	| persistent |

	self onAboutToSave.

	isNew
		ifTrue:[
			self onAboutToInsert.
			self refresh.
			isNew := false.
			self storage add: self.
			self onAfterInsertion]
		ifFalse:[
			self isODBPersistent
				ifTrue:[persistent := self]
				ifFalse:[persistent := self current].
			self onAboutToEnsureValuesIn: persistent from: self.
			self class ensureValuesIn: persistent from: self.
			isNew := false.
			self currentTransaction markDirty: persistent.
			self storage update: persistent.
			persistent onAfterSave]