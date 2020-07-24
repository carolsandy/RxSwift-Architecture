import Foundation

extension URL {

    public init(safeString string: String) {
        guard let instance = URL(string: string) else {
            fatalError("Unconstructable URL: \(string)")
        }
        self = instance
    }
}
