import UIKit

final class SearchBarCuston: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupSearch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSearch() {
        placeholder = "Search"
        sizeToFit()
        layer.cornerRadius = 20
        layer.masksToBounds = true
        isTranslucent = false
        searchTextField.backgroundColor = .white
        searchTextField.tintColor = .black
        backgroundImage = UIImage()
    }
}
