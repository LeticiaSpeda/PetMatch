import UIKit

final class LoginViewImage: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        applyRoundedBottomCorners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .yellow900.withAlphaComponent(0.1) 
        enableView()
        heightAnchor.constraint(equalToConstant: 480).isActive = true
    }
    
    func applyRoundedBottomCorners() {
        let cornerRadius = 122
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
