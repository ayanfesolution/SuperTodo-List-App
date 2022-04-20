//
//  todaysTaskTableViewCell.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class TodaysTaskTableViewCell: UITableViewCell {
    
    let icon : UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(systemName: "circle.circle")
        icon.translatesAutoresizingMaskIntoConstraints = false
       
        return icon
    }()
    
    let task : UILabel = {
        let task = UILabel()
        task.text = "Buy breead today"
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    
}

class MonthTaskTableViewCell: UITableViewCell {
    
    let icon : UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(systemName: "circle.circle")
        icon.translatesAutoresizingMaskIntoConstraints = false
       
        return icon
    }()
    
    let task : UILabel = {
        let task = UILabel()
        task.text = "Buy breead today"
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    

}
