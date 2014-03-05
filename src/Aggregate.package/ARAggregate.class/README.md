An ARAggregate is a minimalistic abstraction of a unique persistent object stored in a storage (which currently is stored using an OmniBase repository).

The cache instance class variable will store transidently some aggregates that may be configured to do so (by how the query is implemented). That cache is designed to have an very short life span: the same duration of a transaction. When the transaction commits or aborts, those elements will be purged. Purging the cache is harmless for the transaction.

