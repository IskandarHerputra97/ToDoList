//
//  TaskDetailViewController.swift
//  TodoList
//
//  Created by Iskandar Herputra Wahidiyat on 15/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var taskLabel = UILabel()
    var taskDescriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBarItem()
        setupTaskLabel()
        setupTaskDescriptionLabel()
    }
    
    func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavigationBarItemTapped))
    }
    
    func setupTaskLabel() {
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .center
        taskLabel.font = taskLabel.font.withSize(40)
        view.addSubview(taskLabel)
        
        setTaskLabelConstraints()
    }
    
    func setupTaskDescriptionLabel() {
        taskDescriptionLabel.numberOfLines = 0
        taskDescriptionLabel.textAlignment = .center
        view.addSubview(taskDescriptionLabel)
        
        setTaskDescriptionLabelConstraints()
    }
    
    func setTaskLabelConstraints() {
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        taskLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        taskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setTaskDescriptionLabelConstraints() {
        taskDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        taskDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        taskDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        taskDescriptionLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc func editNavigationBarItemTapped() {
        let editTaskScreen = EditTaskViewController()
        editTaskScreen.title = "Edit Task"
        navigationController?.pushViewController(editTaskScreen, animated: true)
    }
}
