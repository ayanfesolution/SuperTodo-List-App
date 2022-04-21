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
    //let tasks = ["task1", "task2", "task3", "task4"]
    
    var todoList = [Task]()
    var moc:NSManagedObjectContext!
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
    
    let todayTaskTableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white

    }
    
    func setupView(){
        
        todayTaskTableView.register(TodaysTaskTableViewCell.self, forCellReuseIdentifier: TodaysTaskTableViewCell.identifier)
        
        
        view.addSubview(todaysLabel)
        view.addSubview(todayTaskTableView)
        todayTaskTableView.dataSource = self
        todayTaskTableView.delegate = self
        
        
        todayTaskTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
      


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
    

}

extension TodaysTaskViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodaysTaskTableViewCell.identifier, for: indexPath) as! TodaysTaskTableViewCell
        let todoList = todoList[indexPath.row]
       
     //   cell.task1
        //cell.task.text = tasks[indexPath.row]
        //cell.configure(tasks: "Go and buy Bread", imageName: "circle.circle")
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    
    func tableView(_ tableView: UITableView,
                      didSelectRowAt indexPath: IndexPath) {
            let detailVC = DetailsTaskUIViewController()
        detailVC.modalPresentationStyle = .fullScreen
           show(detailVC, sender: self)
       }
}
