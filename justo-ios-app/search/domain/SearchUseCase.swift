import Foundation
import RxSwift

class SearchUseCase {

    private let searchRepository: SearchRepository
    private let categoriesRepository: CategoriesRepository
    private let userRepository: UserRepository

    init(searchRepository: SearchRepository, categoriesRepository: CategoriesRepository, userRepository: UserRepository) {
        self.searchRepository = searchRepository
        self.categoriesRepository = categoriesRepository
        self.userRepository = userRepository
    }

    func search(searchRequest: SearchRequest) -> Observable<SearchResult> {
        return userRepository.getOrFetchUser()
                .catchErrorJustReturn(User.empty())
                .flatMap { user in
                    Observable.zip(
                            self.searchObservable(searchRequest: searchRequest, token: user.token),
                            self.fetchCategoryObservable(categoryParent: searchRequest.categoryParent), resultSelector: { productInfo, category in
                            SearchResult(type: self.getSearchType(with: searchRequest, and: category), productInfo: productInfo, category: category)
                    })
                }
    }

    private func searchObservable(searchRequest: SearchRequest, token: String) -> Observable<ProductInfo> {
        return token.isEmpty ? self.searchRepository.search(searchRequest: searchRequest) : self.searchRepository.search(searchRequest: searchRequest, token: token)
    }

    private func fetchCategoryObservable(categoryParent: String) -> Observable<Category> {
        return categoriesRepository.fetchCategory(with: categoryParent)
    }

    private func getSearchType(with searchRequest: SearchRequest, and category: Category) -> (searchBy: String, title: String) {
        return category.id.isEmpty
                ? (SearchConstants.searchByQuery, searchRequest.query)
                : (SearchConstants.searchByCategory, category.name)
    }
}
