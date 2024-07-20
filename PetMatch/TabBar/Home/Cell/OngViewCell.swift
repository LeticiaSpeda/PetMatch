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
    
    private lazy var moreButton = ButtonCuston(titleButton: "saiba mais", corneRadiusButton: 10, colorButton: .pink900, backgroundColorButton: .yellow)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupHierarchy()
        setupConstraints()
        setupView()
        setupActions()
    }
    
    @objc func handleLike() {
        if imageLike.isSelected {
            imageLike.imageButton = UIImage(systemName: "heart.fill")
            imageLike.backgroundColorButton = .yellow900
        } else {
            imageLike.imageButton = UIImage(systemName: "heart")
            imageLike.backgroundColorButton = .yellow900
        }
    }
    
    private func setupActions() {
        imageLike.addTarget(self, action: #selector(handleLike), for: .touchUpInside)
        verticalStack.isUserInteractionEnabled = false
    }
    
    private func setupHierarchy() {
        contentView.addSubview(horizontalMainStack)
        
        horizontalMainStack.addArrangedSubview(photoOng)
        horizontalMainStack.addArrangedSubview(verticalStack)
        
        verticalStack.addArrangedSubview(localLabel)
        verticalStack.addArrangedSubview(availableLabel)
        verticalStack.addArrangedSubview(UIView())
        
        horizontalMainStack.addArrangedSubview(UIView())
        horizontalMainStack.addArrangedSubview(verticalStackImages)
        verticalStackImages.addArrangedSubview(imageLike)
        verticalStackImages.addArrangedSubview(UIView())
        
        verticalStack.addArrangedSubview(moreButton)
    }
    
    private func setupConstraints() {
        horizontalMainStack.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            bottom: contentView.bottomAnchor,
            padding: UIEdgeInsets(top: 20,left: 20,bottom: -20,right:-20)
        )
        
        photoOng.anchorSize(height: 100)
        photoOng.anchorSize(width: 100)
        
        localLabel.anchor(
            top: verticalStack.topAnchor,
            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        )
        
        imageLike.anchorSize(width: 20)
        imageLike.anchor(
            trailing: horizontalMainStack.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -13)
        )
        
        moreButton.anchorSize(height: 30)
        moreButton.anchorSize(width: 200)
    }
    
    private func setupView() {
        backgroundColor = .pink900
        layer.cornerRadius = 14
    }
}
