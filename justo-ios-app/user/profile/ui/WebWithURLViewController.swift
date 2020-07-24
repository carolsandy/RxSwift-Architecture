import UIKit
import WebKit

enum WebType: String {
    case termsAndconditionsURL = "https://justo.mx/terms-conditions/"
    case privacyAdvice = "https://justo.mx/privacy-advice/"
}

class WebWithURLViewController: UIViewController {
    var webView: WKWebView!
    var webURL: URL!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: webURL))
    }
    
    init(webType: WebType) {
        super.init(nibName: nil, bundle: nil)
        webURL = URL(string: webType.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
