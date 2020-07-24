import Foundation
import RxSwift

class GetDeliveryDatesUseCase {
        
    private let userRepository: UserRepository
    private let deliveryRepository: DeliveryRepository
    
    init(userRepository: UserRepository, deliveryRepository: DeliveryRepository) {
        self.userRepository = userRepository
        self.deliveryRepository = deliveryRepository
    }
    
    func fetchDeliveryDates(postalCode: String) -> Observable<[DeliveryDay]> {
        return userRepository.getOrFetchUser().flatMap { user in self.deliveryRepository.fetchDeliveryDates(token: user.uuid, postalCode: postalCode) }
    }
}
