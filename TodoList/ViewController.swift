//
//  ViewController.swift
//  TodoList
//
//  Created by Iskandar Herputra Wahidiyat on 15/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

var task: [Task] = []
var choosenRow = 0

var tempData = ""
//var task: [Task] = []
//var tempArr: [String] = userDefaults.object(forKey: "test") as? [String] ?? []
//var task: [Task] = userDefaults.object(forKey: "taskArray") as? [Task] ?? []

//let decoded = userDefaults.object(forKey: "myTask") as! Data
//let decodedTask = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! Task

class ViewController: UIViewController {
    
    let nextButton = UIButton()
    let label = UILabel()
    let label2 = UILabel()
    let stackView = UIStackView()
    var tableView = UITableView()
    
    struct Cells {
        static let taskCell = "TaskCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavigationBarItem()
        setupTableView()
        //task = fetchData()
        navigationItem.title = "My To Do List"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonTapped))
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 50
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: Cells.taskCell)
        setTableViewConstraints()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func taskTableCellTapped(taskIndex: Int, taskTitle: String, taskDescription: String) {
        choosenRow = taskIndex
        let taskDetailScreen = TaskDetailViewController()
        taskDetailScreen.title = "Task Detail"
        taskDetailScreen.taskLabel.text = taskTitle
        taskDetailScreen.taskDescriptionLabel.text = taskDescription
        navigationController?.pushViewController(taskDetailScreen, animated: true)
    }
    
    @objc func addTaskButtonTapped() {
        let addTaskScreen = AddTaskViewController()
        addTaskScreen.title = "Add New Task"
        navigationController?.pushViewController(addTaskScreen, animated: true)
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.taskCell) as! TaskTableViewCell
        let myTask = task[indexPath.row]
        cell.set(task: myTask)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskTableCellTapped(taskIndex: indexPath.row, taskTitle: task[indexPath.row].title, taskDescription: task[indexPath.row].description)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension ViewController {
    func fetchData() -> [Task] {
        return task
    }
}

