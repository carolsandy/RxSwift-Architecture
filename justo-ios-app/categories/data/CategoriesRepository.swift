import Foundation
import RxSwift

class CategoriesRepository {
    
    private let categoriesLocalDataSource: CategoriesLocalDataSource
    private let categoriesRemoteDataSource: CategoriesRemoteDataSource
    
    init(categoriesLocalDataSource: CategoriesLocalDataSource, categoriesRemoteDataSource: CategoriesRemoteDataSource) {
        self.categoriesLocalDataSource = categoriesLocalDataSource
        self.categoriesRemoteDataSource = categoriesRemoteDataSource
    }
    
    func getOrFetchCategories() -> Observable<[Category]> {
        return categoriesLocalDataSource.getAll().flatMap { categories in
            return categories.isEmpty ? self.fetchCategories() : Observable.just(categories)
        }
    }

   fileprivate func fetchCategories() -> Observable<[Category]> {
        return categoriesLocalDataSource.clear().andThen(categoriesRemoteDataSource.fetchCategories())
            .flatMap { categories in return self.categoriesLocalDataSource.insert(categories:categories).andThen(Observable.just(categories.asCategories()))}
    }
    
    func fetchCategory(with categoryID: String) -> Observable<Category> {
        return categoriesLocalDataSource.get(categoryID: categoryID)
    }
}
