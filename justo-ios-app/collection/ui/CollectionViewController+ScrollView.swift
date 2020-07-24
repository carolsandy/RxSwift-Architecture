import Foundation
import UIKit

extension CollectionViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = CollectionConstants.heightForCollectionHeader - contentOffsetY
        if newHeaderViewHeight < CollectionConstants.headerHeightAllowedScrollDown && self.navigationItem.title == StringConstants.empty {
            self.navigationItem.title = collection?.name
            self.navigationController?.navigationBar.isTranslucent =  false
            if let collectionDetail = collection?.backgroundColor { self.navigationController?.navigationBar.barTintColor = UIColor(hex: collectionDetail) }
        } else if newHeaderViewHeight > CollectionConstants.headerHeightAllwoedScrollUp && self.navigationItem.title != StringConstants.empty {
            UIView.animate(withDuration: CollectionConstants.navigationBarAnimationDuration, animations: {
                self.navigationItem.title = StringConstants.empty
                self.navigationController?.navigationBar.isTranslucent =  true
            })
        }
    }
}
