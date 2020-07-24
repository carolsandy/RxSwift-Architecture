import Foundation
import RxSwift

class SignInPresenter {
    
    fileprivate weak var signInUI: SignInUI?
    let signInUseCase: SignInUseCase
    let signInErrorHandler: SignInErrorHandler
    private let segmentIdentifier: SegmentIdentifier

    private let disposeBag = DisposeBag()
    
    init(signInUI: SignInUI, signInUseCase: SignInUseCase, signInErrorHandler: SignInErrorHandler, segmentIdentifier: SegmentIdentifier) {
        self.signInUI = signInUI
        self.signInUseCase = signInUseCase
        self.signInErrorHandler = signInErrorHandler
        self.segmentIdentifier = segmentIdentifier
    }

    func signIn(userCredentials: UserCredentials) {
        signInUI?.resetFields()
        let areUserValidCredentials = signInErrorHandler.areUserValidCredentials(userCredentials: userCredentials)
        guard !areUserValidCredentials.invalid else {
            self.signInUI?.showSignInError(areUserValidCredentials.error); return
        }
        signInUI?.showLoader()
        signInUseCase.signIn(userCredentials: userCredentials)
            .do(onNext: { user in self.trackIdentify(user) })
            .subscribe(onNext: { authToken in
                self.signInUI?.hideLoader()
                if authToken.errors.isEmpty {
                    self.signInUI?.showSignInSuccess(authToken: authToken)
                } else {
                    self.signInUI?.showSignInError(SignInError.graphQL(authToken.errors.first.orDefaultString()))
                }
            }, onError: { error in
                self.signInUI?.hideLoader()
                self.signInUI?.showSignInError(error)
            })
            .disposed(by: disposeBag)
    }

    private func trackIdentify(_ user: User) {
        segmentIdentifier.identity(userId:user.uuid, userName: "\(user.firstName) \(user.lastName)", userEmail: user.email)
            .subscribe()
            .disposed(by: disposeBag)
    }
}

protocol SignInUI: class {
    
    func showLoader()
    func hideLoader()
    func showSignInSuccess(authToken: User)
    func showSignInError(_ errorType: Error)
    func resetFields()
}
