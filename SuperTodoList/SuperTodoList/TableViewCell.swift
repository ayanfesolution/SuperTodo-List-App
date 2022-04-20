//
//  todaysTaskTableViewCell.swift
//  SuperTodoList
//
//  Created by Decagon on 19/04/2022.
//

import UIKit

class TodaysTaskTableViewCell: UITableViewCell {
    
    static let identifier = "TodaysTaskTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon)
        contentView.addSubview(task)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        task.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 5).isActive = true
        task.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        task.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    let icon : UIImageView = {
       let icon = UIImageView()
  //      icon.image = UIImage(systemName: "circle.circle")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let task : UILabel = {
        let task = UILabel()
  //      task.text = "Buy breead today"
        task.numberOfLines = 0
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    
    public func configure(tasks: String, imageName: String){
        icon.image = UIImage(systemName: imageName)
        task.text = tasks
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        icon.image = nil
        task.text = nil
    }
    
    
}

class MonthTaskTableViewCell: UITableViewCell {
    
    static let identifier = "MonthTaskTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon)
        contentView.addSubview(task)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        task.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 5).isActive = true
        task.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        task.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    let icon : UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let task : UILabel = {
        let task = UILabel()
        task.numberOfLines = 0
        task.translatesAutoresizingMaskIntoConstraints = false
        return task
    }()
    
    public func configure(tasks: String, imageName: String){
        icon.image = UIImage(systemName: imageName)
        task.text = tasks
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        icon.image = nil
        task.text = nil
    }
    

}
