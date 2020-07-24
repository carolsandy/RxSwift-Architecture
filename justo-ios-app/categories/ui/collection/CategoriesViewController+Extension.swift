import Foundation
import UIKit

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryConstants.identifierForHeaderCell, for: indexPath) as! HeaderCollectionReusableView
        headerCell.title = .localizeString(for: "Categories Title Text")
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryConstants.identifierForCategoryCell, for: indexPath) as! CategoryViewCell
        let categoryItem = categories[indexPath.row]
        cell.bindCell(with: categoryItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width / CategoryConstants.numberOfCategoryColumns) - CategoryConstants.categoryMinSpaceForLines
        return CGSize(width: cellWidth, height: CategoryConstants.heightForCategoryCard)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: Constants.defaultInsetSize, bottom: Constants.defaultInsetSize, right: Constants.defaultInsetSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let searchViewController = SearchInjector().provideSearchViewController(category: category.id)
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
}
