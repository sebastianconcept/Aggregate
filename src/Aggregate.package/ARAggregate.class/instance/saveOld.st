actions
saveOld
	"Saves this ActiveRecord in the repository"
	
	self onAboutToSave.

	isNew
		ifTrue:[
			self refresh.
			self onAboutToInsert.
			self storage add: self.
			self onAfterInsertion.]
		ifFalse:[|persistent|
			persistent := self class atId: self id.
			self onAboutToEnsureValuesIn: persistent from: self.
			self class ensureValuesIn: persistent from: self.
			self currentTransaction markDirty: persistent.
			self storage update: persistent realPersistent.
			self onAfterSave]