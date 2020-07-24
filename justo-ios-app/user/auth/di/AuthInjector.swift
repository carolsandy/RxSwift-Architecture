import Foundation
import UIKit
import CoreData
import Apollo

class AuthInjector {
    
    fileprivate func provideManagedContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext ?? NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    }

    fileprivate func provideApolloClient() -> ApolloClient {
        return Network.shared.apolloClient
    }
       
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideAuthLocalDataSource() -> AuthLocalDataSource {
        return AuthLocalDataSource(managedContext: provideManagedContext())
    }

    fileprivate func provideAuthRemoteDataSource() -> AuthRemoteDataSource {
        return AuthRemoteDataSource(apolloClient: provideApolloClient(), apolloClientBuilder: provideApolloClientBuilder())
    }
    
    func provideAuthRepository() -> AuthRepository {
        return AuthRepository(authLocalDataSource: provideAuthLocalDataSource(), authRemoteDataSource: provideAuthRemoteDataSource())
    }

    fileprivate func provideSignInUseCase() -> SignInUseCase {
        return SignInUseCase(authRepository: provideAuthRepository())
    }

    fileprivate func provideSignUpUseCase() -> SignUpUseCase {
        return SignUpUseCase(authRepository: provideAuthRepository())
    }

    fileprivate func provideRecoverAccountUseCase() -> RecoverAccountUseCase {
        return RecoverAccountUseCase(authRepository: provideAuthRepository())
    }

    fileprivate func provideResetPasswordUseCase() -> ResetPasswordUseCase {
        return ResetPasswordUseCase(authRepository: provideAuthRepository())
    }
       
    fileprivate func provideSignInErrorHandler() -> SignInErrorHandler {
        return SignInErrorHandler()
    }
    
    fileprivate func provideSignUpErrorHandler() -> SignUpErrorHandler {
        return SignUpErrorHandler()
    }
    
    fileprivate func provideRecoverAccountErrorHandler() -> RecoverAccountErrorHandler {
        return RecoverAccountErrorHandler()
    }

    fileprivate func provideSignInPresenter(signInUI: SignInUI) -> SignInPresenter {
        return SignInPresenter(signInUI: signInUI, signInUseCase: provideSignInUseCase(), signInErrorHandler: provideSignInErrorHandler(), segmentIdentifier: AnalyticsInjector().provideSegmentIdentifier())
    }

    fileprivate func provideSignUpPresenter(signUpUI: SignUpUI) -> SignUpPresenter {
        return SignUpPresenter(signUpUI: signUpUI, signUpUseCase: provideSignUpUseCase(), signUpErrorHandler: provideSignUpErrorHandler(),
            analyticsUseCase: AnalyticsInjector().provideAnalyticsUseCase(), segmentIdentifier: AnalyticsInjector().provideSegmentIdentifier())
    }

    fileprivate func provideRecoverAccountPresenter(recoverAccountUI: RecoverAccountUI) -> RecoverAccountPresenter {
        return RecoverAccountPresenter(recoverAccountUI: recoverAccountUI, recoverAccountUseCase: provideRecoverAccountUseCase(), recoverAccountErrorHandler: provideRecoverAccountErrorHandler())
    }

    fileprivate func provideResetPasswordPresenter(resetPasswordUI: ResetPasswordUI) -> ResetPasswordPresenter {
        return ResetPasswordPresenter(resetPasswordUI: resetPasswordUI, resetPasswordUseCase: provideResetPasswordUseCase())
    }

    func provideSignInViewController() -> SignInViewController {
        let signInViewController = SignInViewController()
        signInViewController.presenter = provideSignInPresenter(signInUI: signInViewController)
        return signInViewController
    }

    func provideSignUpViewController() -> SignUpViewController {
        let signUpViewController = SignUpViewController()
        signUpViewController.presenter = provideSignUpPresenter(signUpUI: signUpViewController)
        return signUpViewController
    }

    func provideRecoverAccountViewController() -> UIViewController {
        let recoverAccountViewController = RecoverAccountViewController()
        recoverAccountViewController.presenter = provideRecoverAccountPresenter(recoverAccountUI: recoverAccountViewController)
        return recoverAccountViewController
    }

    func provideResetPasswordViewController() -> UIViewController {
        let resetPasswordViewController = ResetPasswordViewController()
        resetPasswordViewController.presenter = provideResetPasswordPresenter(resetPasswordUI: resetPasswordViewController)
        return resetPasswordViewController
    }

    func provideSignInNavigationController(signInNavigationDelegate: SignInNavigationDelegate, hasNextController: Bool) -> UINavigationController {
        let signInViewController = provideSignInViewController()
        signInViewController.signInNavigationDelegate = signInNavigationDelegate
        signInViewController.hasNextController = hasNextController
        return UINavigationController(rootViewController: signInViewController)
    }
}
