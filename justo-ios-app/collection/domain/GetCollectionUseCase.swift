import Foundation
import RxSwift

class GetCollectionUseCase {

    private let collectionsRepository: CollectionsRepository
    private let userRepository: UserRepository

    init(collectionsRepository: CollectionsRepository, userRepository: UserRepository) {
        self.collectionsRepository = collectionsRepository
        self.userRepository = userRepository
    }

    func fetchCollectionBy(id: String) -> Observable<Collection> {
        return userRepository.getOrFetchUser()
                .catchErrorJustReturn(User.empty())
                .flatMap { user in
                    user.token.isEmpty ? self.collectionsRepository.fetchCollection(id: id) : self.collectionsRepository.fetchCollection(id: id, token: user.token)
                }
    }
}
