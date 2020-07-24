import Foundation
import UIKit

class DeliveryDayCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var collectionView: UICollectionView! {
        didSet {
            configureCollectionView()
        }
    }
    
    weak var delegate: DeliveryDayCollectionDelegate?
    
    var deliveryDays: [DeliveryDay] = [] {
        didSet {
            collectionView.reloadData()
            selectDefaultItem()
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DeliveryDayViewCell.nib, forCellWithReuseIdentifier: DeliveryDayViewCell.reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeliveryDayViewCell.reuseIdentifier, for: indexPath) as! DeliveryDayViewCell
        let deliveryDay = deliveryDays[indexPath.row]
        cell.bind(deliveryDay: deliveryDay)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ShoppingConstants.widthForDeliveryDayCard, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: Constants.defaultInsetSize, bottom: .zero, right: Constants.defaultInsetSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DeliveryDayViewCell {
            cell.isSelected = !cell.isSelected
            delegate?.deliveryDaySelected(deliveryDay: deliveryDays[indexPath.row])
        }
    }
    
    func selectDefaultItem() {
        let indexPath = IndexPath(item: .zero, section: .zero)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
        delegate?.deliveryDaySelected(deliveryDay: deliveryDays[indexPath.row])
    }
}

protocol DeliveryDayCollectionDelegate: AnyObject {
    func deliveryDaySelected(deliveryDay: DeliveryDay)
}
