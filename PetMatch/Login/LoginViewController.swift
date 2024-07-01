import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var viewImage: LoginViewImage = {
        let view = LoginViewImage(
            frame: CGRect(x: 0, y: 0, width: 390, height: 480)
        )
        return view
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView(image: .mainPet)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackVertical: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var mainLabel = LabelCuston(title: "Bem Vindo", titleFont: .boldSystemFont(ofSize: 26), titleColor: .black, alignment: .center)
    
    
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
        view.addSubview(stackVertical)
        
        stackVertical.addArrangedSubview(viewImage)
        viewImage.addSubview(mainImage)
        stackVertical.addArrangedSubview(mainLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackVertical.topAnchor.constraint(equalTo: view.topAnchor),
            stackVertical.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackVertical.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            mainImage.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: viewImage.centerYAnchor, constant: 60),
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white600
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewImage.applyRoundedBottomCorners()
    }
}
