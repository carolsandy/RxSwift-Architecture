import Foundation
import CoreData

extension FetchCategoriesQuery.Data.Category {
    
    func asCategoryEntityList(managedContext: NSManagedObjectContext) {
        edges.forEach { edge in edge.node.asCategoryEntity(managedContext: managedContext) }
    }
    
    func asCategories() -> [Category] {
        return edges.map { edge in edge.node.asCategory() }
    }
}

extension FetchCategoriesQuery.Data.Category.Edge.Node {
    
    func asCategoryEntity(managedContext: NSManagedObjectContext) {
        let categoryEntity = NSEntityDescription.insertNewObject(forEntityName: "CategoryEntity", into: managedContext)
        categoryEntity.setValue(self.id, forKey: "id")
        categoryEntity.setValue(self.name, forKey: "name")
        categoryEntity.setValue(backgroundImage?.url ?? StringConstants.empty, forKey: "backgroundImage")
        self.children?.asSubcategoryEntitySet(entity: categoryEntity, managedContext: managedContext)
    }
    
    fileprivate func asCategory() -> Category {
        return Category.init(id: id,
                             name: name,
                             backgroundImage: backgroundImage?.url ?? StringConstants.empty,
                             subcategories: self.children?.asSubcategories() ?? [])
    }
}

extension FetchCategoriesQuery.Data.Category.Edge.Node.Child {
    
    func asSubcategoryEntitySet(entity: NSManagedObject, managedContext: NSManagedObjectContext) {
        let subcategoryEntitiesSet = entity.mutableSetValue(forKey: "subcategories")
        edges.forEach { subcategory in
            let subcategoryEntity = subcategory.node.asSubcategoryEntity(managedContext: managedContext)
            subcategoryEntitiesSet.add(subcategoryEntity)
        }
    }
    
    func asSubcategories() -> [Category] {
        return edges.compactMap { edge in edge.node.asSubcategory() }
    }
}

extension FetchCategoriesQuery.Data.Category.Edge.Node.Child.Edge.Node {
    
    func asSubcategoryEntity(managedContext: NSManagedObjectContext) -> NSManagedObject {
        let subcategoryEntity = NSEntityDescription.insertNewObject(forEntityName: "SubcategoryEntity", into: managedContext)
        subcategoryEntity.setValue(self.id, forKey: "id")
        subcategoryEntity.setValue(self.name, forKey: "name")
        subcategoryEntity.setValue(self.backgroundImage?.url ?? StringConstants.empty, forKey: "backgroundImage")
        return subcategoryEntity
    }
    
    fileprivate func asSubcategory() -> Category {
        return Category.init(id: id,
                             name: name,
                             backgroundImage: backgroundImage?.url ?? StringConstants.empty)
    }
}
