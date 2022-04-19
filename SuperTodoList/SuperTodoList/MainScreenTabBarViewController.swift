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
        
        setupViews()
    }
    
    func setupViews(){
        
        
        self.tabBar.barTintColor = .darkGray
        self.tabBar.barStyle = .black
        self.tabBar.backgroundColor = .white
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
        
        
    }

}
