import UIKit

final class ImageViewCuston: UIImageView {
    var imageHome: UIImage
    
    init(imageHome: UIImage) {
        self.imageHome = imageHome
        super.init(frame: .zero)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        image = imageHome
        layer.cornerRadius = 20
        clipsToBounds = true
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
