import UIKit

class HighlightsCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var collectionSelectedAction: CollectionSelectedAction?
    
    var collection: [Collection] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let highlightCellNib = UINib(nibName: HomeConstants.nibForHighlightCell, bundle: nil)
        collectionView.register(highlightCellNib, forCellWithReuseIdentifier: HomeConstants.identifierForHighlightCell)
    }
    
}

extension HighlightsCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeConstants.identifierForHighlightCell, for: indexPath) as! HighlightViewCell
        let item = collection[indexPath.row]
        cell.bindCell(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HomeConstants.widthForHighlightItem, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionSelectedAction?.showCollectionViewController(collectionId: collection[indexPath.row].id)
    }
    
}

protocol CollectionSelectedAction: AnyObject {
    func showCollectionViewController(collectionId: String)
}
