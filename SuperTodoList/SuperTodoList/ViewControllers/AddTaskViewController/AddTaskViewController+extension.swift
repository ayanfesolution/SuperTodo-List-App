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
    
    @objc internal func didTapAddTask() {
        guard let title = titleTextField.text,
              title.count > 1,
              let description = descriptionTextView.text,
              description.count > 1 else {
            return
        }

        createTaskWith(title: title,
                       description: description) {
            resetFields()
            switchToTodayViewController()
        }
    }
    
    private func createTaskWith(title: String,
                                description: String,
                                completion: () -> Void) {
        
        let newTask = Task(context: moc)
        newTask.title = title
        newTask.titleDescription = description
        
        appDelegate.saveContext()
        completion()
    }
    
    private func switchToTodayViewController() {
        self.tabBarController?.selectedIndex = 0
    }
    
    private func resetFields() {
        titleTextField.text = nil
        descriptionTextView.text = nil
    }
}
