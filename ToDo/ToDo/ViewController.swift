//
//  ViewController.swift
//  ToDo
//
//  Created by Sugirbay Margulan on 4/8/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toDos = [Todos]()

    let addNewTodoView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newToDoTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Add new to do"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .none
        textField.returnKeyType = UIReturnKeyType.done
        textField.addLine(position: .LINE_POSITION_BOTTOM, color: .darkGray, width: 0.5)
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addNavBar()
        setupLayouts()
        
        view.backgroundColor = .white
        
        toDos = [
            Todos(toDo: "To finish to do App", isChecked: false),
            Todos(toDo: "To prepare to flat", isChecked: true),
            Todos(toDo: "To read a book", isChecked: true),
            Todos(toDo: "To meditate and write all stuff that occured in your mind brooh", isChecked: false)
        ]
        
        newToDoTextField.delegate = self
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    func addNavBar() {
        navigationItem.title = "To Do"
        let category = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(transfer))
        self.navigationItem.rightBarButtonItem  = category
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func transfer(){
        let categoriesVC = CategoriesViewController()
        categoriesVC.title = "Categories"
        self.navigationController?.pushViewController(categoriesVC, animated: true)
    }
    
    func setupLayouts() {
        
        view.addSubview(addNewTodoView)
        addNewTodoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        addNewTodoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addNewTodoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addNewTodoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addNewTodoView.addSubview(newToDoTextField)
        newToDoTextField.topAnchor.constraint(equalTo: addNewTodoView.topAnchor, constant: 8).isActive = true
        newToDoTextField.leadingAnchor.constraint(equalTo: addNewTodoView.leadingAnchor, constant: 16).isActive = true
        newToDoTextField.bottomAnchor.constraint(equalTo: addNewTodoView.bottomAnchor, constant: -8).isActive = true
        newToDoTextField.trailingAnchor.constraint(equalTo: addNewTodoView.trailingAnchor, constant: -16).isActive = true
        
        setUpTableView()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addNewTodoView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16)
        ])
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ToDoCell.self, forCellReuseIdentifier: "cellId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ToDoCell
        let listIndexPath = toDos[indexPath.row]
        cell.todoLabel.text = listIndexPath.toDo
        return cell
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        let alert = UIAlertController(title: "Delete To Do", message: "Are you sure you want do delete this todo?", preferredStyle: .alert)
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = longPressGestureRecognizer.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                let ok = UIAlertAction(title: "Yes", style: .default, handler: { action in
                    self.toDos.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    self.tableView.reloadData()
                })
                alert.addAction(ok)
                let cancel = UIAlertAction(title: "No", style: .default, handler: { action in
                     })
                alert.addAction(cancel)
                DispatchQueue.main.async(execute: {
                    self.present(alert, animated: true)
                })
           }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDos.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == newToDoTextField {
            textField.resignFirstResponder()
            toDos.append(Todos(toDo: textField.text!, isChecked: false))
            tableView.reloadData()
            textField.text = ""
            return false
        }
         return true
    }
    
    
}
