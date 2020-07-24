import Foundation

struct UserUpdateInput {
    var firstName: String
    var lastName: String
}

struct PasswordUpdateInput {
    var newPassword: String
    var newPasswordConfirmation: String
}

extension UserUpdateInput {
    func asEditAccountMutation() -> EditAccountMutation {
        return EditAccountMutation(input: CustomerInput(firstName: firstName, lastName: lastName))
    }
}

extension PasswordUpdateInput {
    func asUpdatePasswordMutation() -> UpdatePasswordMutation {
        return UpdatePasswordMutation(input: ChangePasswordInput(newPassword1: newPassword, newPassword2: newPasswordConfirmation))
    }
}
