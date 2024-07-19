import UIKit

final class OngViewCell: UICollectionViewCell {
    static let identifier = String(describing: OngViewCell.self)
    
    private lazy var horizontalMainStack = StackViewCuston(orientacion: .horizontal, spaceSize: 10)
    
    private lazy var verticalStack = StackViewCuston(orientacion: .vertical, spaceSize: 0)
    
    private lazy var verticalStackImages = StackViewCuston(orientacion: .vertical, spaceSize: 0)
    
    private lazy var photoOng = ImageViewCuston(imageHome: UIImage(named: "ong") ?? UIImage())
    
    
    private lazy var localLabel = LabelCuston(title: "10 km ", titleFont: .systemFont(ofSize: 14), titleColor: .white600, alignment:.left )
    
    private lazy var availableLabel = LabelCuston(title: "Available for", titleFont: .boldSystemFont(ofSize: 16), titleColor: .white600, alignment:.left )
    
    private lazy var imageLike = ButtonCuston(imageButton: UIImage(systemName: "heart"), colorButton: .yellow)
    
    private lazy var imagecat = ButtonCuston(imageButton: UIImage(systemName: "cat"), colorButton: .yellow)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupConstraints()
        setupHierarchy()
        setupView()
    }
    
    private func setupConstraints() {
        contentView.addSubview(horizontalMainStack)
        
        horizontalMainStack.addArrangedSubview(photoOng)
        horizontalMainStack.addArrangedSubview(verticalStack)
        
        verticalStack.addArrangedSubview(localLabel)
        verticalStack.addArrangedSubview(availableLabel)
        verticalStack.addArrangedSubview(UIView())

        horizontalMainStack.addArrangedSubview(verticalStackImages)
        verticalStackImages.addArrangedSubview(imageLike)
        verticalStackImages.addArrangedSubview(imagecat)
        
    }
    
    private func setupHierarchy() {
        NSLayoutConstraint.activate([
            horizontalMainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            horizontalMainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            horizontalMainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontalMainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            photoOng.heightAnchor.constraint(equalToConstant: 100),
            photoOng.widthAnchor.constraint(equalToConstant: 100),
            
            localLabel.topAnchor.constraint(equalTo: verticalStack.topAnchor, constant: 20),
            
            imageLike.heightAnchor.constraint(equalToConstant: 24),
            imageLike.trailingAnchor.constraint(equalTo: horizontalMainStack.trailingAnchor, constant: -13)
        ])
    }
    
    private func setupView() {
        backgroundColor = .pink900
        layer.cornerRadius = 14
    }
}
