import Foundation

extension FetchProductQuery.Data.Product {
    
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

extension FetchProductQuery.Data.Product.Category {
    
    func asCategory() -> Category {
        return Category(id: self.id,
                        name: self.name,
                        backgroundImage: StringConstants.empty)
    }
}

extension FetchProductQuery.Data.Product {
    
    func asVariants() -> [ProductVariant] {
        return self.variants?.compactMap { variant in variant?.asVariant() } ?? []
    }
}

extension FetchProductQuery.Data.Product.Variant {
    
    func asVariant() -> ProductVariant {
        let stringFormat: String = "%.2f"
        
        return ProductVariant(id: self.id,
                       sku: self.sku,
                       name: self.name,
                       amount: String(format: stringFormat, self.pricing?.price?.gross.amount ?? .zero),
                       currency: self.pricing?.price?.gross.currency ?? StringConstants.empty,
                       price: self.pricing?.price?.gross.localized ?? StringConstants.empty)
    }
}
