//
//  DetailsTaskUIViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class DetailsTaskUIViewController: UIViewController {
    
    var item : Int = 0
    
    let taskTitle: UILabel = {
        let task = UILabel()
        task.font = .systemFont(ofSize: 25, weight: .medium)
        task.numberOfLines = 0
        task.text = "A Sample Place Holder"
        task.translatesAutoresizingMaskIntoConstraints = false
        
        return task
    }()
    
    
    
    let taskDescription : UILabel = {
        let descriptions = UILabel()
        descriptions.translatesAutoresizingMaskIntoConstraints = false
        descriptions.numberOfLines = 0
        descriptions.font = .systemFont(ofSize: 18)
        descriptions.text = "IHIUUYghhxiug,M NVJHXJHgxuyv,   ugbsxjGUYBJ BUBJHg mh n  hjusmnbubc mnB"
        return descriptions
    }()
    
    let dateText : UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    let editTaskButton : UIButton = {
        let editButton = UIButton(type: .system)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitle("Edit Task", for: .normal)
        editButton.setTitleColor(UIColor(ciColor: .white), for: .normal)
        editButton.backgroundColor = .blue
        editButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        editButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        editButton.layer.cornerRadius = 8
        editButton.addTarget(self, action: #selector(showEditViewController), for: .touchUpInside)
        return editButton
    }()
    
    let deleteTaskButton : UIButton = {
        let deleteButton = UIButton(type: .system)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("Delete Task", for: .normal)
        deleteButton.backgroundColor = .blue
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        deleteButton.setTitleColor(UIColor(ciColor: .white), for: .normal)
        deleteButton.layer.cornerRadius = 8
        deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        return deleteButton
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
        view.addSubview(deleteTaskButton)
        view.addSubview(editTaskButton)
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
            
            
            deleteTaskButton.widthAnchor.constraint(equalToConstant: 150),
            deleteTaskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            deleteTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            
            
            editTaskButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            editTaskButton.widthAnchor.constraint(equalToConstant: 150),
            editTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25)
            
        ])
    }
    
    
    
    @objc public func showEditViewController() {

        let editVC = EditTaskViewController()
        editVC.modalPresentationStyle = .automatic
        show(editVC, sender: self)

    }
    
    @objc func deleteTask() {
        let backVC = MainScreenTabBarViewController()
        backVC.modalPresentationStyle = .fullScreen
        show(backVC, sender: self)
    }
}
