//
//  AddTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 4/18/22.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    let titleTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
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
    
    let duedateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Due Date", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let timeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Time", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let addtaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapAddTask), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Add Task"

        setupViews()
    }
    
}
