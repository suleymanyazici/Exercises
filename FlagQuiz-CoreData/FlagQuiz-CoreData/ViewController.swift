//
//  ViewController.swift
//  FlagQuiz-CoreData
//
//  Created by Suleyman YAZICI on 7.09.2023.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    var scoreList = [Scores]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
      
        
    }
    @IBAction func StartButton(_ sender: Any) {
        let alert = UIAlertController(title: "Start", message: "Are You Ready?", preferredStyle: .alert)
        alert.addTextField{
            textField in textField.placeholder = "Name"
        }
        let startAction =  UIAlertAction(title: "Start", style: .default)
    }
    
}
