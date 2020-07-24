import Foundation
import RxSwift

class SegmentIdentifier {

    private let segmentSDK: SegmentSDK

    init(segmentSDK: SegmentSDK) {
        self.segmentSDK = segmentSDK
    }

    func identity(userId: String, userName: String, userEmail: String) -> Completable {
        return Completable.create { completable in
            self.segmentSDK.identity(userId: userId, userName: userName, userEmail: userEmail)
            completable(.completed)
            return Disposables.create()
        }
    }
}
