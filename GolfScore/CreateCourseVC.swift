//
//  CreateCourseVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/22.
//

import Foundation
import UIKit
import CoreData

class CreateCourseVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var courseNameTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let holeCellID = "holeCellID"
    
    var managedContext: NSManagedObjectContext!
    
    var currentCourse: Course?
    
    var courses: [NSManagedObject] = []
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        tableView.register(HoleCell.self, forCellReuseIdentifier: holeCellID)
        tableView.register(UINib(nibName: "HoleCell", bundle: nil), forCellReuseIdentifier: holeCellID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadCourse()
        
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCourse))
        
        navigationItem.rightBarButtonItem = saveButton
        
        
    }
    
    func loadCourse() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.managedContext = appDelegate.coreDataStack.managedContext
        let entity = NSEntityDescription.entity(forEntityName: "Course", in: managedContext)!
        
        self.currentCourse = NSManagedObject(entity: entity, insertInto: managedContext) as? Course
        
        
        
        
    }
    
    @objc func saveCourse() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Course", in: managedContext)!
        
        var course = NSManagedObject(entity: entity, insertInto: managedContext)
        course = currentCourse!
        
        let name = self.courseNameTextField.text
        
        course.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            courses.append(course)
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
    }
    
    func parTypeForEachHole(indexPath: IndexPath, course: Course) {
        guard let holeCell = self.tableView.cellForRow(at: indexPath) as? HoleCell else { return }
        guard let holeparString = holeCell.parTextField.text else { return }
        let holeparInt: Int16 = Int16(holeparString) ?? 4
        
        
        if indexPath.row == 0 {
            course.hole1 = holeparInt
        }
        if indexPath.row == 1 {
            course.hole2 = holeparInt
        }
        if indexPath.row == 2 {
            course.hole3 = holeparInt
        }
        if indexPath.row == 3 {
            course.hole4 = holeparInt
        }
        if indexPath.row == 4 {
            course.hole5 = holeparInt
        }
        if indexPath.row == 5 {
            course.hole6 = holeparInt
        }
        if indexPath.row == 6 {
            course.hole7 = holeparInt
        }
        if indexPath.row == 7 {
            course.hole8 = holeparInt
        }
        if indexPath.row == 8 {
            course.hole9 = holeparInt
        }
        if indexPath.row == 9 {
            course.hole10 = holeparInt
        }
        if indexPath.row == 10 {
            course.hole11 = holeparInt
        }
        if indexPath.row == 11 {
            course.hole12 = holeparInt
        }
        if indexPath.row == 12 {
            course.hole13 = holeparInt
        }
        if indexPath.row == 13 {
            course.hole14 = holeparInt
        }
        if indexPath.row == 14 {
            course.hole15 = holeparInt
        }
        if indexPath.row == 15 {
            course.hole16 = holeparInt
        }
        if indexPath.row == 16 {
            course.hole17 = holeparInt
        }
        if indexPath.row == 17 {
            course.hole18 = holeparInt
        }
        
    }
    
    
}



extension CreateCourseVC: UITableViewDelegate {
    
}

extension CreateCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: holeCellID, for: indexPath) as! HoleCell
        
        cell.holeNumberLabel.text = "\(indexPath.row)"
        cell.parTextField.text = "4"
        
        if (indexPath.row == 0) {
            cell.parTextField.text = String(describing: currentCourse?.hole1)
        }
        if (indexPath.row == 1) {
            cell.parTextField.text = String(describing: currentCourse?.hole2)
        }
        if (indexPath.row == 2) {
            cell.parTextField.text = String(describing: currentCourse?.hole3)
        }
        if (indexPath.row == 3) {
            cell.parTextField.text = String(describing: currentCourse?.hole4)
        }
        if (indexPath.row == 4) {
            cell.parTextField.text = String(describing: currentCourse?.hole5)
        }
        if (indexPath.row == 5) {
            cell.parTextField.text = String(describing: currentCourse?.hole6)
        }
        if (indexPath.row == 6) {
            cell.parTextField.text = String(describing: currentCourse?.hole7)
        }
        if (indexPath.row == 7) {
            cell.parTextField.text = String(describing: currentCourse?.hole8)
        }
        if (indexPath.row == 8) {
            cell.parTextField.text = String(describing: currentCourse?.hole9)
        }
        if (indexPath.row == 9) {
            cell.parTextField.text = String(describing: currentCourse?.hole10)
        }
        if (indexPath.row == 10) {
            cell.parTextField.text = String(describing: currentCourse?.hole11)
        }
        if (indexPath.row == 11) {
            cell.parTextField.text = String(describing: currentCourse?.hole12)
        }
        if (indexPath.row == 12) {
            cell.parTextField.text = String(describing: currentCourse?.hole13)
        }
        if (indexPath.row == 13) {
            cell.parTextField.text = String(describing: currentCourse?.hole14)
        }
        if (indexPath.row == 14) {
            cell.parTextField.text = String(describing: currentCourse?.hole15)
        }
        if (indexPath.row == 15) {
            cell.parTextField.text = String(describing: currentCourse?.hole16)
        }
        if (indexPath.row == 16) {
            cell.parTextField.text = String(describing: currentCourse?.hole17)
        }
        if (indexPath.row == 17) {
            cell.parTextField.text = String(describing: currentCourse?.hole18)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let alertController = UIAlertController(title: "Hole \(indexPath.row)", message: "Select", preferredStyle: .actionSheet)
        
        
        let par3Action = UIAlertAction(title: "Par3", style: .default) { (action) in
            //
            guard let cell = tableView.cellForRow(at: indexPath) as? HoleCell else { return }
            cell.parTextField.text = "3"
        }
        
        let par4Action = UIAlertAction(title: "Par4", style: .default) { (action) in
            //
            guard let cell = tableView.cellForRow(at: indexPath) as? HoleCell else { return }
            cell.parTextField.text = "4"
        }
        
        let par5Action = UIAlertAction(title: "Par5", style: .default) { (action) in
            //
            guard let cell = tableView.cellForRow(at: indexPath) as? HoleCell else { return }
            cell.parTextField.text = "5"
        }
        
        alertController.addAction(par3Action)
        alertController.addAction(par4Action)
        alertController.addAction(par5Action)
        
        self.present(alertController, animated: true, completion: nil)
        
        self.parTypeForEachHole(indexPath: indexPath, course: currentCourse!)

    }
    
    
}
