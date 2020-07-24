import Foundation
import Apollo
import RxSwift

class ProductsRemoteDataSource {
    
    private let apolloClientBuilder: ApolloClientBuilder!
    
    init(apolloClientBuilder: ApolloClientBuilder) {
        self.apolloClientBuilder = apolloClientBuilder
    }
    
    func fetchProduct(id: String, token: String) -> Observable<Product> {
        let productId = FetchProductQuery(id: id)
        return apolloClientBuilder.createApolloClientWith(token: token).apolloRX.fetch(query: productId).compactMap { data in data.product?.asProduct() }
    }
}
