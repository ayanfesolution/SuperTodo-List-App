//
//  MainScreenTabBarViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class MainScreenTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.popViewController(animated: true)
        setupViews()
    }
    
    func setupViews(){
        
        
        self.tabBar.barTintColor = .darkGray
        self.tabBar.barStyle = .black
        self.tabBar.backgroundColor = #colorLiteral(red: 0.7809061817, green: 0.9714233575, blue: 1, alpha: 1)
        //creating an instance
        let todayVC = TodaysTaskViewController()
        let addTaskVC = AddTaskViewController()
        let monthVC = MonthsTaskViewController ()
        
        
        //assigning the views to tabbar
        self.setViewControllers([todayVC, addTaskVC, monthVC], animated: false)
        
        //setting titles
        todayVC.title = "Today"
        addTaskVC.title = "Add Task"
        monthVC.title = "Month"
        
        //setting bar item images
        guard let items = self.tabBar.items else {return}
        let images = ["doc.text.image", "square.grid.3x1.folder.fill.badge.plus", "calendar.circle.fill"]
        
        for x in 0 ..< images.count {
            items[x].image = UIImage(systemName: images[x])
        }
    }
    
}
