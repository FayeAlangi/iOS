//
//  RecycleViewController.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/19/23.
//

import UIKit



class ClothingDonationViewController: UIViewController {
    
    
    @IBOutlet weak var zipCodeLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(hue: 0.3806, saturation: 0.13, brightness: 1, alpha: 1.0)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     Get the new view controller using segue.destination.
     Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "zipCodeSearch"){
            let vc = segue.destination as! ClothingDonationCenterViewController
            guard let zipCode = zipCodeLabel.text,
                  !zipCode.isEmpty else {
            showMissingFieldsAlert()
            return}
            vc.zipcode = zipCode
          
            
        }
    }
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "You need to enter zip code", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}


