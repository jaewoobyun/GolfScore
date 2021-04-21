//
//  CreatePlayerVC.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/21.
//

import Foundation
import UIKit
import CoreData

class CreatePlayerVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var managedContext: NSManagedObjectContext!
    
//    lazy var coreDataStack = CoreDataStack
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func savePlayer() {
        
    }
    
    
}
