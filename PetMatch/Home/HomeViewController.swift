import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var verticalMainStack = StackViewCuston(orientacion: .vertical, spaceSize: 10)
    
    private lazy var horizontalMainStack = StackViewCuston(orientacion: .horizontal, spaceSize: 10)
    
    private lazy var verticalStack = StackViewCuston(orientacion: .vertical, spaceSize: 0)
    
    private lazy var photoPerson = ImageViewCuston(imageHome: UIImage(systemName: "person.crop.circle.fill") ?? UIImage())
    
    private lazy var mapIcon = ImageViewCuston(imageHome: UIImage(systemName: "mappin.and.ellipse.circle.fill") ?? UIImage())
    
    private lazy var localLabel = LabelCuston(title: "Localização ", titleFont: .systemFont(ofSize: 12), titleColor: .gray, alignment:.left )
    
    private lazy var addressLabel = LabelCuston(title: "Av. Dom Pedro II", titleFont: .boldSystemFont(ofSize: 14), titleColor: .black, alignment:.left )
    
    override func viewDidLoad() {
        commonInit()
    }
    
    private func commonInit() {
        setupConstraints()
        setupHierarchy()
        setupView()
    }
    
    private func setupConstraints() {
        view.addSubview(verticalMainStack)
        
        verticalMainStack.addArrangedSubview(horizontalMainStack)
        
        horizontalMainStack.addArrangedSubview(mapIcon)
        horizontalMainStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(localLabel)
        verticalStack.addArrangedSubview(addressLabel)
        horizontalMainStack.addArrangedSubview(photoPerson)
        
        verticalMainStack.addArrangedSubview(UIView())
    }
    
    private func setupHierarchy() {
        NSLayoutConstraint.activate([
            verticalMainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            verticalMainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            verticalMainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            verticalMainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            mapIcon.widthAnchor.constraint(equalToConstant: 40),
            mapIcon.heightAnchor.constraint(equalToConstant: 40),
            
            photoPerson.widthAnchor.constraint(equalToConstant: 40),
            photoPerson.heightAnchor.constraint(equalToConstant: 40),
            
            localLabel.heightAnchor.constraint(equalToConstant: 20),
            addressLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white600
    }
    
}
