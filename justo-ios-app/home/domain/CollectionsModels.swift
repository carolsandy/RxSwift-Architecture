import Foundation

struct Collection {
    var id: String
    var name: String
    var slug: String
    var isBanner: Bool
    var isHidden: Bool
    var description: String
    var backgroundImage: String
    var backgroundColor: String
    var productInfo: ProductInfo
}

struct ProductInfo {
    var hasNext: Bool
    var endCursor: String
    var products: [Product]
}

class Product {
    var id: String
    var name: String
    var description: String
    var thumbnail: String
    var category: Category
    var productType: String
    var isAvailable: Bool
    var price: String
    var variant: [ProductVariant]
    var availability: Int
    var weight: Double
    
    init(id: String, name: String, description: String, thumbnail: String, category: Category, productType: String, isAvailable: Bool, price: String, variant: [ProductVariant], availability: Int, weight: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
        self.category = category
        self.productType = productType
        self.isAvailable = isAvailable
        self.price = price
        self.variant = variant
        self.availability = availability
        self.weight = weight
    }
}

struct ProductVariant {
    var id: String
    var sku: String
    var name: String
    var amount: String
    var currency: String
    var price: String
}

struct HomeCollection {
    var type: String
    var name: String?
    var description: String?
    var highlights: [Collection]?
    var productInfo: ProductInfo?
    var categories: [Category]?
    
    init(type: String, name: String, description: String, productInfo: ProductInfo) {
        self.type = type
        self.name = name
        self.description = description
        self.productInfo = productInfo
    }
    
    init(type: String, highlights: [Collection]) {
        self.type = type
        self.highlights = highlights
    }
    
    init(type: String, categories: [Category]) {
        self.type = type
        self.categories = categories
    }
}

enum CollectionType: String {
    case product
    case highlight
    case category
}

enum ImageState {
    case new, downloaded, failed
}
