import Foundation
import UIKit

extension SearchViewController: ProductsCollectionDelegate, SubcategoriesCollectionDelegate {
    
    func productSelected(with id: String) {
        let productDetailViewController = ProductsInjector().provideProductDetailViewController(productId: id)
        self.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
    func loadMore(endCursor: String) {
        let categories = [subcategory.isEmpty ? category : subcategory]
        let searchRequest = SearchRequest(after: endCursor, query: query, categoryParent: category, categories: categories)
        presenter.loadMore(searchRequest: searchRequest)
    }
    
    func subcategorySelected(with id: String) {
        subcategory = id
        productsDataSource.products.removeAll()
        
        let searchRequest = SearchRequest(query: query, categoryParent: category, categories: [id])
        presenter.updateProductsByCategory(searchRequest: searchRequest)
    }
    
    func updateItem(quantity: Int, variantId: String) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: quantity)
    }
    
    func updateLine(variantId: String, quantity: Int) {
        presenter.updateCheckoutLine(checkoutLineUpdate: CheckoutLineUpdate(quantity: quantity, variantId: variantId))
    }
}
