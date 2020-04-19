//
//  EditTaskViewController.swift
//  TodoList
//
//  Created by Iskandar Herputra Wahidiyat on 17/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {

    //MARK: PROPERTIES
    
    let taskTitleLabel = UILabel()
    let taskTitleTextField = UITextField()
    let taskDescriptionLabel = UILabel()
    let taskDescriptionTextView = UITextView()
    let editTaskButton = UIButton()
    let stackView = UIStackView()
    let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTaskTitleLabel()
        setupTaskTitleTextField()
        setupTaskDescriptionLabel()
        setupTaskDescriptionTextView()
        setupEditTaskButton()
        setupStackView()
        setupErrorLabel()
    }
    
    //MARK: SETUP UI
    
    func setupTaskTitleLabel() {
        taskTitleLabel.text = "Task Title"
    }
    
    func setupTaskTitleTextField() {
        //taskTitleTextField.text = "Test"
        taskTitleTextField.borderStyle = .line
    }
    
    func setupTaskDescriptionLabel() {
        taskDescriptionLabel.text = "Task Description"
    }
    
    func setupTaskDescriptionTextView() {
        //taskDescriptionTextView.text = "Test"
        taskDescriptionTextView.layer.borderColor = UIColor.black.cgColor
        taskDescriptionTextView.layer.borderWidth = 1
        taskDescriptionTextView.isScrollEnabled = false
    }
    
    func setupEditTaskButton() {
        editTaskButton.backgroundColor = .clear
        editTaskButton.layer.cornerRadius = 10
        editTaskButton.layer.borderWidth = 2
        editTaskButton.layer.borderColor = UIColor.black.cgColor
        editTaskButton.setTitleColor(.blue, for: .normal)
        editTaskButton.setTitle("Edit Task", for: .normal)
        
        editTaskButton.addTarget(self, action: #selector(editTaskButtonTapped), for: .touchUpInside)
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
        stackView.addArrangedSubview(editTaskButton)
        
        setStackViewConstraints()
    }
    
    func setupErrorLabel() {
        errorLabel.text = "Please input Task Title or Task Description!"
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
    
    @objc func editTaskButtonTapped(sender: UIButton!) {
        if taskTitleTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" || taskDescriptionTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" {
            editTask()
            print("Condition 1")
        } else {
            errorLabel.isHidden = false
            print("Condition 2")
        }
    }
   
    func editTask() {
        //task[choosenRow] = Task(title: taskTitleTextField.text!, description: taskDescriptionTextView.text!)
        
        if taskTitleTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" {
            task[choosenRow].title = taskTitleTextField.text!
        } else if taskDescriptionTextView.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "" {
            task[choosenRow].description = taskDescriptionTextView.text
        }
        
        /*
        task[choosenRow] = Task(title: taskTitleTextField.text ?? "Default Task Title", description: taskDescriptionTextView.text ?? "Default Task Description")
        */
        
        navigationController?.popToRootViewController(animated: true)
    }
}
