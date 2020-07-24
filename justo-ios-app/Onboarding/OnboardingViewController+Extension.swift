import Foundation
import UIKit

extension OnboardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = items.count
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingPageCell.reuseIdentifier, for: indexPath) as! OnboardingPageCell
        let currentPage = items[indexPath.item]
        cell.page = currentPage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return OnboardingConstants.minLineSpacing
    }
    
    func getOnboardingData() -> [OnboardingPage] {
        return [
            OnboardingPage(image: "warranty1", description: .localizeString(for: "Onboarding First Page")),
            OnboardingPage(image: "warranty2", description: .localizeString(for: "Onboarding Second Page")),
            OnboardingPage(image: "warranty3", description: .localizeString(for: "Onboarding Third Page"))
        ]
    }
    
}
