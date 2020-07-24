import UIKit

class CategoriesCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var categoriesCollectionDelegate: CategoriesCollectionDelegate?
    
    var title: String? {
        set { sectionTitle.text = newValue }
        get { return sectionTitle.text }
    }
    
    var collection: [Category] = [] {
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
        let categoryCellNib = UINib(nibName: HomeConstants.nibForCategoryCell, bundle: nil)
        collectionView.register(categoryCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForCategoryCell)
    }
    
}

extension CategoriesCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForCategoryCell, for: indexPath) as! CategoryViewCell
        let item = collection[indexPath.row]
        cell.bindCell(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HomeConstants.defaultWidthForItem, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = collection[indexPath.row]
        categoriesCollectionDelegate?.selectedCategory(with: category.id)
    }
    
}

protocol CategoriesCollectionDelegate: UI {
    
    func selectedCategory(with id: String)
}
