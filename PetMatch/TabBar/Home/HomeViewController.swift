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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(OngViewCell.self, forCellWithReuseIdentifier: OngViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
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
        view.addSubview(verticalMainStack)
        verticalMainStack.addArrangedSubview(horizontalMainStack)
        
        horizontalMainStack.addArrangedSubview(mapIcon)
        horizontalMainStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(localLabel)
        verticalStack.addArrangedSubview(addressLabel)
        horizontalMainStack.addArrangedSubview(photoPerson)
        
        verticalMainStack.addArrangedSubview(UIView())
        verticalMainStack.addArrangedSubview(searchBar)
        
        verticalMainStack.addArrangedSubview(collectionOngs)
    }
    
    private func setupConstraints() {
//        verticalMainStack.translatesAutoresizingMaskIntoConstraints = false
        
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
            addressLabel.heightAnchor.constraint(equalToConstant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OngViewCell.identifier, for: indexPath) as? OngViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 100) 
    }
}
