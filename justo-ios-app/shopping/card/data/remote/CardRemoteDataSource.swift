import Foundation
import RxSwift

class CardRemoteDataSource {
    
    private let apolloClientBuilder: ApolloClientBuilder
    private let cardsFirstParam = 20
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func getCards(token: String) -> Observable<FetchPaymentMethodsQuery.Data.Me.SavedCard> {
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: FetchPaymentMethodsQuery(first: cardsFirstParam))
            .compactMap { data in data.me?.savedCards }
    }
}
