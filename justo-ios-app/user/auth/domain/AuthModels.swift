import Foundation

struct UserCredentials {
    var email: String
    var password: String
}

extension UserCredentials {
    func asSignInRequest() -> SignInMutation {
        return SignInMutation.init(email: email, password: password)
    }
}

struct User {
    var token: String
    var uuid: String
    var email: String
    var firstName: String
    var lastName: String
    var userCheckout: Checkout
    var addresses: [Address]
    var errors: [String]

    init(token: String = StringConstants.empty, uuid: String = StringConstants.empty, email: String = StringConstants.empty,
         firstName: String = StringConstants.empty, lastName: String = StringConstants.empty,
         userCheckout: Checkout = Checkout(), addresses: [Address] = [], errors: [String] = []) {
        self.token = token
        self.uuid = uuid
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.userCheckout = userCheckout
        self.addresses = addresses
        self.errors = errors
    }

    static func empty() -> User {
        return User()
    }
}

struct UserRegister {
    var firstName: String
    var lastName: String
    var email: String
    var zipCode: String
    var password: String
    var confirmPassword: String
    var acceptTermsAndConditions: Bool
}

extension UserRegister {
    func asSignUpRequest() -> SignUpMutation {
        return SignUpMutation.init(firstName: firstName,
                                   lastName: lastName,
                                   email: email,
                                   zipCode: zipCode,
                                   password: password)
    }
}

struct RecoverPassword {
    var email: String

    func asRecoverAccountRequest() -> RecoverPasswordMutation {
        return RecoverPasswordMutation(input: CustomerPasswordResetInput(email: email))
    }
}

struct NewPassword {
    var token: String
    var uidb64: String
    var newPassword: String

    func asSetNewPasswordRequest() -> SetNewPasswordMutation {
        return SetNewPasswordMutation(input: SetNewPasswordInput(token: token,
                                                                 uidb64: uidb64,
                                                                 newPassword: newPassword)
        )
    }
}
