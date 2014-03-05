private
primaryIndex
	"Answers primary index (which index identity)
	of this particular kind of aggregates"

	^ self storage indexFor: self selector: #id
