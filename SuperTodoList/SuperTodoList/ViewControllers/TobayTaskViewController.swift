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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableVewCell", for: indexPath)
        let todoList = todoList[indexPath.row]
        
        cell.textLabel?.text = todoList.title
        cell.imageView?.image = UIImage(systemName: "star")
        cell.detailTextLabel?.text = todoList.titleDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsTaskUIViewController()
        detailVC.modalPresentationStyle = .fullScreen
        show(detailVC, sender: self)
    }
    
}
