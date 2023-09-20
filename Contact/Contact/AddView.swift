//
//  AddView.swift
//  Contact
//
//  Created by Suleyman YAZICI on 31.08.2023.
//

import UIKit
import CoreData


class AddView: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var noTextField: UITextField!
    let context = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)

    
    }
    @IBAction func addButton(_ sender: Any) {
        let contact = Contacts(context: context)

        contact.contact_name = nameTextField.text
        contact.contact_no = noTextField.text
        
        appDelegate.saveContext()
        
    }
    //Klavyeyi kapamak için gerekli fonk------------------------------------------------------------------
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
    }
    //-----------------------------------------------------------------------------------------------------
}
