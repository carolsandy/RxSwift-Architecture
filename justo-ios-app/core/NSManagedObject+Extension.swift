import Foundation
import CoreData

extension NSManagedObject {
    
    func getString(key: String) -> String {
        return value(forKey: key) as? String ?? StringConstants.empty
    }
}
