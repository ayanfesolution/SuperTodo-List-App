//
//  MonthsTaskViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class MonthsTaskViewController: UIViewController {

    let monthsLabel : UILabel = {
            let month = UILabel()
            month.textColor = .black
            month.textAlignment = .center
            month.translatesAutoresizingMaskIntoConstraints = false
            month.text = "What You Have To Do This Month"
            month.font = .systemFont(ofSize: 20, weight: .semibold)
            return month
        }()
        
        let monthTaskTableView = UITableView()
        
        //MARK: Creating an instance of the Tomorrow task label and table view
        
       
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            view.backgroundColor = .white

        }
        
        func setupView(){
            monthTaskTableView.register(MonthTaskTableViewCell.self, forCellReuseIdentifier: "monthDetails")
            
            
            view.addSubview(monthsLabel)
            view.addSubview(monthTaskTableView)
            monthTaskTableView.dataSource = self
            
            
            monthTaskTableView.translatesAutoresizingMaskIntoConstraints = false

            //constrainsts
            NSLayoutConstraint.activate([
                // Constraints For todaysLabel
                monthsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                monthsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
                monthsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                //Constraint for Table View
                monthTaskTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
                monthTaskTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
                monthTaskTableView.topAnchor.constraint(equalTo: monthsLabel.bottomAnchor, constant: 5),
                monthTaskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2),
            ])
        }
        

    }

    extension MonthsTaskViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 20
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "monthDetails", for: indexPath) as! MonthTaskTableViewCell
            
            return cell
        }

}
