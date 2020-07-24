import Foundation

extension FetchCollectionsQuery.Data.Collection {
    
    func asCollections() -> [Collection] {
        return self.edges.map { collection in collection.node.asCollection() }
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node {
    
    func asCollection() -> Collection {
    
        return Collection(id: self.id,
                          name: self.name,
                          slug: self.slug,
                          isBanner: self.isBanner,
                          isHidden: self.isHidden,
                          description: self.description,
                          backgroundImage: self.backgroundImage?.url ?? StringConstants.empty,
                          backgroundColor: self.backgroundImage?.color ?? StringConstants.empty,
                          productInfo:  self.products?.asProductInfo() ?? ProductInfo(hasNext: false, endCursor: "", products: []))
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product {
    
    func asProductInfo() -> ProductInfo {
        
        return ProductInfo(hasNext: self.pageInfo.hasNextPage,
                           endCursor: self.pageInfo.endCursor ?? StringConstants.empty,
                           products: self.asProducts() )
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product {
    
    func asProducts() -> [Product] {
        
        return self.edges.map { product in product.asProduct() }
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product.Edge {
    
    func asProduct() -> Product {
        
        return Product(id: self.node.id,
                       name: self.node.name,
                       description: self.node.description,
                       thumbnail: self.node.thumbnail?.url ?? StringConstants.empty,
                       category: self.node.category.asCategory(),
                       productType: self.node.productType.name,
                       isAvailable: self.node.isAvailable ?? false,
                       price: self.node.pricing?.priceRange?.stop?.gross.localized ?? StringConstants.empty,
                       variant: self.asVariants(),
                       availability: self.node.availability?.quantityOnCheckout ?? .zero,
                       weight: self.node.weight?.value ?? DoubleConstants.defaultDouble)
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product.Edge.Node.Category {
    
    func asCategory() -> Category {
        return Category(id: self.id, name: self.name, backgroundImage: StringConstants.empty)
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product.Edge {
    
    func asVariants() -> [ProductVariant] {
        return self.node.variants?.compactMap { variant in variant?.asVariant() } ?? []
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product.Edge.Node.Variant {
    
    func asVariant() -> ProductVariant {
        
        return ProductVariant(id: self.id,
                       sku: self.sku,
                       name: self.name,
                       amount: self.pricing?.price?.gross.amount.description ?? StringConstants.empty,
                       currency: self.pricing?.price?.gross.currency ?? StringConstants.empty,
                       price: self.pricing?.price?.gross.localized ?? StringConstants.empty)
    }
}
