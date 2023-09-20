//
//  ViewController.swift
//  StarApp
//
//  Created by Suleyman YAZICI on 1.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var stars = [Star]()
    var kullaniciSecimi : Star?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadData()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    func loadData(){
        
        let ahmet = Star(isim: "Ahmet", soyisim: "Adem", resim: UIImage(named: "surat1")!)
        let sulo =  Star(isim: "Süleyman", soyisim: "Paça", resim: UIImage(named: "surat2")!)
        let silo = Star(isim: "Süleyman", soyisim: "Yazıcı", resim: UIImage(named: "surat3")!)
        let umut = Star(isim: "Umut", soyisim: "Gürkan", resim: UIImage(named: "surat4")!)
        let parlak = Star(isim: "Furkan", soyisim: "Parlak", resim: UIImage(named: "surat5")!)
        let ozbey = Star(isim: "Furkan", soyisim: "Özbey", resim: UIImage(named: "surat6")!)
        
        stars.append(ahmet)
        stars.append(ozbey)
        stars.append(umut)
        stars.append(sulo)
        stars.append(silo)
        stars.append(parlak)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let row = stars[indexPath.row]
        cell.textLabel?.text = row.isim + " " + row.soyisim
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = stars[indexPath.row]
        performSegue(withIdentifier: "detail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            let desVC = segue.destination as! DetailViewController
            desVC.secilenStar = kullaniciSecimi
        }
    }
    
}

    



