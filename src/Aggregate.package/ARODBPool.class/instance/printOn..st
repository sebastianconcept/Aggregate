private
printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: '(',self hash asString,' on ',path asString,' ', self idleClients size asString,' idle, ',self busyClients size asString,' busy)'