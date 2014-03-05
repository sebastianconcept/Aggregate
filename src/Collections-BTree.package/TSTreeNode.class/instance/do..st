private
do: aBlock
	self nodesDo: [:ea | ea value ifNotNilDo: aBlock]