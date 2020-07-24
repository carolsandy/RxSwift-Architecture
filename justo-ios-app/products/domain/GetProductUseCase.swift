import Foundation
import RxSwift

class GetProductUseCase {

    private let productsRepository: ProductsRepository!
    private let userRepository: UserRepository!

    init(productsRepository: ProductsRepository, userRepository: UserRepository) {
        self.productsRepository = productsRepository
        self.userRepository = userRepository
    }

    func fetchProduct(id: String) -> Observable<Product> {
        return userRepository.getUser()
                .catchErrorJustReturn(User.empty())
                .flatMap { user in
                    user.token.isEmpty ? self.productsRepository.fetchProduct(id: id) : self.productsRepository.fetchProduct(id: id, token: user.token)
                }
    }
}
