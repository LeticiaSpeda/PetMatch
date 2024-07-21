import UIKit

final class DetailsViewController: UIViewController {
    
    private lazy var viewImage: UIView = {
        let view = UIView()
        view.backgroundColor = .pink900
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backButton = ButtonCuston(imageButton: UIImage(systemName: "chevron.backward"), colorButton: .yellow)
    
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
        viewImage.addSubview(backButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: view.topAnchor),
            viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewImage.heightAnchor.constraint(equalToConstant: 387),
            backButton.topAnchor.constraint(equalTo: viewImage.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: viewImage.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white600
    }
    
}
