import Foundation

struct Category {
    var id: String
    var name: String
    var backgroundImage: String
    var subcategories: [Category]
    
    init(id: String = StringConstants.empty, name: String = StringConstants.empty, backgroundImage: String = StringConstants.empty, subcategories: [Category] = []) {
        self.id = id
        self.name = name
        self.backgroundImage = backgroundImage
        self.subcategories = subcategories
    }
}
