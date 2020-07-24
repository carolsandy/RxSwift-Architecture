import Foundation
import RxSwift

class DeliveryRepository {
    
    private let deliveryRemoteDataSource: DeliveryRemoteDataSource
    
    init(deliveryRemoteDataSource: DeliveryRemoteDataSource) {
        self.deliveryRemoteDataSource = deliveryRemoteDataSource
    }
    
    func fetchDeliveryDates(token: String, postalCode: String) -> Observable<[DeliveryDay]> {
        return deliveryRemoteDataSource.fetchDeliveryDates(token: token, postalCode: postalCode)
            .map { deliverySlots in deliverySlots.asDeliveryDates() }
    }
}
