//
//  UpdateView.swift
//  Contact
//
//  Created by Suleyman YAZICI on 1.09.2023.
//

import UIKit

class UpdateView: UIViewController {

    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var nameTextLabel: UITextField!
    @IBOutlet weak var noTextLabel: UITextField!
    
    var contact : Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        if let c = contact {
            nameTextLabel.text = c.contact_name
            noTextLabel.text = c.contact_no
        }
        view.addGestureRecognizer(tapGestureRecognizer)


    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        
        
        self.contact!.contact_name = nameTextLabel.text
        self.contact!.contact_no = noTextLabel.text
        
        appDelegate.saveContext()
        
    }
    //Klavyeyi kapamak için gerekli fonk------------------------------------------------------------------
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
    }
    //-----------------------------------------------------------------------------------------------------
    
}
