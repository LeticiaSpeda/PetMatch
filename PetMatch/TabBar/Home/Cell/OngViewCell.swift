import UIKit

final class OngViewCell: UICollectionViewCell {
    static let identifier = String(describing: OngViewCell.self)
    
    private lazy var horizontalMainStack = StackViewCuston(orientacion: .horizontal, spaceSize: 10)
    
    private lazy var photoOng = ImageViewCuston(imageHome: UIImage(systemName: "ong") ?? UIImage())
    
    private lazy var verticalStack = StackViewCuston(orientacion: .vertical, spaceSize: 0)
    
    private lazy var localLabel = LabelCuston(title: "10 km ", titleFont: .systemFont(ofSize: 12), titleColor: .gray, alignment:.left )
    
    
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
    }
    
    private func setupHierarchy() {
        NSLayoutConstraint.activate([
            horizontalMainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalMainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalMainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalMainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            photoOng.heightAnchor.constraint(equalToConstant: 100),
            photoOng.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupView() {
        backgroundColor = .pink900
    }
}
