import Foundation
import UIKit

class UICollectionProductsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UIScrollViewDelegate, UpdateProductItemDelegate {
    
    weak var productsCollectionDelegate: ProductsCollectionDelegate?
    
    weak var collectionView: UICollectionView! {
        didSet {
            configureCollectionView()
        }
    }
    
    var productInfo: ProductInfo? {
        didSet {
            if let currentProducts = productInfo?.products {
                products.isEmpty ? products = currentProducts : products.append(contentsOf: currentProducts)
            }
        }
    }
    
    var products: [Product] = [] {
        didSet {
            if products.isEmpty {
                collectionView.reloadData()
            } else if let products = productInfo?.products {
                reloadItemsAtIndexPaths(with: products)
            }
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let productCellNib = UINib(nibName: HomeConstants.nibForProductCell, bundle: nil)
        collectionView.register(productCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForProductCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForProductCell, for: indexPath) as! ProductViewCell
        let item = products[indexPath.row]
        cell.product = item
        cell.updateProductItemDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  (SearchConstants.defaultInsetSize * SearchConstants.numberOfColumnsInCollection) + SearchConstants.defaultMinSpacing
        let cellWidth = collectionView.frame.size.width - padding
        return CGSize(width: cellWidth / SearchConstants.numberOfColumnsInCollection, height: SearchConstants.heightForProductItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.defaultInsetSize, left: SearchConstants.defaultInsetSize, bottom: SearchConstants.defaultInsetSize, right: SearchConstants.defaultInsetSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        productsCollectionDelegate?.productSelected(with: product.id)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let currentProductInfo = productInfo {
            guard (currentProductInfo.hasNext && !currentProductInfo.endCursor.isEmpty) else { return }
            if (indexPath.row == products.count - 1) {
                self.productsCollectionDelegate?.loadMore(endCursor: currentProductInfo.endCursor)
            }
        }
    }
    
    private func reloadItemsAtIndexPaths(with products: [Product]) {
        let startIndex = collectionView.numberOfItems(inSection: SearchConstants.defaultSectionInCollection)
        let endIndex = startIndex + products.count
        collectionView.performBatchUpdates( { [weak self] in
            var indexPaths: [IndexPath] = []
            if startIndex < endIndex {
                for index in startIndex..<endIndex {
                    indexPaths.append(IndexPath(item: index, section: SearchConstants.defaultSectionInCollection))
                }
                self?.collectionView.insertItems(at: indexPaths)
            }
        }, completion: nil)
    }
    
    func updateLine(variantId: String, quantity: Int) {
        productsCollectionDelegate?.updateLine(variantId: variantId, quantity: quantity)
    }
}

protocol ProductsCollectionDelegate: UI {
    
    func productSelected(with id: String)
    func loadMore(endCursor: String)
    func updateLine(variantId: String, quantity: Int)
}
