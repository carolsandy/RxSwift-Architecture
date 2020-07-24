import Foundation
import RxSwift

class CreateOpenPayPaymentUseCase {
    
    private let openPayRepository: OpenPayRepository
    
    init(openPayRepository: OpenPayRepository) {
        self.openPayRepository = openPayRepository
    }
    
    func createOpenPayPayment(card: Card) -> Observable<OpenPayPayment> {
        return openPayRepository.createOpenPayPayment(card: card)
    }
}
