private
basicAtId: anId
	"Answers the aggregate found at anId"

	^ self storage find: self where: #id is: anId