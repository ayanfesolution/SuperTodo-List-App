//
//  DetailsTaskUIViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class DetailsTaskUIViewController: UIViewController {
    
    let taskTitle: UILabel = {
        let task = UILabel()
        task.font = .systemFont(ofSize: 25, weight: .medium)
        task.numberOfLines = 0
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    
    let taskDescription : UILabel = {
        let descriptions = UILabel()
        descriptions.translatesAutoresizingMaskIntoConstraints = false
        descriptions.numberOfLines = 0
        descriptions.font = .systemFont(ofSize: 18)
        return descriptions
    }()
    
    let dateText : UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView(){
        
        view.addSubview(taskTitle)
        view.addSubview(taskDescription)
        view.addSubview(dateText)
        //constrainsts
        NSLayoutConstraint.activate([
            // Constraints For task title
            taskTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            taskTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            taskTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150),
            
            // Constraints for taskDescription
            taskDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            taskDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            taskDescription.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 20),
            
            // Constraints for date
            dateText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            dateText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            dateText.topAnchor.constraint(equalTo: taskDescription.bottomAnchor, constant: 30),
        ])
    }
}
