//
//  TodaysTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class TodaysTaskViewController: UIViewController {
    //MARK: Creating an instance of the Todays task label and table view
    
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
    
    //MARK: Creating an instance of the Tomorrow task label and table view
    
    let tomorrowLabel : UILabel = {
        let tomorrow = UILabel()
        tomorrow.textColor = .black
        tomorrow.textAlignment = .center
        tomorrow.translatesAutoresizingMaskIntoConstraints = false
        tomorrow.text = "What You Have To Do Today"
        tomorrow.font = .systemFont(ofSize: 20, weight: .semibold)
        return tomorrow
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white

    }
    
    func setupView(){
        todayTaskTableView.register(TodaysTaskTableViewCell.self, forCellReuseIdentifier: "todayDetails")
        
        
        view.addSubview(todaysLabel)
        view.addSubview(todayTaskTableView)
        todayTaskTableView.dataSource = self
        
        
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

extension TodaysTaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayDetails", for: indexPath) as! TodaysTaskTableViewCell
        
        
        return cell
    }
    
    
}
