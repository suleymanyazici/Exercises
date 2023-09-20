//
//  ViewController.swift
//  SuratiYakala
//
//  Created by Suleyman YAZICI on 29.06.2023.
//

import UIKit

class ViewController: UIViewController {
    // Variables
    var timer = Timer()
    var imageTimer = Timer()
    var counter = 0
    var score = 0
    var highScore = 0
    var ivArray = [UIImageView]()
    let items = [UIImage(named: "surat1"), UIImage(named: "surat2"), UIImage(named: "surat3"), UIImage(named: "surat4"), UIImage(named: "surat5"), UIImage(named: "surat6")]
    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var iv1: UIImageView!
    @IBOutlet weak var iv2: UIImageView!
    @IBOutlet weak var iv3: UIImageView!
    @IBOutlet weak var iv4: UIImageView!
    @IBOutlet weak var iv5: UIImageView!
    @IBOutlet weak var iv6: UIImageView!
    @IBOutlet weak var iv7: UIImageView!
    @IBOutlet weak var iv8: UIImageView!
    @IBOutlet weak var iv9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if highScore == nil{
            highScore = 0
            highScoreLabel.text = "High Score : \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High Score : \(highScore)"
        }
        
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        imageTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(imageCountDown), userInfo: nil, repeats: true)
        
        //images
        iv1.isUserInteractionEnabled = true
        iv2.isUserInteractionEnabled = true
        iv3.isUserInteractionEnabled = true
        iv4.isUserInteractionEnabled = true
        iv5.isUserInteractionEnabled = true
        iv6.isUserInteractionEnabled = true
        iv7.isUserInteractionEnabled = true
        iv8.isUserInteractionEnabled = true
        iv9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        iv1.addGestureRecognizer(recognizer1)
        iv2.addGestureRecognizer(recognizer2)
        iv3.addGestureRecognizer(recognizer3)
        iv4.addGestureRecognizer(recognizer4)
        iv5.addGestureRecognizer(recognizer5)
        iv6.addGestureRecognizer(recognizer6)
        iv7.addGestureRecognizer(recognizer7)
        iv8.addGestureRecognizer(recognizer8)
        iv9.addGestureRecognizer(recognizer9)
        
        ivArray = [iv1,iv2,iv3,iv4,iv5,iv6,iv7,iv8,iv9]
        
        
        
    }
    @objc func countDown(){
        counter = counter - 1
        timeLabel.text = String(counter)
        
        if counter == 0{
            print("Timer Bitti!!")
            timeLabel.text = ("Timer Bitti!!")
            timer.invalidate()//Timer durdurucu
            imageTimer.invalidate()
            
            for array in ivArray {
                array.isHidden = true
            }
            
            if self.score > self.highScore{
                self.highScore = self.score
                highScoreLabel.text = "High Score : \(highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            
            
            let alert = UIAlertController(title: "Time İs Up!", message: "Do you want to play again?", preferredStyle: .alert)
            let closeButton = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            let retryButton = UIAlertAction(title: "Retry", style: .default){ (UIAlertAction) in
                
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                self.score = 0
                self.scoreLabel.text = "Score : \(self.score)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.imageTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.imageCountDown), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(closeButton)
            alert.addAction(retryButton)
            self.present(alert, animated: true,completion: nil)
        }
    }
    @objc func imageCountDown() {
        for array in ivArray {
            array.isHidden = true
        }

        let hideRandom = Int(arc4random_uniform(UInt32(ivArray.count - 1)))
        ivArray[hideRandom].isHidden = false

        for i in 0..<ivArray.count {
            let randomIndex = Int(arc4random_uniform(UInt32(items.count)))
            ivArray[i].image = items[randomIndex]
        }
    }
    
    @objc func increaseScore(){
        score = score + 1
        scoreLabel.text = "Score : \(score) "
    }
     
}

