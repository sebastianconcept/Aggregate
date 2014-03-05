queries
from: start to: end do: aBlock for: aStorage
	"Answers the aggregates found in this index 
	related to the given interval."
	
	^ ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		self indexingSupport 
			from: start
			to: end 
			do:[:bunch| bunch do: aBlock]]