//
//  EditTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 20/04/2022.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    let containerView : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .lightGray
        
        return container
    }()
    
    let pageTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Edit Your Task"
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.font = UIFont(name: "Helvetica Neue", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont(name: "Helvetica Neue", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = .systemGray6
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let taskDate : UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .dateAndTime
        date.date = .now
        
        return date
    }()
    
    let doneTaskButton : UIButton = {
        let doneButton = UIButton(type: .system)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = .blue
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        doneButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        doneButton.setTitleColor(UIColor(ciColor: .white), for: .normal)
        doneButton.layer.cornerRadius = 8
        doneButton.addTarget(self, action: #selector(doneTask), for: .touchUpInside)
        return doneButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupView()
    }
    
    func setupView() {
        
        view.addSubview(containerView)
        
        let subviewList = [pageTitle ,titleLabel, titleTextField, descriptionTextView, descriptionLabel, taskDate, doneTaskButton]
        subviewList.forEach { subview in
            containerView.addSubview(subview) }
        
        
        NSLayoutConstraint.activate([
            
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            
            //MARK: - Page Title
            pageTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            pageTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            //MARK: - Title Label
            titleLabel.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            //MARK: - Title textfield
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            //MARK: - description label
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            //MARK: - decription textView
            descriptionTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            
            taskDate.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10),
            taskDate.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            taskDate.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            
            doneTaskButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            doneTaskButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30),
            doneTaskButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30),
            
        ])
    }
    
    @objc func doneTask() {
        
        let backVC = MainScreenTabBarViewController()
        backVC.modalPresentationStyle = .fullScreen
        show(backVC, sender: self)
    }
    
}
