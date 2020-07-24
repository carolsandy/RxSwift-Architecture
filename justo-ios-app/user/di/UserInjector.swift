import Foundation
import UIKit
import CoreData
import Apollo

class UserInjector {
    
    fileprivate func provideManagedObjectContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext ?? NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    }
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideApolloClient() -> ApolloClient {
        return Network.shared.apolloClient
    }
    
    fileprivate func provideUserLocalDataSource() -> UserLocalDataSource {
        return UserLocalDataSource(managedContext: provideManagedObjectContext())
    }
    
    fileprivate func provideUserRemoteDataSource() -> UserRemoteDataSource {
        return UserRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
       
    func provideUserRepository() -> UserRepository {
        return UserRepository(userLocalDataSource: provideUserLocalDataSource(), userRemoteDataSource: provideUserRemoteDataSource())
    }
       
    func provideGetUserUseCase() -> GetUserUseCase {
        return GetUserUseCase(userRepository: provideUserRepository())
    }
    
    fileprivate func provideUpdateUserUseCase() -> UpdateUserUseCase {
        return UpdateUserUseCase(userRepository: provideUserRepository())
    }
    
    fileprivate func provideCloseSessionUseCase() -> CloseSessionUseCase {
        return CloseSessionUseCase(userRepository: provideUserRepository(), authRepository: AuthInjector().provideAuthRepository())
    }
    
    func provideGetAddressUseCase() -> GetAddressUseCase {
        return GetAddressUseCase(userRepository: provideUserRepository())
    }
    
    fileprivate func provideUpdatePasswordUseCase() -> UpdatePasswordUseCase {
        return UpdatePasswordUseCase(userRepository: provideUserRepository())
    }
    
    fileprivate func provideEditProfileErrorHandler() -> EditUserProfileErrorHandler {
        return EditUserProfileErrorHandler()
    }
    
    fileprivate func provideEditPasswordErrorHandler() -> EditPasswordErrorHandler {
        return EditPasswordErrorHandler()
    }
    
    func provideUserPresenter(userUI: UserUI) -> UserPresenter {
        let userPresenter = UserPresenter(getUserUseCase: provideGetUserUseCase(), closeSessionUseCase: provideCloseSessionUseCase())
        userPresenter.ui = userUI
        return userPresenter
    }
    
    fileprivate func provideEditUserProfilePresenter(editProfileUI: EditProfileUI) -> EditUserProfilePresenter {
        let editUserProfilePresenter = EditUserProfilePresenter(getUserUseCase: provideGetUserUseCase(), updateUserUseCase: provideUpdateUserUseCase(), editUserProfileErrorHandler: provideEditProfileErrorHandler())
        editUserProfilePresenter.ui = editProfileUI
        return editUserProfilePresenter
    }
    
    fileprivate func provideEditPasswordPresenter(editPasswordUI: EditPasswordUI) -> EditPasswordPresenter {
        let editPasswordPresenter = EditPasswordPresenter(updatePasswordUseCase: provideUpdatePasswordUseCase(), editPasswordErrorHandler: provideEditPasswordErrorHandler())
        editPasswordPresenter.ui = editPasswordUI
        return editPasswordPresenter
    }
    
    func provideProfileViewController() -> ProfileViewController {
        let profileViewController = ProfileViewController()
        profileViewController.presenter = provideUserPresenter(userUI: profileViewController)
        return profileViewController
    }
    
    func provideEditProfileViewController() -> EditProfileViewController {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.presenter = provideEditUserProfilePresenter(editProfileUI: editProfileViewController)
        return editProfileViewController
    }
    
    func provideEditPasswordViewController() -> EditPasswordViewController {
        let editPasswordViewController = EditPasswordViewController()
        editPasswordViewController.presenter = provideEditPasswordPresenter(editPasswordUI: editPasswordViewController)
        return editPasswordViewController
    }
    
    func provideTermsAndConditionsViewController() -> WebWithURLViewController {
        let termsAndConditionsViewController =  WebWithURLViewController(webType: WebType.termsAndconditionsURL)
        return termsAndConditionsViewController
    }
    
    func providePrivacyAdviceViewController() -> WebWithURLViewController {
        let privacyAdviceViewController = WebWithURLViewController(webType: WebType.privacyAdvice)
        return privacyAdviceViewController
    }
}
