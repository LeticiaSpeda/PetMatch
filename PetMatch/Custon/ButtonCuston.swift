import UIKit

final class ButtonCuston: UIButton {
    var imageButton: UIImage?
    var colorButton: UIColor?
    var titleButton: String?
    var corneRadiusButton: CGFloat?
    
    init(imageButton: UIImage? = nil, titleButton: String? = nil, corneRadiusButton: CGFloat? = nil, colorButton: UIColor? ) {
        self.imageButton = imageButton
        self.titleButton = titleButton
        self.corneRadiusButton = corneRadiusButton
        self.colorButton = colorButton
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setImage(imageButton, for: .normal)
        setTitle(titleButton, for: .normal)
        setTitleColor(colorButton, for: .normal)
        tintColor = colorButton
        layer.cornerRadius = corneRadiusButton ?? 0
        enableView()
    }
}
