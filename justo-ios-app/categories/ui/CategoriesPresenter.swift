import Foundation
import UIKit
import RxSwift

class CategoriesPresenter {
    
    fileprivate weak var categoriesUI: CategoriesUI?
    let getCategoriesUseCase: GetCategoriesUseCase
    
    private let disposeBag = DisposeBag()
    
    init(categoriesUI: CategoriesUI, categoriesUseCase: GetCategoriesUseCase) {
        self.categoriesUI = categoriesUI
        self.getCategoriesUseCase = categoriesUseCase
    }
    
    func getCategories() {
        categoriesUI?.showLoader()
        getCategoriesUseCase.getCategoriesFirstLevel()
            .subscribe(onNext: { response in
                self.categoriesUI?.hideLoader()
                if !response.isEmpty {
                    self.categoriesUI?.showCategoriesSucces(categories: response)
                }
            }, onError: { error in
                self.categoriesUI?.hideLoader()
                self.categoriesUI?.showCategoriesError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

protocol CategoriesUI: class {
    
    func showLoader()
    
    func hideLoader()
    
    func showCategoriesSucces(categories: [Category])
    
    func showCategoriesError(message: String)
}
