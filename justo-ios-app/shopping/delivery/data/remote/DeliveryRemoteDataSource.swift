import Foundation
import Apollo
import RxSwift

class DeliveryRemoteDataSource {
    
    private let apolloClient: ApolloClient
    
    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }

    func fetchDeliveryDates(token: String, postalCode: String) -> Observable<FetchDeliveryDatesQuery.Data.DeliverySlot> {
        return apolloClient.apolloRX.fetch(query: FetchDeliveryDatesQuery(token: token, postalCode: postalCode))
            .compactMap { data in data.deliverySlots }
    }
}
