import Foundation

struct SearchResult {
    var type: (searchBy: String, title: String)
    var productInfo: ProductInfo
    var category: Category
}

struct SearchRequest {
    var first: Int
    var after: String
    var query: String
    var categoryParent: String
    var categories: [String]
    
    init(first: Int = SearchConstants.productPageSize, after: String = StringConstants.empty, query: String = StringConstants.empty, categoryParent: String = StringConstants.empty, categories: [String] = []) {
        self.first = first
        self.after = after
        self.query = query
        self.categoryParent = categoryParent
        self.categories = categories
    }
}

extension SearchRequest {
    
    func asSearchQuery() -> SearchQuery {
        return SearchQuery.init(first: first, after: after, query: query, filter: asProductFilterInptu())
    }
    
    func asProductFilterInptu() -> ProductFilterInput {
        return ProductFilterInput(categories: categories)
    }
    
}
