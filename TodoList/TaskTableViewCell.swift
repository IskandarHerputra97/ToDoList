//
//  TaskTableViewCell.swift
//  TodoList
//
//  Created by Iskandar Herputra Wahidiyat on 15/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var taskTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(taskTitleLabel)
        
        configureTitleLabel()
        setTitleLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(task: Task2) {
        taskTitleLabel.text = task.title
    }
    
    func configureTitleLabel() {
        taskTitleLabel.numberOfLines = 0
        taskTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleLabelConstraints() {
        taskTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        taskTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        taskTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        taskTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        taskTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
}
