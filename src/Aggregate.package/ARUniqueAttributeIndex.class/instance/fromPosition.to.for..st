queries
fromPosition: start to: end for: aStorage
	"Answers the aggregates found in this index 
	related to the given interval."
	
	^ ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		self indexingSupport fromPosition: start to: end]