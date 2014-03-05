private
basicSizeOfIndex: aSymbol
	"Answers the quantity of stored instances 
	of this particular aggregate on the aSymbol index"

	^ (self storage indexFor: self selector: aSymbol) size
