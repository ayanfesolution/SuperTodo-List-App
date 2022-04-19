//
//  MonthsTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class MonthsTaskViewController: UIViewController {
    
    let addTaskButton : UIButton = {
        let addTask = UIButton(type: .system)
        addTask.translatesAutoresizingMaskIntoConstraints = false
        addTask.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        addTask.layer.cornerRadius = 25
        addTask.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return addTask
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .red
        
    }
    
    func setupView(){
        
        
        //constrainsts
        NSLayoutConstraint.activate([
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
