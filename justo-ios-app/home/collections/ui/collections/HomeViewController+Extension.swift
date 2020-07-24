import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CategoriesCollectionDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collections[indexPath.row]
        switch item.type {
        case CollectionType.highlight.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForHighlightsCollection, for: indexPath) as! HighlightsCollectionView
            cell.collectionSelectedAction = self
            cell.collection = collections[indexPath.row].highlights ?? []
            return cell
        case CollectionType.product.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForProductsCollection, for: indexPath) as! ProductsCollectionView
            cell.productsCollectionUI = self
            cell.title = collections[indexPath.row].name
            cell.collection = collections[indexPath.row].productInfo?.products ?? []
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForCategoriesCollection, for: indexPath) as! CategoriesCollectionView
            cell.categoriesCollectionDelegate = self
            cell.title = .localizeString(for: "Categories Title Text")
            cell.collection = collections[indexPath.row].categories ?? []
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = collections[indexPath.row]
        switch item.type {
        case CollectionType.highlight.rawValue:
            return CGSize(width: view.frame.width, height: HomeConstants.heightForHighlightItem)
        case CollectionType.category.rawValue:
            return CGSize(width: view.frame.width, height: HomeConstants.heightForCategoryItem)
        default:
            return CGSize(width: view.frame.width, height: HomeConstants.heightForProductItem)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func selectedCategory(with id: String) {
        let searchViewController = SearchInjector().provideSearchViewController(category: id)
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
}
