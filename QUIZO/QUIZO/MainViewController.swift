//
//  MainViewController.swift
//  QUIZO
//
//  Created by STUDENT on 4/22/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var Quiztime: UIImageView!
    
    
    @IBAction func playButtonPressed(_ sender: Any) {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondpageViewController") as! SecondpageViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
        
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

