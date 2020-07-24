import Foundation

extension AddressAddMutation.Data.AddressCreate {
    
    func asErrors() -> [String] {
        let errorMessages = self.errors?.compactMap { error in error.message }
        return errorMessages.orDefaultArray()
    }
}
