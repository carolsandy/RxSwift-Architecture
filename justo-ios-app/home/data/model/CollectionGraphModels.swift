import Foundation

extension FetchCollectionQuery.Data.Collection {
    func asCollection() -> Collection {
        return Collection(id: self.id,
                          name: self.name,
                          slug: self.slug,
                          isBanner: self.isBanner,
                          isHidden: self.isHidden,
                          description: self.description,
                          backgroundImage: self.backgroundImage?.url ?? StringConstants.empty,
                          backgroundColor: self.backgroundImage?.color ?? StringConstants.empty,
                          productInfo: self.products?.asProductInfo() ?? ProductInfo(hasNext: false, endCursor: "", products: []))
    }
}

extension FetchCollectionQuery.Data.Collection.Product {
    
    func asProductInfo() -> ProductInfo {
        
        return ProductInfo(hasNext: self.pageInfo.hasNextPage,
                           endCursor: self.pageInfo.endCursor ?? StringConstants.empty,
                           products: self.asProducts() )
    }
}

extension FetchCollectionQuery.Data.Collection.Product {
    
    func asProducts() -> [Product] {
        
        return self.edges.map { product in product.asProduct() }
    }
}

extension FetchCollectionQuery.Data.Collection.Product.Edge {
    
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

extension FetchCollectionQuery.Data.Collection.Product.Edge.Node.Category {
    
    func asCategory() -> Category {
        return Category(id: self.id, name: self.name, backgroundImage: StringConstants.empty)
    }
}

extension FetchCollectionQuery.Data.Collection.Product.Edge {
    
    func asVariants() -> [ProductVariant] {
        return self.node.variants?.compactMap { variant in variant?.asVariant() } ?? []
    }
}

extension FetchCollectionQuery.Data.Collection.Product.Edge.Node.Variant {
    
    func asVariant() -> ProductVariant {
        
        return ProductVariant(id: self.id,
                              sku: self.sku,
                              name: self.name,
                              amount: self.pricing?.price?.gross.amount.description ?? StringConstants.empty,
                              currency: self.pricing?.price?.gross.currency ?? StringConstants.empty,
                              price: self.pricing?.price?.gross.localized ?? StringConstants.empty)
    }
}
