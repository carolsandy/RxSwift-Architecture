import Foundation
import Apollo
import CoreData

class ProductsInjector {
    
    fileprivate func provideApolloClientBuilder() -> ApolloClientBuilder {
        return ApolloClientBuilder()
    }
    
    fileprivate func provideManagedContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext ?? NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    }
    
    fileprivate func provideProductsRemoteSource() -> ProductsRemoteDataSource {
        return ProductsRemoteDataSource(apolloClientBuilder: provideApolloClientBuilder())
    }
    
    fileprivate func provideProductsRepository() -> ProductsRepository {
        return ProductsRepository(productsRemoteDataSource: provideProductsRemoteSource())
    }
    
    fileprivate func provideGetProductUseCase() -> GetProductUseCase {
        return GetProductUseCase(productsRepository: provideProductsRepository(),userRepository: UserInjector().provideUserRepository())
    }
    
    func provideProductDetailPresenter(productDetailUI: ProductDetailUI) -> ProductDetailPresenter {
        let productDetailPresenter = ProductDetailPresenter(getProductUseCase: provideGetProductUseCase(), getUserUseCase: UserInjector().provideGetUserUseCase(), updateLineCheckoutUseCase: ShoppingInjector().provideUpdateLineCheckoutUseCase())
        productDetailPresenter.ui = productDetailUI
        return productDetailPresenter
    }
    
    func provideProductsDataSource() -> UICollectionProductsDataSource {
        return UICollectionProductsDataSource()
    }
    
    func provideProductDetailViewController(productId: String) -> ProductDetailViewController {
        let productDetailViewController = ProductDetailViewController()
        productDetailViewController.productId = productId
        productDetailViewController.presenter = provideProductDetailPresenter(productDetailUI: productDetailViewController)
        return productDetailViewController
    }
}
