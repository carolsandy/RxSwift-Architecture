import Foundation
import UIKit

extension CollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let collectionDetail = collection {
            return collectionDetail.productInfo.products.count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForProductCell, for: indexPath) as! ProductViewCell
        if let product = collection?.productInfo.products[indexPath.row] {
            cell.product = product
            cell.updateProductItemDelegate = self
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,  viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionConstants.identifierForCollectionHeader, for: indexPath as IndexPath) as! CollectionReusableView
        if let collectionDetail = collection { headerView.bindHeader(withItem: collectionDetail) }
        
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let id = collection?.productInfo.products[indexPath.row].id {
            let controller = ProductsInjector().provideProductDetailViewController(productId: id)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CollectionConstants.heightForCollectionHeader)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  (CollectionConstants.defaultInsetSize * CollectionConstants.numberOfColumnsInCollection) + CollectionConstants.defaultMinSpacing
        let cellWidth = collectionView.frame.size.width - padding
        return CGSize(width: cellWidth / CollectionConstants.numberOfColumnsInCollection, height: CollectionConstants.heightForProductItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.defaultInsetSize, left: CollectionConstants.defaultInsetSize, bottom: CollectionConstants.defaultInsetSize, right: CollectionConstants.defaultInsetSize)
    }
}

extension CollectionViewController: UpdateProductItemDelegate {
    func updateLine(variantId: String, quantity: Int) {
        presenter.updateCheckoutLine(checkoutLineUpdate: CheckoutLineUpdate(quantity: quantity, variantId: variantId))
    }
    
    func updateProductItem(quantity: Int, variantId: String) {
        updateNavCartBadge(image: "cartLine", action: #selector(showCartOrSignIn), target: self, badgeValue: quantity)
    }
}
