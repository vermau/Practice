//
//  ViewController.swift
//  TableGroupings
//
//  Created by Ujjwal Verma on 30/12/18.
//  Copyright © 2018 Ujjwal Verma. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let reuseIdentifier = "Cell"
    var isGroupedByAge = false
    var groupedPeople = [[Person]]()
    
    let people = [
        Person(firstName: "Michael", lastName: "Jordon", age: 35),
        Person(firstName: "Kobe", lastName: "Bryant", age: 25),
        Person(firstName: "Magic", lastName: "Jhonson", age: 40),
        Person(firstName: "Steph", lastName: "Curry", age: 22),
        Person(firstName: "Lebron", lastName: "James", age: 40),
        Person(firstName: "Kevin", lastName: "Durant", age: 35),
        Person(firstName: "Klay", lastName: "Thompson", age: 35),
        Person(firstName: "Charles", lastName: "Barkley", age: 35),
        Person(firstName: "Kenny", lastName: "Jhonson", age: 25),
        Person(firstName: "Clyde", lastName: "Drexler", age: 25),
        Person(firstName: "Vince", lastName: "Carter", age: 40),
        Person(firstName: "James", lastName: "Hardon", age: 42),
        Person(firstName: "Anthony", lastName: "Davis", age: 42),
        Person(firstName: "Vlade", lastName: "Divac", age: 35)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        navigationItem.title = "NBA Stars"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "GroupBy LastName", style: .plain, target: self, action: #selector(groupByLastName))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "GroupBy Age", style: .plain, target: self, action: #selector(groupByAge))

    }
    
    //MARK: Action Methods
    @objc fileprivate func groupByAge() {
        if groupedPeople.count > 0 {
            groupedPeople.removeAll()
            tableView.reloadData()
            changeBarButtonsToOriginal()
        } else {
            let groupedDictionary = Dictionary(grouping: people) { (person) -> Int in
                return person.age
            }
        
            let keys = groupedDictionary.keys.sorted()
            keys.forEach {
                groupedPeople.append(groupedDictionary[$0]!)
            }
        
            isGroupedByAge = true
            tableView.reloadData()
            changeBarButtonsToReset()
        }
    }

    @objc fileprivate func groupByLastName() {
        if groupedPeople.count > 0 {
            groupedPeople.removeAll()
            tableView.reloadData()
            changeBarButtonsToOriginal()
        } else {
            let groupedDictionary = Dictionary(grouping: people) { (person) -> Character in
                return person.lastName.first!
            }
            
            let keys = groupedDictionary.keys.sorted()
            keys.forEach {
                groupedPeople.append(groupedDictionary[$0]!)
            }
            
            isGroupedByAge = false
            tableView.reloadData()
            changeBarButtonsToReset()
        }
    }
    
    fileprivate func changeBarButtonsToReset() {
        navigationItem.leftBarButtonItem?.title = "Reset"
        navigationItem.rightBarButtonItem?.title = "Reset"
    }
    
    fileprivate func changeBarButtonsToOriginal() {
        navigationItem.leftBarButtonItem?.title = "GroupBy Age"
        navigationItem.rightBarButtonItem?.title = "GroupBy LastName"
    }

    //MARK: DataSource and Delegate methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedPeople.count > 0 ? groupedPeople.count : 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if groupedPeople.count > 0 {
            return groupedPeople[section].count
        } else {
            return people.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let person: Person
        
        if groupedPeople.count > 0 {
            person = groupedPeople[indexPath.section][indexPath.row]
        } else {
            person = people[indexPath.row]
        }
        
        cell.textLabel?.text = "\(person.firstName) \(person.lastName) - \(person.age)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return groupedPeople.count == 0 ? 0 : 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if groupedPeople.count == 0 {
            return nil
        } else {
            let label = UILabel()
            label.backgroundColor = .lightGray
            
            if isGroupedByAge {
                if let age = groupedPeople[section].first?.age {
                    label.text = "\(age)"
                }
            } else {
                if let nameChar = groupedPeople[section].first?.lastName.first {
                    label.text = "\(nameChar)"
                }
            }
            return label
        }
    }
}
