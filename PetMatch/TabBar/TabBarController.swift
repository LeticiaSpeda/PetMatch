import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupTabBar()
    }
    
    private func setupControllers() {
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem.image = UIImage(systemName: "house")
                 
        let secondViewController = UIViewController()
        secondViewController.tabBarItem.image = UIImage(systemName: "house")
        
        let viewControllersList = [firstViewController, secondViewController]
        self.viewControllers = viewControllersList
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .yellow900
        tabBar.unselectedItemTintColor = .white600.withAlphaComponent(0.5)
        tabBar.backgroundColor = .pink900
        tabBar.layer.cornerRadius = 18
    }
}
