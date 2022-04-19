//
//  TodaysTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class TodaysTaskViewController: UIViewController {
    let addTaskButton : UIButton = {
        let addTask = UIButton(type: .system)
        addTask.translatesAutoresizingMaskIntoConstraints = false
        addTask.setImage(UIImage(systemName: "plus.fill"), for: .normal)
        addTask.layer.cornerRadius = 20
        addTask.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addTask.backgroundColor = .blue
        return addTask
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .green

    }
    
    func setupView(){
        view.addSubview(addTaskButton)
        
        //constrainsts
        NSLayoutConstraint.activate([
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
}
