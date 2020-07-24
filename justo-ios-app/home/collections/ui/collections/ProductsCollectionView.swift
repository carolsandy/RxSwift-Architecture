import UIKit

class ProductsCollectionView: UICollectionViewCell, UpdateProductItemDelegate {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var productsCollectionUI: ProductsCollectionUI?
    
    var title: String? {
        set { sectionTitle.text = newValue }
        get { return sectionTitle.text }
    }
    
    var collection: [Product] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionTitle.font = .bodySemibold()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let productCellNib = UINib(nibName: HomeConstants.nibForProductCell, bundle: nil)
        collectionView.register(productCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForProductCell)
    }
}

extension ProductsCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForProductCell, for: indexPath) as! ProductViewCell
        let item = collection[indexPath.row]
        cell.product = item
        cell.updateProductItemDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HomeConstants.defaultWidthForItem, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productsCollectionUI?.showProductDetail(with: collection[indexPath.row].id)
    }
    
    func updateLine(variantId: String, quantity: Int) {
        productsCollectionUI?.updateLine(variantId: variantId, quantity: quantity)
    }
}

protocol ProductsCollectionUI: AnyObject {
    
    func showProductDetail(with id: String)
    func updateLine(variantId: String, quantity: Int)
}
