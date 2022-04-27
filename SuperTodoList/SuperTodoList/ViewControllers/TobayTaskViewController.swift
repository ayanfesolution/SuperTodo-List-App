//
//  TodaysTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit
import CoreData

class TodaysTaskViewController: UIViewController {
    
    //MARK: Creating an instance of the Todays task label and table view
    var todoList = [Task]()
    var moc: NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    let todaysLabel : UILabel = {
        let today = UILabel()
        today.textColor = .black
        today.textAlignment = .center
        today.translatesAutoresizingMaskIntoConstraints = false
        today.text = "What You Have To Do Today"
        today.font = .systemFont(ofSize: 20, weight: .semibold)
        return today
    }()
    
    lazy var todayTaskTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodayTableVewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
        
        moc = appDelegate?.persistentContainer.viewContext
        loadTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTasks()
    }
    
    private func setupView(){
        view.addSubview(todaysLabel)
        view.addSubview(todayTaskTableView)
        
        //constrainsts
        NSLayoutConstraint.activate([
            // Constraints For todaysLabel
            todaysLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            todaysLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            todaysLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            //Constraint for Table View
            todayTaskTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            todayTaskTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            todayTaskTableView.topAnchor.constraint(equalTo: todaysLabel.bottomAnchor, constant: 5),
            todayTaskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2),      
        ])
    }
    
    private func loadTasks() {
        let tasksRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "added", ascending: false)
        tasksRequest.sortDescriptors = [sortDescriptor]
        
        do {
            try todoList = moc.fetch(tasksRequest)
        } catch let error {
            print("Error: \(error.localizedDescription) happened")
        }
        
        todayTaskTableView.reloadData()
    }
    
}

extension TodaysTaskViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableVewCell", for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TodayTableVewCell")
        
        let todoList = todoList[indexPath.row]
        
//        let todoDate = todoList.added as! Date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMMM d yyyy, hh:mm"
        
        cell.textLabel?.text = todoList.title
        cell.imageView?.image = UIImage(systemName: "star")
//        cell.detailTextLabel?.text = dateFormatter.string(from: todoDate)
        cell.detailTextLabel?.text = todoList.titleDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        guard let appDelegete = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegete.persistentContainer.viewContext
        
        let todoList = self.todoList[indexPath.row]
        
        let detailVC = DetailsTaskUIViewController()
        let navBar = UINavigationController(rootViewController: detailVC)
        navBar.modalPresentationStyle = .popover
        show(navBar, sender: self)
        
        detailVC.title = "Todo Details"
        detailVC.taskTitle.text = self.todoList[indexPath.row].title
        detailVC.taskDescription.text = self.todoList[indexPath.row].titleDescription
        }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completionHandler) in
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let todoListToBeDeleted = self.todoList[indexPath.row]
            
            managedContext.delete(todoListToBeDeleted)
            
            do {
                try managedContext.save()
                self.todoList = try managedContext.fetch(Task.fetchRequest())
                tableView.reloadData()
            } catch  {
                return
            }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "Edit") {(action, view, completionHandler) in
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let todoListToBeEdited = self.todoList[indexPath.row]
            
            let alert = UIAlertController(title: "Edit ToDo", message: "Kindly Update your info", preferredStyle: .alert)
            alert.addTextField()
            
            alert.addTextField()
            
            let textField = alert.textFields?.first
            textField?.text = self.todoList[indexPath.row].title
            
            let detailsTextField = alert.textFields?.last
            detailsTextField?.text = self.todoList[indexPath.row].titleDescription
            
            let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
                
                let textField = alert.textFields?.first
                todoListToBeEdited.setValue(textField?.text, forKey: "title")
                
                let detailsTextField = alert.textFields?.last
                todoListToBeEdited.setValue(detailsTextField?.text, forKey: "titleDescription")
                
                do {
                    try managedContext.save()
                    self.todoList = try managedContext.fetch(Task.fetchRequest())
                    tableView.reloadData()
                } catch {
                    return
                }
            }
            alert.addAction(saveButton)
            self.present(alert, animated: true, completion: nil)
            }
        return UISwipeActionsConfiguration(actions: [action])
    }

}
