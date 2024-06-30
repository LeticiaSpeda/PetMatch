import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var viewImage: LoginViewImage = {
        let view = LoginViewImage(frame: CGRect(x: 0, y: 0, width: 100, height: 480))  // Defina um frame inicial
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
            viewImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),  // Ajuste o valor para um positivo
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white600
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewImage.applyRoundedBottomCorners()  // Reaplique os cantos arredondados após o layout
    }
}
