as yet unclassified
existingLeafForKey: aMagnitude
       "Unlike #leafForKey:, this method looks for a leaf but doesn't mess with the tree if it doesn't exist."
       | child |
       child := self existingChildForKey: aMagnitude.
       ^ child ifNotNil: [child existingLeafForKey: aMagnitude]