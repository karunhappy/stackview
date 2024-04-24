//
//  TabbarVC.swift
//  StackView
//
//  Created by Karun Aggarwal on 24/04/24.
//

import UIKit

class TabbarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(named: "darkBlue")
        tabBar.unselectedItemTintColor = UIColor.black
        
        tabBar.barTintColor = UIColor.white
        tabBar.backgroundColor = UIColor.white
        
        // Instantiate view controllers
        let homeNav = self.storyboard?.instantiateViewController(withIdentifier: "HomeNav") as! UINavigationController
        let ordersNav = self.storyboard?.instantiateViewController(withIdentifier: "OrdersNav") as! UINavigationController
        let dummyNav = self.storyboard?.instantiateViewController(withIdentifier: "DummyNav") as! UINavigationController
        let notificationNav = self.storyboard?.instantiateViewController(withIdentifier: "NotificationNav") as! UINavigationController
        let myAccountNav = self.storyboard?.instantiateViewController(withIdentifier: "MyAccountNav") as! UINavigationController
        
        
        // Create TabBar items
        homeNav.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "home_unselect"),
            selectedImage: UIImage(named: "home_select")
        )
        ordersNav.tabBarItem = UITabBarItem(
            title: "Orders",
            image: UIImage(named: "orders_unselect"),
            selectedImage: UIImage(named: "orders_selected")
        )
        dummyNav.tabBarItem = UITabBarItem(
            title: nil,
            image: nil,
            selectedImage: nil
        )
        notificationNav.tabBarItem = UITabBarItem(
            title: "Notifications",
            image: UIImage(named: "notification_unselect"),
            selectedImage: UIImage(named: "notification_select")
        )
        
        myAccountNav.tabBarItem = UITabBarItem(
            title: "My Acount",
            image: UIImage(named: "my_account_unselect"),
            selectedImage: UIImage(named: "my_account_select")
        )
        
        
        self.setViewControllers(
            [homeNav, ordersNav, dummyNav, notificationNav, myAccountNav],
            animated: false
        )
        
        guard let tabBar = self.tabBar as? CustomTabBar else { return }
        
        tabBar.didTapButton = { [unowned self] in
            self.routeToCreateNewAd()
        }
    }
        func routeToCreateNewAd() {
            let createAdNavController = self.storyboard?.instantiateViewController(withIdentifier: "NewOrderNav") as! UINavigationController
            createAdNavController.modalPresentationCapturesStatusBarAppearance = true
            self.present(createAdNavController, animated: true, completion: nil)
        }
}

class DummyVC: UIViewController {
    
}
