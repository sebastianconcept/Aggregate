ARContainerPolicy is the abstract (parent) class of the policies for deciding which container should be used to persist a new object in the repository.

There are a lot of possible ways to do this so see subclasses for a more concrete behavior.

Beware: during the life-span of a repository is not recomended to change the policy. It's probably less error prone to re-incarnate the whole repository in a new repository with a new storage that uses the new policy.