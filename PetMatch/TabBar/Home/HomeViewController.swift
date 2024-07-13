import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var verticalMainStack = StackViewCuston(orientacion: .vertical, spaceSize: 10)
    
    private lazy var horizontalMainStack = StackViewCuston(orientacion: .horizontal, spaceSize: 10)
    
    private lazy var verticalStack = StackViewCuston(orientacion: .vertical, spaceSize: 0)
    
    private lazy var photoPerson = ImageViewCuston(imageHome: UIImage(systemName: "person.crop.circle.fill") ?? UIImage())
    
    private lazy var mapIcon = ImageViewCuston(imageHome: UIImage(systemName: "mappin.and.ellipse.circle.fill") ?? UIImage())
    
    private lazy var localLabel = LabelCuston(title: "Localização ", titleFont: .systemFont(ofSize: 12), titleColor: .gray, alignment:.left )
    
    private lazy var addressLabel = LabelCuston(title: "Av. Dom Pedro II", titleFont: .boldSystemFont(ofSize: 14), titleColor: .black, alignment:.left )
    
    private lazy var searchBar = SearchBarCuston()
    
    private lazy var collectionOngs: UICollectionView = {
        let collection = UICollectionView()
        collection.backgroundColor = .red
        collection.enableView()
        return collection
    }()
    
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
        verticalMainStack.addArrangedSubview(searchBar)
        verticalMainStack.addArrangedSubview(UIView())
    }
    
    private func setupHierarchy() {
        verticalMainStack.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            padding: UIEdgeInsets(top: 16, left: 16, bottom: -16, right: -16))
        mapIcon.anchorSize(width: 40, height: 40)
        photoPerson.anchorSize(width: 40, height: 40)
        localLabel.anchorSize(height: 20)
        addressLabel.anchorSize(height: 20)
        searchBar.anchorSize(height: 50)
    }
    
    private func setupView() {
        view.backgroundColor = .white600
    }
}



