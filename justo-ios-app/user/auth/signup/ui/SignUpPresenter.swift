import Foundation
import RxSwift

class SignUpPresenter {

    fileprivate weak var signUpUI: SignUpUI?
    private let signUpUseCase: SignUpUseCase
    private let signUpErrorHandler: SignUpErrorHandler
    private let analyticsUseCase: AnalyticsUseCase
    private let segmentIdentifier: SegmentIdentifier

    private let disposeBag = DisposeBag()

    init(signUpUI: SignUpUI, signUpUseCase: SignUpUseCase, signUpErrorHandler: SignUpErrorHandler, analyticsUseCase: AnalyticsUseCase,
         segmentIdentifier: SegmentIdentifier) {
        self.signUpUI = signUpUI
        self.signUpUseCase = signUpUseCase
        self.signUpErrorHandler = signUpErrorHandler
        self.analyticsUseCase = analyticsUseCase
        self.segmentIdentifier = segmentIdentifier
    }

    func signUp(userRegister: UserRegister) {
        signUpUI?.resetForm()
        let areValidUserData = signUpErrorHandler.areUserValidCredentials(userRegister: userRegister)
        guard !areValidUserData.error else {
            signUpUI?.showSignUpError(areValidUserData.message); return }
        
        signUpUI?.showLoader()
        signUpUseCase.signUp(userRegister: userRegister)
            .do(onNext: { user in
                self.trackIdentify(user)
            })
            .subscribe(onNext: { authToken in
                self.signUpUI?.hideLoader()
                if authToken.errors.isEmpty {
                    self.signUpUI?.showSignUpSuccess(authToken: authToken)
                } else {
                    self.signUpUI?.showSignUpError(SignUpError.graphQL(authToken.errors.first.orDefaultString()))
                }
            }, onError: { error in
                self.signUpUI?.hideLoader()
                self.signUpUI?.showSignUpError(error)
            })
            .disposed(by: disposeBag)
    }

    private func trackIdentify(_ user: User) {
        segmentIdentifier
            .identity(userId:user.uuid, userName: "\(user.firstName) \(user.lastName)", userEmail: user.email)
            .andThen(analyticsUseCase.trackEvent(eventName: AnalyticsEvents.SIGN_UP_COMPLETE_EVENT))
            .subscribe()
            .disposed(by: disposeBag)
    }
}

protocol SignUpUI: class {

    func showLoader()

    func hideLoader()

    func showSignUpSuccess(authToken: User)

    func showSignUpError(_ errorType: Error)
    
    func resetForm()
}
