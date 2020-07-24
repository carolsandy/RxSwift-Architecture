import Foundation

extension SearchQuery.Data.Product {
    
    func asProductInfo() -> ProductInfo {
        return ProductInfo(hasNext: self.pageInfo.hasNextPage,
                           endCursor: self.pageInfo.endCursor ?? StringConstants.empty,
                           products: self.asProducts())
    }
}

extension SearchQuery.Data.Product {
    
    func asProducts() -> [Product] {
        return self.edges.compactMap { product in product.node.asProduct() }
    }
}

extension SearchQuery.Data.Product.Edge.Node {
    
    func asProduct() -> Product {
        return Product(id: self.id,
                       name: self.name,
                       description: self.description,
                       thumbnail: self.thumbnail?.url ?? StringConstants.empty,
                       category: self.category.asCategory(),
                       productType: self.productType.name,
                       isAvailable: self.isAvailable ?? false,
                       price: self.pricing?.priceRange?.stop?.gross.localized ?? StringConstants.empty,
                       variant: self.asVariants(),
                       availability: self.availability?.quantityOnCheckout ?? .zero,
                       weight: self.weight?.value ?? DoubleConstants.defaultDouble)
    }
}

extension SearchQuery.Data.Product.Edge.Node.Category {
    
    func asCategory() -> Category {
        return Category(id: self.id, name: self.name, backgroundImage: StringConstants.empty)
    }
}

extension SearchQuery.Data.Product.Edge.Node {
    
    func asVariants() -> [ProductVariant] {
        return self.variants?.compactMap { variant in variant?.asVariant() } ?? []
    }
}

extension SearchQuery.Data.Product.Edge.Node.Variant {
    
    func asVariant() -> ProductVariant {
        return ProductVariant(id: self.id,
                              sku: self.sku,
                              name: self.name,
                              amount: self.pricing?.price?.gross.amount.description ?? StringConstants.empty,
                              currency: self.pricing?.price?.gross.currency ?? StringConstants.empty,
                              price: self.pricing?.price?.gross.localized ?? StringConstants.empty)
    }
}
