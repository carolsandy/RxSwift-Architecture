import Foundation
import RxSwift

class CardRepository {
    
    private let cardRemoteDataSource: CardRemoteDataSource
    
    init(cardRemoteDataSource: CardRemoteDataSource) {
        self.cardRemoteDataSource = cardRemoteDataSource
    }
    
    func getCards(token: String) -> Observable<[SavedCard]> {
        return cardRemoteDataSource.getCards(token: token).compactMap { savedCards in
            savedCards.asCards() }
    }
}
