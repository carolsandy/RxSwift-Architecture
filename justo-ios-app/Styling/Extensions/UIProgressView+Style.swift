import Foundation
import UIKit

extension UIProgressView {
 
    func configure(progressColor: UIColor = .darkBlueGreen, trackColor: UIColor = .white) {
        self.progressTintColor = progressColor
        self.trackTintColor = trackColor
        self.progress = .zero
    }
    
    func start(with progress: Progress) {
        progress.completedUnitCount += 1
        let progresFloat = Float(progress.fractionCompleted)
        self.setProgress(progresFloat, animated: true)
        self.progress = progresFloat
    }
    
    func stop(with progress: Progress) {
        let progressFloat = Float(progress.completedUnitCount)
        self.setProgress(progressFloat, animated: false)
        self.progress = progressFloat
    }
    
    func reset() {
        let progress: Float = .zero
        self.setProgress(progress, animated: false)
        self.progress = progress
    }
}
