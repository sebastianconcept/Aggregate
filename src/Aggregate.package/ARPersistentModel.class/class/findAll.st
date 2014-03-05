queries
findAll
	"All subclasses should expect that a #findAll means the not deleted guys."

	^ super findAll reject: [:each | each isDeleted ]