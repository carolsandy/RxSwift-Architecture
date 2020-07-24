import Foundation
import UIKit

class DeliveryHourCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var collectionView: UICollectionView! {
        didSet {
            configureCollectionView()
        }
    }
    
    weak var delegate: DeliveryHourDelegate?
    
    var deliveryHours: [DeliveryHour] = [] {
        didSet {
            collectionView.reloadData()
            if !oldValue.isEmpty {
                collectionView.scrollToItem(at: IndexPath(item: .zero, section: .zero), at: .left, animated: true)
            }
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DeliveryHourViewCell.nib, forCellWithReuseIdentifier: DeliveryHourViewCell.reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryHours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeliveryHourViewCell.reuseIdentifier, for: indexPath) as! DeliveryHourViewCell
        let deliveryHour = deliveryHours[indexPath.row]
        cell.bind(deliveryHour: deliveryHour)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ShoppingConstants.widthForDeliveryHourCard, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: Constants.defaultInsetSize, bottom: .zero, right: Constants.defaultInsetSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DeliveryHourViewCell {
            cell.isSelected = !cell.isSelected
            delegate?.deliveryHourSelected(deliveryHour: deliveryHours[indexPath.row])
        }
    }
}

protocol DeliveryHourDelegate: AnyObject {
    func deliveryHourSelected(deliveryHour: DeliveryHour)
}
