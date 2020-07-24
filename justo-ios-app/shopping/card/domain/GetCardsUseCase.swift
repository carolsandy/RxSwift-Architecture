import Foundation
import RxSwift

class GetCardsUseCase {
    
    private let userRepository: UserRepository
    private let cardRepository: CardRepository
    
    init(userRepository: UserRepository, cardRepository: CardRepository) {
        self.userRepository = userRepository
        self.cardRepository = cardRepository
    }
    
    func getCards() -> Observable<[SavedCard]> {
        return userRepository.getOrFetchUser().flatMap { user in
            self.cardRepository.getCards(token: user.token)
        }
    }
}
