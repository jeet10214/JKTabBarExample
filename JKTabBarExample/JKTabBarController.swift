//
//  JKTabBarController.swift
//  JKTabBarExample
//
//  Created by Jeet Kapadia on 24/12/22.
//

import UIKit

internal struct JKTabBarModel {
    var tabTitle: String
    var tabImage: String
    var tabSelectedImage: String
    var vc: UIViewController
    
    internal init(tabTitle: String, tabImage: String, tabSelectedImage: String, vc: UIViewController) {
        self.tabTitle = tabTitle
        self.tabImage = tabImage
        self.tabSelectedImage = tabSelectedImage
        self.vc = vc
    }
}

final class JKTabBarController: UITabBarController {

    //MARK: Class properties
    internal var vcs: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(JKTabBar(), forKey: "tabBar")
    }
    
    // MARK: - internal Methods
    internal convenience init(withModel: [JKTabBarModel]) {
        self.init()
        var i = 0
        for tab in withModel {
            tab.vc.tabBarItem = UITabBarItem.init(title: tab.tabTitle, image: UIImage(systemName: tab.tabImage)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(systemName: tab.tabSelectedImage)?.withRenderingMode(.alwaysOriginal))
            vcs.append(tab.vc)
            i += 1
        }
        addTabs(withVCs: vcs)
    }
    
    internal func removeTab(atIndex: Int) {
        self.viewControllers?.remove(at: atIndex)
    }
    
    internal func addBadgeTo(index: Int, badgeText: String, badgeColor: UIColor = .clear) {
        let item = self.tabBar.items?[index]
        item?.badgeValue = badgeText
        item?.badgeColor = badgeColor
    }
    
    //MARK: Private Methods
    private func addTabs(withVCs: [UIViewController]) {
        self.viewControllers = withVCs.map{
            UINavigationController.init(rootViewController: $0)}
    }
}
