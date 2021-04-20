//
//  BaseTableVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/20.
//

import Foundation
import UIKit
import CoreData

class BaseTableVC: UITableViewController {
    
    
    var players: [NSManagedObject] = []
    var courses: [NSManagedObject] = []
    var rounds: [NSManagedObject] = []
    
//    init(model: String) {
//        super.init()
//        
//        self.titleName = model
//        
//        if model == "Players" {
//            print("players")
//        }
//        if model == "Courses" {
//            print("courses")
//        }
//        if model == "Rounds" {
//            print("rounds")
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = titleName
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //TODO: make different cells
//        tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        
        
        self.navigationController?.navigationItem.rightBarButtonItem?.image = UIImage(named: "plus")
//        self.navigationController?.navigationItem.rightBarButtonItem?
        
//
//        let addPlayerButton = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: Selector("addPlayer"))
//
//        let addCourseButton = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: Selector("addCourse"))
//
//        let addRoundButton = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: Selector("addRound"))
//
//        if <#condition#> {
//            self.navigationController?.navigationItem.rightBarButtonItem?.action = Selector("addPlayer")
//        }
        
    }
    
    
    @objc func addPlayer() {
        
    }
    
    @objc func addCourse() {
        
    }
    
    @objc func addRound() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let playerFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Player")
        let roundFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Round")
        let courseFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Course")
        
        //3
        do {
            players = try managedContext.fetch(playerFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        do {
            courses = try managedContext.fetch(courseFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        do {
            rounds = try managedContext.fetch(roundFetchRequest)
        } catch let error as NSError {
            print(error, error.userInfo)
        }
        
        
        
    }
    
    
    // MARK: Tableview Delegate
    
    
    // MARK: Tableview Datasource
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
    
}
