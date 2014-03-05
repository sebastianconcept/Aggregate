An ARStorage is the guy that actually adds, removes and updates aggregates in the repository so everybody can be confident.
It does the validations before saving and it can destroy dependents (it goes deeply if it has to).
To add aggregates it follows the defined container chosing policy (expected to be invariant on the storage life-span).
