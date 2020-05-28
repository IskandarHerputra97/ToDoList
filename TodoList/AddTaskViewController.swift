//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by Iskandar Herputra Wahidiyat on 16/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import RealmSwift

class AddTaskViewController: UIViewController {

    //MARK: PROPERTIES
    
    let taskTitleLabel = UILabel()
    let taskTitleTextField = UITextField()
    let taskDescriptionLabel = UILabel()
    let taskDescriptionTextView = UITextView()
    let addTaskButton = UIButton()
    let stackView = UIStackView()
    let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTaskTitleLabel()
        setupTaskTitleTextField()
        setupTaskDescriptionLabel()
        setupTaskDescriptionTextView()
        setupAddTaskButton()
        setupStackView()
        setupErrorLabel()
    }
    
    //MARK: SETUP UI
    
    func setupTaskTitleLabel() {
        taskTitleLabel.text = "Task Title"
    }
    
    func setupTaskTitleTextField() {
        taskTitleTextField.borderStyle = .line
    }
    
    func setupTaskDescriptionLabel() {
        taskDescriptionLabel.text = "Task Description"
    }
    
    func setupTaskDescriptionTextView() {
        taskDescriptionTextView.layer.borderColor = UIColor.black.cgColor
        taskDescriptionTextView.layer.borderWidth = 1
        taskDescriptionTextView.isScrollEnabled = false
    }
    
    func setupAddTaskButton() {
        addTaskButton.backgroundColor = .clear
        addTaskButton.layer.cornerRadius = 10
        addTaskButton.layer.borderWidth = 2
        addTaskButton.layer.borderColor = UIColor.black.cgColor
        addTaskButton.setTitleColor(.blue, for: .normal)
        addTaskButton.setTitle("Add Task", for: .normal)
        
        addTaskButton.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(taskTitleLabel)
        stackView.addArrangedSubview(taskTitleTextField)
        stackView.addArrangedSubview(taskDescriptionLabel)
        stackView.addArrangedSubview(taskDescriptionTextView)
        stackView.setCustomSpacing(50, after: taskDescriptionTextView)
        stackView.addArrangedSubview(errorLabel)
        stackView.addArrangedSubview(addTaskButton)
        
        setStackViewConstraints()
    }
    
    func setupErrorLabel() {
        errorLabel.text = "Please input Task Title and Task Description!"
        errorLabel.isHidden = true
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
    }
    
    //MARK: SET CONSTRAINTS

    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    //MARK: ACTIONS
    
    @objc func addTaskButtonTapped(sender: UIButton!) {
        if taskTitleTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" && taskDescriptionTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" {
            insertNewTask()
        } else {
            errorLabel.isHidden = false
        }
    }
    
    func insertNewTask() {
        //task.append(Task(title: taskTitleTextField.text!, description: taskDescriptionTextView.text!))
        
        taskRealm.append(Task2(title: taskTitleTextField.text!, taskDescription: taskDescriptionTextView.text!))
        
        let task2 = Task2()
        task2.title = taskTitleTextField.text!
        task2.taskDescription = taskDescriptionTextView.text!
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(task2)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
}
