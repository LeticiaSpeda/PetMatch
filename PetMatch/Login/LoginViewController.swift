import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var viewImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupConstraints()
        setupView()
    }
    
    private func setupHierarchy() {
        view.addSubview(viewImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewImage.heightAnchor.constraint(equalToConstant: 480)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white600
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyRoundedBottomCorners()
    }
    
    private func applyRoundedBottomCorners() {
        let cornerRadius = 122
        let path = UIBezierPath(
            roundedRect: viewImage.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        viewImage.layer.mask = mask
    }
}
