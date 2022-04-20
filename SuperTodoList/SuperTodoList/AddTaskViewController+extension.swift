//
//  AddTaskViewController+extension.swift
//  SuperTodoList
//
//  Created by Decagon on 4/18/22.
//

import UIKit

extension AddTaskViewController {
    
    func setupViews() {
        let subviewList = [titleTextField, descriptionTextView, descriptionLabel, duedateButton, addtaskButton]
        subviewList.forEach { subview in
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            
            //MARK: - Title textfield
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            //MARK: - description label
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            //MARK: - decription textView
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            
            //MARK: - Due date button
            duedateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            duedateButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10),
            
            //MARK: - Add task button
            addtaskButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            addtaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            addtaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            addtaskButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc func didTapAddTask() {
        let alertController = UIAlertController(title: "Successful", message: "Task successfully added", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
