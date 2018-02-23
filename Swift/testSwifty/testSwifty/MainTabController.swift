//
//  MainTabController.swift
//  testSwifty
//
//  Created by Fukuchi Tsubasa on 2017/08/01.
//  Copyright © 2017年 Fukuchi Tsubasa. All rights reserved.
//

import UIKit
import UIKit

class MainTabController: UITabBarController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var viewControllers: [UIViewController] = []
        
        let graphViewController = GraphViewController()
        graphViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostRecent, tag: 1)
        viewControllers.append(graphViewController)
        
        let musicViewController = MusicViewController()
        musicViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 2)
        viewControllers.append(musicViewController)
        
        let myListViewController = MyListViewController()
        myListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 3)
        viewControllers.append(myListViewController)
        
        self.setViewControllers(viewControllers, animated: false)
        
        
        // なぜか0だけだと選択されないので1にしてから0に
        self.selectedIndex = 0
    }
}
