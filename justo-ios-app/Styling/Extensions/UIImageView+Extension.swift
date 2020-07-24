import Foundation
import UIKit

extension UIImageView {
    func load(with url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func load(with string: String) {
        let url = string.asURL()
        image = nil
        if let imageFromCache = Cache.imageCache.object(forKey: string as NSString) as? UIImage {
            image = imageFromCache
        } else {
            URLSession.shared.dataTask(with: url as URL, completionHandler: { (dataResponse, response, error) in
                guard error == nil else { return }
                DispatchQueue.main.async {
                    guard let data = dataResponse else { return }
                    if let imageToCache = UIImage(data: data) {
                        self.image = imageToCache
                        Cache.imageCache.setObject(imageToCache, forKey: string as NSString)
                    }
                }
            }).resume()
        }
    }
}
