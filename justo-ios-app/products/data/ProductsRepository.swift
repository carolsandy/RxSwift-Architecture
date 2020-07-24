import Foundation
import RxSwift

class ProductsRepository {
    
    private let productsRemoteDataSource: ProductsRemoteDataSource
    
    init(productsRemoteDataSource: ProductsRemoteDataSource) {
        self.productsRemoteDataSource = productsRemoteDataSource
    }
    
    func fetchProduct(id: String, token: String = StringConstants.empty) -> Observable<Product> {
        return productsRemoteDataSource.fetchProduct(id: id, token: token)
    }
}
