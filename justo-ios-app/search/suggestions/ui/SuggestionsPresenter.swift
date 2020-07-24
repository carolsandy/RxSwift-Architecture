import Foundation
import UIKit
import RxSwift

class SuggestionsPresenter {
    
    internal typealias UI = SuggestionsUI
    weak var ui: SuggestionsUI?
    
    let suggestionsUseCase: SuggestionsUseCase
    
    private let intervalInMilliseconds = 300
    private let disposeBag = DisposeBag()
    
    init(suggestionsUseCase: SuggestionsUseCase) {
        self.suggestionsUseCase = suggestionsUseCase
    }
    
    func fetchSuggestions(with query: String) {
        guard let ui = ui else { return }
        suggestionsUseCase.fetchSuggestions(with: query)
            .debounce(RxTimeInterval.milliseconds(intervalInMilliseconds), scheduler: MainScheduler.instance)
            .subscribe(onNext: { currentSuggestions in
                ui.showSuggestionsSuccess(suggestions: currentSuggestions)
            }, onError: { error in
                ui.showSuggestionsError(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

protocol SuggestionsUI: UI {
    
    func showSuggestionsSuccess(suggestions: [String])
    
    func showSuggestionsError(message: String)
}
