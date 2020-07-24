import Foundation
import UIKit

class UICollectionSubcategoriesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var subcategoriesCollectionDelegate: SubcategoriesCollectionDelegate?
    
    weak var collectionView: UICollectionView! {
        didSet {
            configureCollectionView()
        }
    }
    
    var category: Category = Category() {
        willSet(selectedCategory) {
            subcategories = selectedCategory.subcategories
        }
    }
    
    var subcategories: [Category] = [] {
        didSet {
            if oldValue.isEmpty {
                collectionView.reloadData()
                let indexPath = IndexPath(item: .zero, section: SearchConstants.defaultSectionInCollection)
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            } else {
                reloadSectionsAndSelectLastCell()
            }
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SubcategoryViewCell.nib, forCellWithReuseIdentifier: SubcategoryViewCell.reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubcategoryViewCell.reuseIdentifier, for: indexPath) as? SubcategoryViewCell else {
            fatalError("Unable to dequeue cell")
        }
        
        let item = subcategories[indexPath.row]
        cell.bindCell(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = NSString(string: subcategories[indexPath.row].name).size(withAttributes: [NSAttributedString.Key.font: UIFont.bodySemibold(with: .subhead)])
        return CGSize(width: size.width + SearchConstants.defaultInsetSize, height: SearchConstants.heightForSubcategoryItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.defaultValue, left: SearchConstants.defaultMinSpacing, bottom: Constants.defaultValue, right: SearchConstants.defaultMinSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SubcategoryViewCell {
            cell.isSelected = !cell.isSelected
            indexPath.row == .zero ? didSelectSubcategory(category.id) : didSelectSubcategory(subcategories[indexPath.row].id)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let cell = collectionView.cellForItem(at: indexPath) as? SubcategoryViewCell {
            return !cell.isSelected
        }
        return false
    }
    
    private func reloadSectionsAndSelectLastCell() {
        let selected = collectionView.indexPathsForSelectedItems
        UIView.performWithoutAnimation {
            collectionView.performBatchUpdates( { [weak self] in
                let section = IndexSet(integer: SearchConstants.defaultSectionInCollection)
                self?.collectionView.reloadSections(section)
            }) { completed -> Void in
                selected?.forEach { indexPath in
                    self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
                }
            }
        }
    }
    
    private func didSelectSubcategory(_ id: String) {
        subcategoriesCollectionDelegate?.subcategorySelected(with: id)
    }
    
}

protocol SubcategoriesCollectionDelegate: UI {
    
    func subcategorySelected(with id: String)
}
