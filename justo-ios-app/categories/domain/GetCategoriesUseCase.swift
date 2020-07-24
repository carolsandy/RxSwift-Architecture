import Foundation
import RxSwift

class GetCategoriesUseCase {
    
    private let categoriesRepository: CategoriesRepository
    
    init(categoriesRepository: CategoriesRepository) {
        self.categoriesRepository = categoriesRepository
    }
    
    func getCategoriesFirstLevel() -> Observable<[Category]> {
        return categoriesRepository.getOrFetchCategories()
    }
}
