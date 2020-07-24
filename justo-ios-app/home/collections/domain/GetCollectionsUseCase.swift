import Foundation
import RxSwift

class GetCollectionsUseCase {

    private let collectionsRepository: CollectionsRepository
    private let categoriesRepository: CategoriesRepository
    private let userRepository: UserRepository

    init(collectionsRepository: CollectionsRepository, categoriesRepository: CategoriesRepository, userRepository: UserRepository) {
        self.collectionsRepository = collectionsRepository
        self.categoriesRepository = categoriesRepository
        self.userRepository = userRepository
    }

    func getCollections() -> Observable<[HomeCollection]> {
        return userRepository.getOrFetchUser()
                .catchErrorJustReturn(User.empty())
                .flatMap { user in
                    Observable.zip(
                            self.fetchCollectionsObservable(token: user.token),
                            self.getOrFetchCategoriesObservable(), resultSelector: { collections, categories in
                            self.createHomeCollections(collections: collections, categories: categories)
                    })
                }
    }

    private func fetchCollectionsObservable(token: String) -> Observable<[Collection]> {
        return token.isEmpty ? self.collectionsRepository.fetchCollections() : self.collectionsRepository.fetchCollections(with: token)
    }

    private func getOrFetchCategoriesObservable() -> Observable<[Category]> {
        return categoriesRepository.getOrFetchCategories()
    }

    private func createHomeCollections(collections: [Collection], categories: [Category]) -> [HomeCollection] {
        var homeCollections: [HomeCollection] = []
        homeCollections.append(self.createHighlightCollection(collections: collections))
        homeCollections.append(contentsOf: self.createProductCollection(collections: collections))
        homeCollections.append(self.createCategoryCollection(categories: categories))
        return homeCollections
    }

    private func createHighlightCollection(collections: [Collection]) -> HomeCollection {
        return HomeCollection(type: CollectionType.highlight.rawValue, highlights: collections.filter { collection in
            collection.isBanner && !collection.isHidden
        })
    }

    private func createProductCollection(collections: [Collection]) -> [HomeCollection] {
        return collections.filter { collection in
            !collection.isBanner && !collection.isHidden
        }.map { collection in
            HomeCollection(type: CollectionType.product.rawValue,
                           name: collection.name, description: collection.description, productInfo: collection.productInfo)
        }
    }

    private func createCategoryCollection(categories: [Category]) -> HomeCollection {
        return HomeCollection(type: CollectionType.category.rawValue, categories: categories)
    }
}
