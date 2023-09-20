//
//  ViewController.swift
//  Contact
//
//  Created by Suleyman YAZICI on 30.08.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var sarchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var contactList = [Contacts]()
    var searchsWord = String()
    var isItMakingSearch = false
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        tableView.delegate = self
        tableView.dataSource = self
        
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        getAllContacts()
        tableView.reloadData()
    }
    //Tüm numaraları core datadan getirmesi için gerekli fonksiyon---------------------------------------
    func getAllContacts(){
        do {
            contactList = try context.fetch(Contacts.fetchRequest())
        } catch  {
            print(error)
        }
    //---------------------------------------------------------------------------------------------------
    }
    //Sayfalar arası veri aktarımı-----------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "toDetail"{
            let toVC = segue.destination as! DetailView
            toVC.contact = self.contactList[index!]
        }
        if segue.identifier == "toUpdate"{
            let toVC = segue.destination as! UpdateView
            toVC.contact = self.contactList[index!]
        }
    //----------------------------------------------------------------------------------------------------
    }
    //MakeSearch-------------------------------------------------------------------------------------------
    //arama barı için Core datada arama yapabilmek adına oluşturulmuş fonksiyondur
    func makeSearch(contact_name:String){
        let fetchRequest:NSFetchRequest<Contacts> = Contacts.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "contact_name CONTAINS %@", contact_name.lowercased())
        
        do {
            self.contactList = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    //-----------------------------------------------------------------------------------------------------
}
    
    //TableView--------------------------------------------------------------------------------------------
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! CellView
        cell.cellLabel.text = "\(contact.contact_name!) - \(contact.contact_no!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    //--------------------------------------------------------------------------------------------------
    //TrailingSwipeAction--------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {_,_,_  in
            self.performSegue(withIdentifier: "toUpdate", sender: indexPath.row)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){_,_,_ in
            
            let alert = UIAlertController(title: "Deleting", message: "Are You Sure?", preferredStyle: .alert)
            
            let okButon = UIAlertAction(title: "OK", style: .destructive){_ in
                var contact = Contacts()
                contact = self.contactList[indexPath.row]
                self.context.delete(contact)
                appDelegate.saveContext()
                
                if self.isItMakingSearch{
                    self.makeSearch(contact_name: self.searchsWord)
                }else{
                    self.getAllContacts()
                }
                
                self.tableView.reloadData()
               

            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .default)
            alert.addAction(okButon)
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil )
        }
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        
    }
    //---------------------------------------------------------------------------------------------------------
}
    //SearchBar------------------------------------------------------------------------------------------------
extension ViewController : UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching word is \(searchText)")
        
        searchsWord = searchText//search text bizim değişkenimize eşlendi heryerden erişilsin diye
        
        if searchsWord != ""{// eğer arama alanı dolu ise makeSearch fonksiyonu çalışıp fetchrequest ile coredatada arama yapacak
            isItMakingSearch = true
            self.makeSearch(contact_name: searchText)
            
        }else{
            isItMakingSearch = false//boşsa bişi olmucak tüm kişiler çağrılacak
            self.getAllContacts()
        }
        tableView.reloadData()//her arama sonrası table view güncellenecek
    }
    //----------------------------------------------------------------------------------------------------------
}
