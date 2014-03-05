as yet unclassified
withIndexDo: aBlock
	1 to: self size do: [:i | aBlock value: (self at: i) value: i]