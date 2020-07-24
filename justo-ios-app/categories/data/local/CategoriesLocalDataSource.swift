import Foundation
import CoreData
import RxSwift

class CategoriesLocalDataSource {
    
    private let managedContext: NSManagedObjectContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CategoryEntity")
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func clear() -> Completable {
        return Completable.create { completable in
            do {
                let categoryEntityList = try self.managedContext.fetch(self.fetchRequest) as! [CategoryEntity]
                categoryEntityList.forEach { categoryEntity in  self.managedContext.delete(categoryEntity) }
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func insert(categories: FetchCategoriesQuery.Data.Category) -> Completable {
        return Completable.create { completable in
            do {
                categories.asCategoryEntityList(managedContext: self.managedContext)
                try self.managedContext.save()
            } catch let e as NSError {
                completable(.error(e))
            }
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func get(categoryID: String) -> Observable<Category> {
        let categoryPredicate = "id = %@"
        return Observable.create { observer in
            let predicate = NSPredicate(format: categoryPredicate, categoryID)
            self.fetchRequest.predicate = predicate
            do {
                let data = try self.managedContext.fetch(self.fetchRequest) as! [CategoryEntity]
                let category = self.mapCategory(categoryEntity: data.first)
                observer.onNext(category)
                observer.onCompleted()
            } catch let e as NSError {
                observer.onError(e)
            }
            return Disposables.create {}
        }
    }
    
    func getAll() -> Observable<[Category]> {
        return Observable.create { observer in
            do {
                let data = try self.managedContext.fetch(self.fetchRequest) as! [CategoryEntity]
                let categories = data.compactMap { categoryEntity in
                    self.mapCategory(categoryEntity: categoryEntity)
                }.sorted(by: { prevCategory, nextCategory in prevCategory.name < nextCategory.name})
                observer.onNext(categories)
                observer.onCompleted()
            } catch let e as NSError {
                observer.onError(e)
            }
            return Disposables.create {}
        }
    }
    
    fileprivate func mapCategory(categoryEntity: CategoryEntity?) -> Category {
        return Category(id: categoryEntity?.id ?? StringConstants.empty,
                        name: categoryEntity?.name ?? StringConstants.empty,
                        backgroundImage: categoryEntity?.backgroundImage ?? StringConstants.empty,
                        subcategories: mapSubcategories(subcategoryEntitiesSet: categoryEntity?.subcategories))
    }
    
    fileprivate func mapSubcategories(subcategoryEntitiesSet: NSSet?) -> [Category] {
        var subcategories: [Category] = [Category]()
        if let set = subcategoryEntitiesSet {
            for element in set as! Set<SubcategoryEntity> {
                subcategories.append(mapSubcategory(subcategoryEntity: element))
            }
        }
        var sortedSubcategories = subcategories.sorted(by: { prevCategory, nextCategory in prevCategory.name < nextCategory.name})
        sortedSubcategories.insert(Category(name: String.localizeString(for: "Default Chip Text")), at: .zero)
        return sortedSubcategories
    }
    
    fileprivate func mapSubcategory(subcategoryEntity: SubcategoryEntity) -> Category {
        return Category(id: subcategoryEntity.id ?? StringConstants.empty,
                        name: subcategoryEntity.name ?? StringConstants.empty,
                        backgroundImage: subcategoryEntity.backgroundImage ?? StringConstants.empty)
    }
    
}
